// Dimensions

// PCB (to get the fit right)
PCB_WIDTH = 75;
PCB_LENGTH = 100;
PCB_HEIGHT = 2;

PCB_HOLES_DIAM = 3;
PCB_HOLES_X = 5;
PCB_HOLES_Y = 10;

// Holder
WALLS_WIDTH = 2;

// Gears
GEARS_WIDTH = 5;
FIRST_AXIS_X = 15;
SECOND_AXIS_X = 45;
AXIS_DIAMETER = 2;

module PCB()
{
  cube([PCB_WIDTH, PCB_LENGTH, PCB_HEIGHT], center=true);
  translate([PCB_WIDTH/2-PCB_HOLES_X, PCB_LENGTH/2-PCB_HOLES_Y, 0]) {
    cylinder(30, d=PCB_HOLES_DIAM, center=true);
  }
  translate([-(PCB_WIDTH/2-PCB_HOLES_X), PCB_LENGTH/2-PCB_HOLES_Y, 0]) {
    cylinder(30, d=PCB_HOLES_DIAM, center=true);
  }
  translate([PCB_WIDTH/2-PCB_HOLES_X, -(PCB_LENGTH/2-PCB_HOLES_Y), 0]) {
    cylinder(30, d=PCB_HOLES_DIAM, center=true);
  }
  translate([-(PCB_WIDTH/2-PCB_HOLES_X), -(PCB_LENGTH/2-PCB_HOLES_Y), 0]) {
    cylinder(30, d=PCB_HOLES_DIAM, center=true);
  }
}

module MOTOR()
{
  MOTOR_WIDTH = 20;
  MOTOR_HEIGHT = 15;
  MOTOR_LENGTH = 25;

  SHAFT_LENGTH = 10;

  cube([MOTOR_LENGTH, MOTOR_WIDTH, MOTOR_HEIGHT]);
  //cylinder(SHAFT_LENGTH, )
}


module GEAR_HOLDER()
{
  width = PCB_HOLES_Y + 2 * WALLS_WIDTH;
  length = PCB_LENGTH - 2*PCB_HOLES_X + PCB_HOLES_DIAM;
  height = PCB_HEIGHT + 2*WALLS_WIDTH;

  full_width = width + GEARS_WIDTH;

  length_cut = length - 2*PCB_HOLES_X - 2 * PCB_HOLES_DIAM - 5;
  width_cut = width - WALLS_WIDTH + 5;

  difference() {
  translate([-PCB_WIDTH/2-2*WALLS_WIDTH-GEARS_WIDTH, -length/2, -height/2])
  {
    cube([full_width, length, height]);
  }

  translate([-PCB_WIDTH/2-WALLS_WIDTH-GEARS_WIDTH, -length/2+WALLS_WIDTH, -height/2-5])
  {
    cube([GEARS_WIDTH, length-2*WALLS_WIDTH, height+10]);
  }

  translate([-PCB_WIDTH/2, -length_cut/2, -(height+4)/2])
  {
    cube([width_cut, length_cut, height+4]);
  }

  translate([-PCB_WIDTH/2, -length/2+FIRST_AXIS_X, 0])
  {
    rotate([90, 0, 90]) cylinder(20, d=2, center=true);
  }

  translate([-PCB_WIDTH/2, -length/2+SECOND_AXIS_X, 0])
  {
    rotate([90, 0, 90]) cylinder(20, d=2, center=true);
  }
  #PCB();
  }
}

//PCB();
MOTOR();
GEAR_HOLDER();
