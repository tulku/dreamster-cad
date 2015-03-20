// Dreamster parametric prototype chassis V1 


// Default resolution (set it down for faster rendering)
$fn=50;


// Chassis parameters

chassis_depth = 100;
chassis_width = 120;
chassis_height = 20;
chassis_thickness = 1.5;
inner_frame = 25;
mount_holes = 3;  //Mounting holes diameter 

// Chassis body
difference() { 
	cube ([chassis_depth,chassis_width,chassis_height]); // Outer box
	translate ([chassis_thickness/2,chassis_thickness/2,chassis_thickness/2]) { 
	cube ([chassis_depth-chassis_thickness,chassis_width-chassis_thickness,chassis_height+chassis_thickness*2]);} // Inner space for pcb/motors
	translate ([inner_frame/2,inner_frame/2,chassis_thickness-10]) {
	cube ([chassis_depth-inner_frame,chassis_width-inner_frame,chassis_height+chassis_thickness*2]);}	
//Holes to bolt the PCB

	for(i = [ [inner_frame/4,inner_frame/4,-chassis_thickness],
          	[chassis_depth-inner_frame/4,inner_frame/4,-chassis_thickness],
          	[chassis_depth-inner_frame/4,chassis_width-inner_frame/4,-chassis_thickness],
          	[inner_frame/4,chassis_width-inner_frame/4,-chassis_thickness]])
			{translate (i) 
			cylinder(h=chassis_thickness*2, r=mount_holes/2);}

// Clearance for distance sensors
	for(i = [[-chassis_thickness,20,chassis_height], //*Fix me* It have to be relative to chassis size
			 [chassis_depth-chassis_thickness,chassis_width-40,chassis_height],
			 [-chassis_thickness,chassis_width-40,chassis_height],
			 [chassis_depth-chassis_thickness,20,chassis_height]]){

	translate(i)
	distance_sensor();}
	translate ([60,-chassis_thickness,chassis_height]){
	rotate ([0,0,90]){
	distance_sensor();}}

				}
module distance_sensor(){
	rotate ([0,90,0]){
	cylinder (h=10, r=16.3/2);
	translate ([0,25.7,0]){
	cylinder (h=10, r=16.3/2);}
						}
		}	


