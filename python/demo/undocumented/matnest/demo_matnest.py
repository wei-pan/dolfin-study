# Copyright (C) 2016 Garth N. Wells and Chris N. Richardson
#
# This file is part of DOLFIN.
#
# DOLFIN is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# DOLFIN is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with DOLFIN. If not, see <http://www.gnu.org/licenses/>.

from dolfin import *

if not has_linear_algebra_backend("PETSc"):
    print("DOLFIN has not been configured with PETSc. Exiting.")
    exit()

PETScOptions.set("ksp_view");
PETScOptions.set("ksp_monitor_true_residual");
PETScOptions.set("pc_type", "fieldsplit");
PETScOptions.set("pc_fieldsplit_type", "additive");

PETScOptions.set("fieldsplit_0_ksp_type", "preonly");
PETScOptions.set("fieldsplit_0_pc_type", "gamg");
PETScOptions.set("fieldsplit_0_pc_gamg_coarse_eq_limit", 10000);
PETScOptions.set("fieldsplit_0_pc_gamg_threshold", 0.05);
PETScOptions.set("fieldsplit_0_mg_levels_ksp_type", "chebyshev");
PETScOptions.set("fieldsplit_0_mg_levels_pc_type", "sor");
PETScOptions.set("fieldsplit_0_mg_levels_ksp_max_it", 3);
PETScOptions.set("fieldsplit_0_mg_levels_esteig_ksp_type", "cg");
PETScOptions.set("fieldsplit_0_mg_levels_ksp_chebyshev_esteig_steps", 20);
PETScOptions.set("fieldsplit_0_mg_levels_ksp_chebyshev_esteig_random");
PETScOptions.set("fieldsplit_0_mg_coarse_ksp_type", "preonly");
PETScOptions.set("fieldsplit_0_mg_coarse_pc_type", "lu");
PETScOptions.set("fieldsplit_0_mg_coarse_pc_factor_mat_solver_package", "mumps");
PETScOptions.set("fieldsplit_1_pc_factor_mat_solver_package", "mumps");
PETScOptions.set("fieldsplit_1_ksp_type", "preonly");
PETScOptions.set("fieldsplit_1_pc_type", "lu");

# Sub domain for top and bottom
def TopBottom(x, on_boundary):
    return abs(1.0 - x[1]) < DOLFIN_EPS or abs(x[1]) < DOLFIN_EPS

mesh = UnitCubeMesh(12, 12, 12);

# Create function spaces
P2 = VectorElement("Lagrange", mesh.ufl_cell(), 2)
P1 = FiniteElement("Lagrange", mesh.ufl_cell(), 1)
V = FunctionSpace(mesh, P2)
Q = FunctionSpace(mesh, P1)

u = TrialFunction(V)
p = TrialFunction(Q)
v = TestFunction(V)
q = TestFunction(Q)

# Define forms for each block
a00 = inner(grad(u), grad(v))*dx
a01 = -div(v)*p*dx
a10 = -div(u)*q*dx
# Preconditiner uses pressure mass matrix
p11 = p*q*dx

f = Constant((0.0, 1.0, 0.0))
g = Constant(0.0)
L0 = dot(f, v)*dx
L1 = dot(g, q)*dx

# Velocity BC
flow_velocity = Constant((0.0, 0.0, 0.0));
bc0 = DirichletBC(V, flow_velocity, TopBottom)

# Assemble all blocks with BCs
bcsV = [bc0]
bcsQ = []

assemblerA = SystemAssembler([a00, a01, a10, None], [L0, L1], [bcsV, bcsQ])

A00 = PETScMatrix()
A01 = PETScMatrix()
A10 = PETScMatrix()

b0 = PETScVector()
b1 = PETScVector()

assemblerA.assemble([A00, A01, A10, None], [b0, b1])

P11 = PETScMatrix()
assemblerP = SystemAssembler(p11, L1, bcsQ)
assemblerP.assemble(P11)

print("A00 = ", A00.size(0), "x" , A00.size(1), A00.norm("frobenius"))
print("A01 = ", A01.size(0), "x" , A01.size(1), A01.norm("frobenius"))
print("A10 = ", A10.size(0), "x" , A10.size(1), A10.norm("frobenius"))
print("P11 = ", P11.size(0), "x" , P11.size(1), P11.norm("frobenius"))

# Combine matrices
AA = PETScNestMatrix([A00, A01, A10, None])
PP = PETScNestMatrix([A00, None, None, P11])

# Create solution vectors
u = Function(V)
u.rename('u','velocity')
p = Function(Q)
p.rename('p','pressure')
# Map RHS and solution into block space vectors
x = Vector()
b = Vector()
AA.init_vectors(x, [u.vector(), p.vector()])
AA.init_vectors(b, [b0, b1])

solver = PETScKrylovSolver("minres")
solver.set_from_options()
solver.set_operators(AA, PP)

fields = [PETScNestMatrix.get_block_dofs(AA, i) for i in [0,1]]
PETScPreconditioner.set_fieldsplit(solver, fields, ["0", "1"])

solver.solve(x, b)

print("u.norm = ", u.vector().norm("l2"))

if has_hdf5_parallel():
    xdmf = XDMFFile("solution.xdmf")
    xdmf.write(u)
    xdmf.write(p)
