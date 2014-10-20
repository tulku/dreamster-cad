// Dimensions

// PCB (to get the fit right)
PCB_WIDTH = 50;
PCB_LENGTH = 70;
PCB_HEIGHT = 2;

PCB_HOLES_DIAM = 3;
PCB_HOLES_X = 5;
PCB_HOLES_Y = 10;

// Holder
WALLS_WIDTH = 2;

// Gears
GEARS_WIDTH = 5;
FIRST_AXIS_X = 10;

module PCB()
{
  cube([PCB_WIDTH, PCB_LENGTH, PCB_HEIGHT], center=true);
  translate([PCB_WIDTH/2-PCB_HOLES_X, PCB_LENGTH/2-PCB_HOLES_Y, 0]) {
    cylinder(100, d=PCB_HOLES_DIAM, center=true);
  }
  translate([-(PCB_WIDTH/2-PCB_HOLES_X), PCB_LENGTH/2-PCB_HOLES_Y, 0]) {
    cylinder(100, d=PCB_HOLES_DIAM, center=true);
  }
  translate([PCB_WIDTH/2-PCB_HOLES_X, -(PCB_LENGTH/2-PCB_HOLES_Y), 0]) {
    cylinder(100, d=PCB_HOLES_DIAM, center=true);
  }
  translate([-(PCB_WIDTH/2-PCB_HOLES_X), -(PCB_LENGTH/2-PCB_HOLES_Y), 0]) {
    cylinder(100, d=PCB_HOLES_DIAM, center=true);
  }
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

  translate([-PCB_WIDTH/2, -length/2-FIRST_AXIS_X, 0])
  {
    #rotate([90, 0, 90]) cylinder(10, d=2, center=true);
  }
  PCB();
  }
}

//PCB();
GEAR_HOLDER();
