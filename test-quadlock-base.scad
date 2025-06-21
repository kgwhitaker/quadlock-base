
//
// Instantiates an Quad Lock Base for testing.
//

// The quad lock base component.
include <quadlock-base.scad>

// OpenSCAD System Settings
$fa = 1;
$fs = 0.4;

quadlock_base(base_height=10, screw_shaft_diameter=5.5, base_diameter = 25);
