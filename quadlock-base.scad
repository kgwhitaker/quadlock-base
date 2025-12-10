//
// A base for mounting Quad Lock 360 accessories to.
//

// The Belfry OpenScad Library, v2:  https://github.com/BelfrySCAD/BOSL2
// This library must be installed in your instance of OpenScad to use this model.
include <BOSL2/std.scad>
include <BOSL2/gears.scad>

// Thickness of the gear for the Quad Lock interface. 
gear_thickness = 1;

//
// Base for the Quad Lock 360 accessories.
//
// Parameters:
//
// base_height = The height of the base below the locking gear.
// base_diameter = The diameter of the base below the locking gear.
// screw_shaft_diameter = Diameter of the screw shaft.
// round_bottom = True indicates that the bottom of the component is to be rounded in addition to the top (where the mating gear is located)
//
module quadlock_base(
  base_height = 6,
  base_diameter = 24.5,
  screw_shaft_diameter = 5.5,
  round_bottom = false,
  female_cutout = false
) {

  overlap_tolerance = 0.1;

  rounding = 1;
  
  inset_depth = 2;

  bott_round = round_bottom ? rounding : 0;

  // Adjust chamfers if this is a cutout for a female component
  inset_chamfer = female_cutout ? 0 : -0.5;
  cutout_chamfer = female_cutout ? 0.5 : 0;
  inset_diameter = female_cutout ? 14.1 : 14;
  top_round = female_cutout ? 0 : rounding;
  inset_depth = female_cutout ? 1 : 2;



  union() {
    difference() {
      union() {
        cyl(d=base_diameter, h=base_height, center=true, rounding1=bott_round, rounding2=top_round);
        translate([0, 0, (base_height / 2) + (gear_thickness / 2)]) {
          spur_gear(circ_pitch=1.7, teeth=36, thickness=gear_thickness, shaft_diam=6, pressure_angle=0, clearance=1);
        }
      }
      // screw shaft
      cyl(d=screw_shaft_diameter, h=base_height + overlap_tolerance, center=true);

      // inset where the shoulder sits.
      inset_z = (base_height / 2 + gear_thickness) - inset_depth / 2;
      translate([0, 0, inset_z]) {
        cyl(d=inset_diameter, h=inset_depth + overlap_tolerance, center=true, chamfer2=inset_chamfer, chamfer1=cutout_chamfer, chamfang=30);
      }
    }
  }
}

//
// BOSL2 *Attachable* Base for the Quad Lock 360 accessories.
// See https://github.com/BelfrySCAD/BOSL2/wiki/attachments.scad for information on Attachments.
//
// Parameters:
//
// base_height = The height of the base below the locking gear.
// base_diameter = The diameter of the base below the locking gear.
// screw_shaft_diameter = Diameter of the screw shaft.
//
module attachable_quadlock_base(base_height = 6, base_diameter = 24.5, screw_shaft_diameter = 5.5) {
  attachable() {
    quadlock_base(base_height, base_diameter, screw_shaft_diameter);
    children();
  }
}
