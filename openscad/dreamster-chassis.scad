// Dreamster parametric prototype chassis V1 


// Default resolution (set it lower for faster rendering)
$fn = 50;


// Chassis parameters
depth = 100;
width = 120;
height = 20;
thickness = 1.5;
inner_frame = 25;
mount_holes_diameter = 3;

// Chassis body
difference() { 

	// Outer box
	cube ([depth, width, height]); 

	translate ([thickness / 2, thickness / 2, thickness / 2]) {
		// Inner space for pcb/motors
		cube ([depth - thickness, width - thickness, height + thickness * 2]);
	}

	translate ([inner_frame / 2, inner_frame / 2, thickness - 10]) {
		cube ([depth - inner_frame, width - inner_frame, height + thickness * 2]);
	}

	// Holes to bolt the PCB
	for (i = [
		[inner_frame / 4,         inner_frame / 4,         0 - thickness],
		[depth - inner_frame / 4, inner_frame / 4,         0 - thickness],
		[depth - inner_frame / 4, width - inner_frame / 4, 0 - thickness],
		[inner_frame / 4,         width - inner_frame / 4, 0 - thickness]
	]) {
		translate (i) 
		cylinder(h = thickness * 2, r = mount_holes_diameter / 2);
	}

	// Clearance for distance sensors
	for (i = [
		// FIXME: sizes must be relative to chassis size
		[-thickness,        20,         height], 
		[depth - thickness, width - 40, height],
		[-thickness,        width - 40, height],
		[depth - thickness, 20,         height]
	]) {
		translate(i)
		distance_sensor();
	}

	translate ([60, -thickness, height]) {
		rotate ([0, 0, 90]) {
			distance_sensor();
		}
	}
}

module distance_sensor() {
	rotate ([0, 90, 0]) {
		cylinder (h = 10, r = 16.3 / 2);
		translate ([0, 25.7, 0]) {
			cylinder (h = 10, r = 16.3 / 2);
		}
	}
}