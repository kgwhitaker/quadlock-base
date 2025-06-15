//
// A base for mounting Quadlock accessories to.
//

// The Belfry OpenScad Library, v2:  https://github.com/BelfrySCAD/BOSL2
// This library must be installed in your instance of OpenScad to use this model.
include <BOSL2/std.scad>
include <BOSL2/gears.scad>


// *** Model Parameters ***
/* [Model Parameters] */


// *** "Private" variables ***
/* [Hidden] */

// OpenSCAD System Settings
$fa = 1;
$fs = 0.4;

// Calculated Global Vars

//
// Quadlock Base
//
module quadlock_base() {
    screw_shaft_diameter = 5;
    inset_diameter = 14;
    inset_depth = 1.5;

    gear_thickness = 1;
    base_height = 2;


    difference() {
        union() {
            // 21.6 for the gear
            cylinder(d=24.5, h=base_height, center=true);
            translate([0, 0, base_height - (gear_thickness / 2)]) {
                color("red")
                spur_gear(circ_pitch=1.7, teeth=36, thickness=gear_thickness, shaft_diam=6, pressure_angle=0, clearance=1);
            }   
        }

        // screw shaft
        cylinder(d=screw_shaft_diameter, h=3, center=true, anchor=BOTTOM);

        // inset where the shoulder sits.
        translate([0,0,base_height - (inset_depth / 2)]) {
            color("blue")
            cylinder(d=inset_diameter, h=inset_depth + 0.1, center=true, anchor=BOTTOM);
        }
    }



}

quadlock_base();
 
