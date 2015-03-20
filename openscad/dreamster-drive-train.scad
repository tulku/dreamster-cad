// Dreamster parametric prototype drivetrain 


// Default resolution (set it down for faster rendering)
$fn=50;

difference (){
	union (){
	cube ([35,35,2]);
	cube ([15,2,25]);
	;}

	translate ([7.5,5,20]){
	rotate ([90,0,0]) {
	cylinder (h = 10, r = 3/2);}}

	translate ([10,5,-1]){
	cube ([20,3,10]);}

	translate ([10,15,-1]){
	cube ([20,3,10]);}

	translate ([18,25,-1]){
	cylinder (h=10,r=3/2);}



}
