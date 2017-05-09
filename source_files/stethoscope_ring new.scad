// Modified by Doug Williams, May 2017
// Changes height of bottom ring and width of side wall to fix manufacturability issue


$outside_width = 21; //Radius of outside wall (mm)  orig 41.5/2
$inside_width_diaphragm = 18; // Inside radius of diaphragm (mm)
$inside_width_wall = 20; //Inside radius of wall (mm)
$bottom_ring_height = 1;  // height of bottom ring in (mm)  orig 0.5

// Bottom ring
module bottom_ring($fn=360) {
    difference() {
        cylinder(h = $bottom_ring_height, r = $outside_width);
        cylinder(h = $bottom_ring_height, r = $inside_width_diaphragm);
    }
}

// Side wall
module side_wall($fn=360) {
    difference() {
        cylinder(h = 6, r = $outside_width);
        cylinder(h = 6, r = $inside_width_wall);
    }
}

//Compile both rings
union() {
    bottom_ring();
    side_wall();
}