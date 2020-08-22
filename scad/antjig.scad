

wireLen  = 137.5;
wireDiam = 1.63;
bendRadius = 4.0;

pi = 3.141592653589793238;
wireRadius = bendRadius - wireDiam/2.0;

circumference = 2.0*pi*bendRadius;

diff = (wireLen - circumference);
sd   = diff/4.0;


module coreI(Hgt=5){
  hull(){
    translate([-sd/2.0,-sd/2.0,0]) cylinder(h=Hgt,r=wireRadius,center=false,$fn=64);
    translate([ sd/2.0,-sd/2.0,0]) cylinder(h=Hgt,r=wireRadius,center=false,$fn=64);
    translate([-sd/2.0, sd/2.0,0]) cylinder(h=Hgt,r=wireRadius,center=false,$fn=64);
    translate([ sd/2.0, sd/2.0,0]) cylinder(h=Hgt,r=wireRadius,center=false,$fn=64);
  }
}

module coreO(Hgt=4){
  translate([0,0,1]) hull(){
    translate([-sd/2.0,-sd/2.0,0]) cylinder(h=Hgt,r=bendRadius+wireDiam/2.0,center=false,$fn=64);
    translate([ sd/2.0,-sd/2.0,0]) cylinder(h=Hgt,r=bendRadius+wireDiam/2.0,center=false,$fn=64);
    translate([-sd/2.0, sd/2.0,0]) cylinder(h=Hgt,r=bendRadius+wireDiam/2.0,center=false,$fn=64);
    translate([ sd/2.0, sd/2.0,0]) cylinder(h=Hgt,r=bendRadius+wireDiam/2.0,center=false,$fn=64);
  }
}

module coreB(Hgt=2){
  hull(){
    translate([-sd/2.0*1.1,-sd/2.0*1.1,0]) cylinder(h=Hgt,r=1.1*bendRadius+wireDiam/2.0,center=false,$fn=64);
    translate([ sd/2.0*1.1,-sd/2.0*1.1,0]) cylinder(h=Hgt,r=1.1*bendRadius+wireDiam/2.0,center=false,$fn=64);
    translate([-sd/2.0*1.1, sd/2.0*1.1,0]) cylinder(h=Hgt,r=1.1*bendRadius+wireDiam/2.0,center=false,$fn=64);
    translate([ sd/2.0*1.1, sd/2.0*1.1,0]) cylinder(h=Hgt,r=1.1*bendRadius+wireDiam/2.0,center=false,$fn=64);
  }
}

union(){
  difference(){
   coreB();
   coreO();
   translate([sd/2.0+bendRadius,sd/2.0+bendRadius,1]) cylinder(h=5,r=bendRadius,center=false,$fn=4);
  }
  coreI();
}
