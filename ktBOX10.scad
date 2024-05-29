//
// ktBOX10
//
//





gap1 = 0.001;
gap2 = 0.002;
th = 2;

X = 154;
XX = 10;
Y = 43;
Z = th;


bottom();
translate([-15, th, X]) rotate([180, 0, 180]) upper();


module bottom()
{
difference()
{
    union()
    {
        base();
        c();
    }
    translate([th, 0, th]) scale([0.9, 0.9, 0.975]) base();
}
difference()
{
    translate([0, 20, X/2-5/2]) rotate([0, 0, -20]) cube([35, 40, 5]);
    base_diff();
}
}


module base()
{
difference()
{
    linear_extrude(X) polygon([[0,0],[ 38,0],[18,42],[10,42]]);
    translate([0, 10, X]) rotate([-20, 0, 0]) cube([40, 50, 20]);
    translate([40, 10, 0]) rotate([180-20, 0, 180]) cube([40, 50, 20]);
}
}

module base_diff()
{
difference()
{
    translate([-100/2, 0, 0]) cube([100, 100, 200]);
    base();
}
}



module upper()
{
difference()
{
    union()
    {
        d();
        translate([-1, -th, X/2-23/2]) cube([2, th, 23]);
        translate([0, -th, 0]) cube([38, th, X]);
        translate([38-1, -th, X/2-30/2]) cube([th, 3, 30]);
    }
    base();
    translate([-10, -th-th, 0]) cube([38+20, th, X]);

}
}
module upper_diff()
{
    translate([0, 0, -50]) cube([70,70,100], center=true);
    translate([0, 0, -18/2]) cylinder(18, 70/2, 70/2, $fn=100);
}



module c()
{
translate([-6.5/2, 6.5, X/2]) rotate([0, -90, 0])difference()
{
    union()
    {
        translate([-70.3/2, 0, -9]) rotate([0, 0, -90]) hinge();
        translate([70.3/2-70/3+0.3, 0, -9]) rotate([0, 0, -90]) hinge();
        translate([-70/2, -6.5, -9]) cube([70, 6.5, 8-2]);
        
        translate([-55/2, -6.5/2, -10+8+2]) rotate([90, 0, 90]) cylinder( 1, 2, 2, center=true, $fn=30 );
    }
    translate([-55/2, -6.5/2, -10+8+2]) rotate([90, 0, 90]) cylinder( 1+gap2, 1, 1, center=true, $fn=30 );
}
}



module d()
{
translate([-6.5/2, 6.5, X/2]) rotate([0, 90, 0]) difference()
{
    union()
    {
        translate([(70/3)/2-0.3/2, 0, 9]) rotate([0, 180, 90]) hinge_m();
        //translate([-70.3/2+70.3/3, -6.5-th, 9-(8-2)-(8-2)/2]) cube([70.3/3, th, (8-2)/2]);
    }
}
}






module hinge()
{
h = 7;
hinge_x = 6.5;
hinge_y = 70/3-0.3;
hinge_hole = 1.1+0.4;
difference()
{
    union()
    {
        cube( [hinge_x, hinge_y, h+th] );
        translate( [hinge_x/2+0.25, hinge_y/2, h+th] ) rotate( [90, 0, 0] ) cylinder( hinge_y, hinge_x/2-0.25, hinge_x/2-0.25, center=true, $fn=30 );
    }
    translate( [hinge_x/2+0.25, hinge_y/2, h+th] )
    rotate( [90, 0, 0] ) cylinder( hinge_y+gap2, hinge_hole, hinge_hole, center=true, $fn=30 );
}
}


module hinge_m()
{
h = 7;
hinge_x = 6.5;
hinge_y = 70/3-0.3;
hinge_hole = 1.1+0.4;
difference()
{
    union()
    {
        translate([6.5/2, 0, 6.5/2+2.8]) cube( [hinge_x-1.2, hinge_y, h+th-2.8-2] );
        translate( [hinge_x/2+0.25, hinge_y/2, h+th] ) rotate( [90, 0, 0] ) cylinder( hinge_y, hinge_x/2-0.25, hinge_x/2-0.25, center=true, $fn=30 );
    }
    translate( [hinge_x/2+0.25, hinge_y/2, h+th] )
    rotate( [90, 0, 0] ) cylinder( hinge_y+gap2, hinge_hole, hinge_hole, center=true, $fn=30 );
    
    translate([6.5/2+7.9, 0, 6.5/2+2.8-2]) rotate([0, -38, 0]) cube( [hinge_x-1.2, hinge_y, h+th-2.8-2+5] );
}
}