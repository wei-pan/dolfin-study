X3DOM Support
-------------

Author: Peter Scott

The files included in 'utils/x3dom' are support for visualizing
solutions using the X3DOM framework.

The functions included in the javascript file 'x3dom_support.js' are
meant to allow for dynamic interaction with the visualized data. There
are functions for converting the x3dom representation of vertices (a
1d array of numbers) into a 3 dimensional representation, as well as
for converting back to the x3dom representation. There are functions
to add to and remove color from x3dom shapes as well as functions for
adding a warped representation of the shape to the x3dom
scene. Currently, only warping by a scalar is supported and the warp
factor is determined by user input (using a slider). There are
functions for adjusting the opacity, though currently these are not
used since selection of shapes is necessary for adjusting opacity.
Finally, there are functions to set up the ui functionality: these
functions set up what happens on user interaction with the x3dom menu
display.

The 'x3dom_support.css' file is used to style the menu display. The
different components of the menu are given certain styles to ensure a
uniform look as well as to ensure that the display does not cover up
too much of the x3dom scene.
