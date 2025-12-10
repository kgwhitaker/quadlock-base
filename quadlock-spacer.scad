//
// Uses the quadlock-base to create a male/female spacer.
//

// The quad lock base component.
include <quadlock-base.scad>

// *** Model Parameters ***
/* [Model Parameters] */

// Overall length of the spacer.
spacer_len = 10;

// Diameter of the spacer.
spacer_diameter = 25;

// Screw shaft diameter that goes through the spacer.
screw_shaft_diameter = 5.5;

// *** "Private" variables ***
/* [Hidden] */

// OpenSCAD System Settings - smooth curves.
$fa = 1;
$fs = 0.4;

//
// Instantiate the quadlock base as the foundational component for the spacer.
//
module spacer_base() {
  quadlock_base(base_height=spacer_len - gear_thickness, screw_shaft_diameter=screw_shaft_diameter, 
      base_diameter=spacer_diameter, round_bottom = true);
}

//
// Creates the female end of the spacer using the component as a cut-out.
//
module female_cutout() {
  // overlap tolerance. 
  tol = 1;

  cutout_height = 2;

  z_offset = -((spacer_len + gear_thickness) / 2);
  translate([0, 0, z_offset])
    quadlock_base(base_height=cutout_height, 
      screw_shaft_diameter=screw_shaft_diameter, base_diameter=spacer_diameter + tol,
      female_cutout = true);

}

//
// Builds the whole model.
//
module build_model() {

  difference() {
    spacer_base();

    female_cutout();
  }

      // female_cutout();

}

build_model();
