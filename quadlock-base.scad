//
// A base for mounting Quadlock accessories to.
//

// The Belfry OpenScad Library, v2:  https://github.com/BelfrySCAD/BOSL2
// This library must be installed in your instance of OpenScad to use this model.
include <BOSL2/std.scad>
include <BOSL2/gears.scad>


// *** Model Parameters ***
/* [Model Parameters] */

shaft_diameter = 6;


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
    difference() {
        union() {
            cylinder(d=22.4, h=2, center=true, anchor=BOTTOM);
            translate([0, 0, 1]) {
                color("red")
                spur_gear(circ_pitch=1.75, teeth=36, thickness=1, shaft_diam=6, pressure_angle=1, anchor=BOTTOM);
            }   
        }

        cylinder(d=shaft_diameter, h=3, center=true, anchor=BOTTOM);

    }
}

quadlock_base();
 
