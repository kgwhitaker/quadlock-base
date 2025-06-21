//
// Instantiates an *Attachable* Quad Lock Base for testing.
//

// The Belfry OpenScad Library, v2:  https://github.com/BelfrySCAD/BOSL2
// This library must be installed in your instance of OpenScad to use this model.
include <BOSL2/std.scad>

// The quad lock base component.
include <quadlock-base.scad>

// OpenSCAD System Settings
$fa = 1;
$fs = 0.4;

//
// Ensure it is the attachable component works.
//
prismoid(
  size1=[100, 33],
  size2=[80, 10],
  h=40,
  rounding1=10,
  rounding2=5
) {

  //  Position the quad lock base on the face of the prismoid.
  position(FRONT)
    orient(FRONT)
      attachable_quadlock_base(base_height=20, screw_shaft_diameter=5.5, base_diameter=25);
}
