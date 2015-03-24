// Dreamster parametric prototype chassis V1 


// Default resolution (set it lower for faster rendering)
$fn = 50;


// Chassis parameters
depth = 95;
width = 90;
height_wall = 25+8;
thickness = 4;
thickness_wall = 5;
inner_frame = 35;
mount_holes_diameter = 3;

module distance_sensor() {
  radio = 16.3 / 2;
  sep = 25.7;
  translate([-10, -(radio)-(sep-2*radio)/2, 0]) {
	rotate ([0, 90, 0]) {
		cylinder (h = 20, r = radio);
		translate ([0, sep, 0]) {
			cylinder (h = 20, r = radio);
		}
	}
}
}

module base() {
  inn_width = width - inner_frame;
  inn_depth = depth - inner_frame;
  difference() {
    cube([width, depth, thickness], center=true);
    cube([inn_width, inn_depth, thickness+1], center=true);
  }
}

module side_wall() {
  difference() {
    cube([thickness_wall, depth, height_wall], center=true);
    translate([0, -43/2-2, height_wall/2]) {
      distance_sensor();
    }
    translate([0, 43/2+2, height_wall/2]) {
      distance_sensor();
    }
  }
}

module front_wall() {
  difference() {
    cube([thickness_wall, 50, height_wall], center=true);
    translate([0,0,height_wall/2]) {
      distance_sensor();
    }
  }
}


base();
translate([width/2-thickness_wall/2, 0, height_wall/2+thickness/2]) {
  side_wall();
}
translate([-(width/2-thickness_wall/2), 0, height_wall/2+thickness/2]) {
  side_wall();
}
translate([0, depth/2-thickness_wall/2-7, height_wall/2+thickness/2]) {
  rotate([0, 0, 90]) {
    front_wall();
  }
}
