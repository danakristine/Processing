void setup() {
  size(900,800);
  background(185, 235, 255);
}

void draw() {
  //sun
  fill(#FFDF22);
  stroke(#EC9706);
  strokeWeight(5);
  ellipse(70, 50, 300, 300);
  triangle(330, 20, 230, 10, 230, 40);
  triangle(330, 80, 230, 60, 230, 90);
  triangle(320, 140, 225, 110, 212, 140);
  triangle(275, 220, 205, 155, 181, 176);
  triangle(220, 265, 165, 190, 134, 206);
}
