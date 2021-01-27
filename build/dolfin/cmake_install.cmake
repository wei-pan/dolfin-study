# Install script for directory: /home/wpan/DATA/fenics/dolfin/dolfin

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "RelWithDebInfo")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelopmentx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES "/home/wpan/DATA/fenics/dolfin/dolfin/dolfin.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelopmentx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/dolfin/common" TYPE FILE FILES "/home/wpan/DATA/fenics/dolfin/build/dolfin/common/version.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelopmentx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/dolfin/adaptivity" TYPE FILE FILES
    "/home/wpan/DATA/fenics/dolfin/dolfin/adaptivity/adapt.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/adaptivity/AdaptiveLinearVariationalSolver.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/adaptivity/AdaptiveNonlinearVariationalSolver.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/adaptivity/adaptivesolve.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/adaptivity/dolfin_adaptivity.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/adaptivity/ErrorControl.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/adaptivity/Extrapolation.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/adaptivity/GenericAdaptiveVariationalSolver.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/adaptivity/GoalFunctional.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/adaptivity/marking.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/adaptivity/TimeSeries.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelopmentx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/dolfin/ale" TYPE FILE FILES
    "/home/wpan/DATA/fenics/dolfin/dolfin/ale/ALE.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/ale/dolfin_ale.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/ale/HarmonicSmoothing.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/ale/MeshDisplacement.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelopmentx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/dolfin/common" TYPE FILE FILES
    "/home/wpan/DATA/fenics/dolfin/dolfin/common/Array.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/common/ArrayView.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/common/constants.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/common/defines.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/common/dolfin_common.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/common/dolfin_doc.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/common/Hierarchical.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/common/IndexSet.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/common/init.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/common/MPI.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/common/NoDeleter.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/common/RangedIndexSet.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/common/Set.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/common/SubSystemsManager.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/common/Timer.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/common/timing.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/common/types.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/common/UniqueIdGenerator.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/common/utils.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/common/Variable.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelopmentx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/dolfin/fem" TYPE FILE FILES
    "/home/wpan/DATA/fenics/dolfin/dolfin/fem/assemble.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/fem/assemble_local.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/fem/AssemblerBase.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/fem/Assembler.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/fem/BasisFunction.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/fem/DirichletBC.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/fem/DiscreteOperators.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/fem/DofMapBuilder.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/fem/DofMap.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/fem/dolfin_fem.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/fem/Equation.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/fem/fem_utils.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/fem/FiniteElement.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/fem/Form.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/fem/GenericDofMap.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/fem/LinearTimeDependentProblem.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/fem/LinearVariationalProblem.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/fem/LinearVariationalSolver.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/fem/LocalAssembler.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/fem/LocalSolver.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/fem/MixedAssembler.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/fem/MixedLinearVariationalProblem.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/fem/MixedLinearVariationalSolver.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/fem/MultiMeshAssembler.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/fem/MultiMeshDirichletBC.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/fem/MultiMeshDofMap.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/fem/MultiMeshForm.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/fem/NonlinearVariationalProblem.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/fem/NonlinearVariationalSolver.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/fem/MixedNonlinearVariationalProblem.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/fem/MixedNonlinearVariationalSolver.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/fem/PETScDMCollection.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/fem/PointSource.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/fem/solve.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/fem/SparsityPatternBuilder.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/fem/SystemAssembler.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/fem/UFC.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelopmentx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/dolfin/function" TYPE FILE FILES
    "/home/wpan/DATA/fenics/dolfin/dolfin/function/assign.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/function/CoefficientAssigner.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/function/Constant.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/function/dolfin_function.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/function/Expression.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/function/FunctionAssigner.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/function/FunctionAXPY.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/function/Function.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/function/FunctionSpace.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/function/GenericFunction.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/function/LagrangeInterpolator.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/function/MultiMeshCoefficientAssigner.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/function/MultiMeshFunction.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/function/MultiMeshFunctionSpace.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/function/MultiMeshSubSpace.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/function/SpecialFacetFunction.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/function/SpecialFunctions.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelopmentx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/dolfin/generation" TYPE FILE FILES
    "/home/wpan/DATA/fenics/dolfin/dolfin/generation/BoxMesh.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/generation/dolfin_generation.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/generation/IntervalMesh.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/generation/RectangleMesh.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/generation/SphericalShellMesh.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/generation/UnitCubeMesh.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/generation/UnitDiscMesh.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/generation/UnitIntervalMesh.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/generation/UnitSquareMesh.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/generation/UnitTetrahedronMesh.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/generation/UnitTriangleMesh.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelopmentx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/dolfin/geometry" TYPE FILE FILES
    "/home/wpan/DATA/fenics/dolfin/dolfin/geometry/BoundingBoxTree1D.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/geometry/BoundingBoxTree2D.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/geometry/BoundingBoxTree3D.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/geometry/BoundingBoxTree.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/geometry/CGALExactArithmetic.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/geometry/CollisionPredicates.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/geometry/ConvexTriangulation.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/geometry/dolfin_geometry.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/geometry/GenericBoundingBoxTree.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/geometry/GeometryDebugging.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/geometry/GeometryPredicates.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/geometry/intersect.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/geometry/IntersectionConstruction.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/geometry/MeshPointIntersection.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/geometry/Point.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/geometry/predicates.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/geometry/SimplexQuadrature.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelopmentx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/dolfin/graph" TYPE FILE FILES
    "/home/wpan/DATA/fenics/dolfin/dolfin/graph/BoostGraphColoring.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/graph/BoostGraphOrdering.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/graph/CSRGraph.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/graph/dolfin_graph.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/graph/GraphBuilder.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/graph/GraphColoring.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/graph/Graph.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/graph/ParMETIS.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/graph/SCOTCH.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/graph/ZoltanInterface.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelopmentx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/dolfin/io" TYPE FILE FILES
    "/home/wpan/DATA/fenics/dolfin/dolfin/io/base64.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/io/dolfin_io.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/io/Encoder.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/io/File.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/io/GenericFile.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/io/HDF5Attribute.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/io/HDF5File.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/io/HDF5Interface.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/io/HDF5Utility.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/io/RAWFile.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/io/SVGFile.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/io/VTKFile.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/io/VTKWriter.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/io/X3DFile.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/io/X3DOM.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/io/XDMFFile.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/io/XMLArray.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/io/XMLFile.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/io/XMLFunctionData.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/io/XMLMeshFunction.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/io/XMLMesh.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/io/XMLMeshValueCollection.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/io/XMLParameters.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/io/XMLTable.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/io/xmlutils.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/io/XMLVector.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/io/XYZFile.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelopmentx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/dolfin/la" TYPE FILE FILES
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/Amesos2LUSolver.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/BelosKrylovSolver.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/BlockMatrix.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/BlockVector.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/CoordinateMatrix.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/DefaultFactory.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/dolfin_la.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/EigenFactory.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/EigenKrylovSolver.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/EigenLUSolver.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/EigenMatrix.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/EigenVector.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/GenericLinearAlgebraFactory.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/GenericLinearOperator.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/GenericLinearSolver.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/GenericMatrix.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/GenericTensor.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/GenericVector.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/Ifpack2Preconditioner.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/IndexMap.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/KrylovSolver.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/LinearAlgebraObject.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/LinearOperator.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/LinearSolver.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/LUSolver.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/Matrix.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/MueluPreconditioner.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/PETScBaseMatrix.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/PETScFactory.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/PETScKrylovSolver.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/PETScLinearOperator.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/PETScLUSolver.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/PETScMatrix.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/PETScNestMatrix.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/PETScObject.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/PETScOptions.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/PETScPreconditioner.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/PETScVector.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/Scalar.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/SLEPcEigenSolver.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/solve.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/SparsityPattern.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/SUNDIALSNVector.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/TensorLayout.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/test_nullspace.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/TpetraFactory.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/TpetraMatrix.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/TpetraVector.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/TrilinosParameters.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/TrilinosPreconditioner.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/Vector.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/la/VectorSpaceBasis.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelopmentx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/dolfin/log" TYPE FILE FILES
    "/home/wpan/DATA/fenics/dolfin/dolfin/log/dolfin_log.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/log/Event.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/log/Logger.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/log/log.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/log/LogLevel.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/log/LogManager.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/log/LogStream.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/log/Progress.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/log/Table.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelopmentx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/dolfin/math" TYPE FILE FILES
    "/home/wpan/DATA/fenics/dolfin/dolfin/math/basic.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/math/dolfin_math.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/math/Lagrange.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/math/Legendre.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelopmentx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/dolfin/mesh" TYPE FILE FILES
    "/home/wpan/DATA/fenics/dolfin/dolfin/mesh/BoundaryComputation.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/mesh/BoundaryMesh.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/mesh/Cell.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/mesh/CellType.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/mesh/DistributedMeshTools.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/mesh/dolfin_mesh.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/mesh/DomainBoundary.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/mesh/DynamicMeshEditor.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/mesh/Edge.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/mesh/Face.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/mesh/FacetCell.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/mesh/Facet.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/mesh/HexahedronCell.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/mesh/IntervalCell.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/mesh/LocalMeshData.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/mesh/LocalMeshValueCollection.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/mesh/MeshColoring.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/mesh/MeshConnectivity.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/mesh/MeshData.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/mesh/MeshDomains.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/mesh/MeshEditor.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/mesh/MeshEntity.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/mesh/MeshEntityIteratorBase.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/mesh/MeshEntityIterator.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/mesh/MeshFunction.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/mesh/MeshGeometry.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/mesh/Mesh.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/mesh/MeshHierarchy.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/mesh/MeshOrdering.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/mesh/MeshPartitioning.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/mesh/MeshQuality.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/mesh/MeshRelation.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/mesh/MeshRenumbering.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/mesh/MeshSmoothing.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/mesh/MeshTopology.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/mesh/MeshTransformation.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/mesh/MeshValueCollection.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/mesh/MeshView.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/mesh/MultiMesh.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/mesh/PeriodicBoundaryComputation.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/mesh/PointCell.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/mesh/QuadrilateralCell.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/mesh/SubDomain.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/mesh/SubMesh.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/mesh/SubsetIterator.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/mesh/TetrahedronCell.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/mesh/TopologyComputation.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/mesh/TriangleCell.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/mesh/Vertex.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelopmentx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/dolfin/multistage" TYPE FILE FILES
    "/home/wpan/DATA/fenics/dolfin/dolfin/multistage/dolfin_multistage.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/multistage/MultiStageScheme.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/multistage/PointIntegralSolver.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/multistage/RKSolver.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelopmentx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/dolfin/nls" TYPE FILE FILES
    "/home/wpan/DATA/fenics/dolfin/dolfin/nls/dolfin_nls.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/nls/NewtonSolver.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/nls/NonlinearProblem.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/nls/OptimisationProblem.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/nls/PETScSNESSolver.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/nls/PETScTAOSolver.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/nls/TAOLinearBoundSolver.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelopmentx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/dolfin/parameter" TYPE FILE FILES
    "/home/wpan/DATA/fenics/dolfin/dolfin/parameter/dolfin_parameter.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/parameter/GlobalParameters.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/parameter/Parameter.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/parameter/Parameters.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelopmentx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/dolfin/refinement" TYPE FILE FILES
    "/home/wpan/DATA/fenics/dolfin/dolfin/refinement/BisectionRefinement1D.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/refinement/dolfin_refinement.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/refinement/LocalMeshCoarsening.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/refinement/ParallelRefinement.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/refinement/PlazaRefinementND.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/refinement/refine.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/refinement/RegularCutRefinement.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelopmentx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/dolfin/ts" TYPE FILE FILES
    "/home/wpan/DATA/fenics/dolfin/dolfin/ts/dolfin_ts.h"
    "/home/wpan/DATA/fenics/dolfin/dolfin/ts/CVode.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimeLibrariesx" OR NOT CMAKE_INSTALL_COMPONENT)
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libdolfin.so.2019.2.0.dev0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libdolfin.so.2019.2"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "/usr/local/lib:/home/wpan/DATA/petsc/arch-linux-c-debug/lib:/home/wpan/DATA/mpich/lib")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/wpan/DATA/fenics/dolfin/build/dolfin/libdolfin.so.2019.2.0.dev0"
    "/home/wpan/DATA/fenics/dolfin/build/dolfin/libdolfin.so.2019.2"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libdolfin.so.2019.2.0.dev0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libdolfin.so.2019.2"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHANGE
           FILE "${file}"
           OLD_RPATH "/usr/local/lib:/home/wpan/DATA/petsc/arch-linux-c-debug/lib:/home/wpan/DATA/mpich/lib:"
           NEW_RPATH "/usr/local/lib:/home/wpan/DATA/petsc/arch-linux-c-debug/lib:/home/wpan/DATA/mpich/lib")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/usr/bin/strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimeLibrariesx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libdolfin.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libdolfin.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libdolfin.so"
         RPATH "/usr/local/lib:/home/wpan/DATA/petsc/arch-linux-c-debug/lib:/home/wpan/DATA/mpich/lib")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/wpan/DATA/fenics/dolfin/build/dolfin/libdolfin.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libdolfin.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libdolfin.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libdolfin.so"
         OLD_RPATH "/usr/local/lib:/home/wpan/DATA/petsc/arch-linux-c-debug/lib:/home/wpan/DATA/mpich/lib:"
         NEW_RPATH "/usr/local/lib:/home/wpan/DATA/petsc/arch-linux-c-debug/lib:/home/wpan/DATA/mpich/lib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libdolfin.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/dolfin/cmake/DOLFINTargets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/dolfin/cmake/DOLFINTargets.cmake"
         "/home/wpan/DATA/fenics/dolfin/build/dolfin/CMakeFiles/Export/share/dolfin/cmake/DOLFINTargets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/dolfin/cmake/DOLFINTargets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/dolfin/cmake/DOLFINTargets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/dolfin/cmake" TYPE FILE FILES "/home/wpan/DATA/fenics/dolfin/build/dolfin/CMakeFiles/Export/share/dolfin/cmake/DOLFINTargets.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/dolfin/cmake" TYPE FILE FILES "/home/wpan/DATA/fenics/dolfin/build/dolfin/CMakeFiles/Export/share/dolfin/cmake/DOLFINTargets-relwithdebinfo.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelopmentx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/dolfin/cmake" TYPE FILE FILES
    "/home/wpan/DATA/fenics/dolfin/cmake/modules/FindPETSc.cmake"
    "/home/wpan/DATA/fenics/dolfin/cmake/modules/FindSLEPc.cmake"
    "/home/wpan/DATA/fenics/dolfin/build/dolfin/DOLFINConfig.cmake"
    "/home/wpan/DATA/fenics/dolfin/build/dolfin/DOLFINConfigVersion.cmake"
    "/home/wpan/DATA/fenics/dolfin/build/dolfin/UseDOLFIN.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelopmentx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/wpan/DATA/fenics/dolfin/build/dolfin.pc")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/wpan/DATA/fenics/dolfin/build/dolfin/adaptivity/cmake_install.cmake")
  include("/home/wpan/DATA/fenics/dolfin/build/dolfin/ale/cmake_install.cmake")
  include("/home/wpan/DATA/fenics/dolfin/build/dolfin/common/cmake_install.cmake")
  include("/home/wpan/DATA/fenics/dolfin/build/dolfin/fem/cmake_install.cmake")
  include("/home/wpan/DATA/fenics/dolfin/build/dolfin/function/cmake_install.cmake")
  include("/home/wpan/DATA/fenics/dolfin/build/dolfin/generation/cmake_install.cmake")
  include("/home/wpan/DATA/fenics/dolfin/build/dolfin/geometry/cmake_install.cmake")
  include("/home/wpan/DATA/fenics/dolfin/build/dolfin/graph/cmake_install.cmake")
  include("/home/wpan/DATA/fenics/dolfin/build/dolfin/io/cmake_install.cmake")
  include("/home/wpan/DATA/fenics/dolfin/build/dolfin/la/cmake_install.cmake")
  include("/home/wpan/DATA/fenics/dolfin/build/dolfin/log/cmake_install.cmake")
  include("/home/wpan/DATA/fenics/dolfin/build/dolfin/math/cmake_install.cmake")
  include("/home/wpan/DATA/fenics/dolfin/build/dolfin/mesh/cmake_install.cmake")
  include("/home/wpan/DATA/fenics/dolfin/build/dolfin/multistage/cmake_install.cmake")
  include("/home/wpan/DATA/fenics/dolfin/build/dolfin/nls/cmake_install.cmake")
  include("/home/wpan/DATA/fenics/dolfin/build/dolfin/parameter/cmake_install.cmake")
  include("/home/wpan/DATA/fenics/dolfin/build/dolfin/refinement/cmake_install.cmake")
  include("/home/wpan/DATA/fenics/dolfin/build/dolfin/ts/cmake_install.cmake")

endif()

