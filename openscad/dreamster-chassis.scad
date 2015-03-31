// Dreamster parametric prototype chassis V1 


// Default resolution (set it lower for faster rendering)
$fn = 50;


// Chassis parameters
depth = 95;
width = 90;
height_wall = 25+8+1.5;
thickness = 3;
thickness_wall = 3;
mount_holes_diameter = 3;
hole_width = 40;
hole_depth = 50;
hole_pos_y = 10;

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
  difference() {
    cube([width, depth, thickness], center=true);
    translate([0, -hole_pos_y, 0]) {
      cube([hole_width, hole_depth, thickness+1], center=true);
    }
	translate([-37, -depth/2 + 30, -3]) {
		cube([3, 25, 6], center=false);
	}
	translate([35, -depth/2 + 30, -3]) {
		cube([3, 25, 6], center=false);
	}
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


