//
// A base for mounting Quad Lock 360 accessories to.
//

// The Belfry OpenScad Library, v2:  https://github.com/BelfrySCAD/BOSL2
// This library must be installed in your instance of OpenScad to use this model.
include <BOSL2/std.scad>
include <BOSL2/gears.scad>

// OpenSCAD System Settings
$fa = 1;
$fs = 0.4;

//
// Base for the Quad Lock 360 accessories.
//
// Parameters:
//
// base_height = The height of the base below the locking gear.
// base_diameter = The diameter of the base below the locking gear.
// screw_shaft_diameter = Diameter of the screw shaft.
//
module quadlock_base(base_height = 6, base_diameter = 24.5, screw_shaft_diameter = 5.5) {
    
    inset_diameter = 14;
    inset_depth = 2;

    gear_thickness = 1;
    overlap_tolerance = 0.1;

    union () {
        difference() {
            union() {
                cyl(d=base_diameter, h=base_height, center=true, rounding2=1);
                translate([0, 0, (base_height / 2) + (gear_thickness / 2)]) {
                    spur_gear(circ_pitch=1.7, teeth=36, thickness=gear_thickness, shaft_diam=6, pressure_angle=0, clearance=1);
                }   
            }
            // screw shaft
            cyl(d=screw_shaft_diameter, h=base_height + overlap_tolerance, center=true);

            // inset where the shoulder sits.
            inset_z = (base_height/2 + gear_thickness) - inset_depth / 2;
            translate([0,0,inset_z]) {
                cyl(d=inset_diameter, h=inset_depth + overlap_tolerance, center=true, chamfer2=-0.5, chamfang=30);
            }
        }
    }
}

quadlock_base(base_height=10, screw_shaft_diameter=5.5, base_diameter = 25);
 
