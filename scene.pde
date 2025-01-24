void setup() {
  size(900,800);
  background(185, 235, 255);
}

void draw() {
  //sun
  fill(#FFDF22);
  stroke(#EC9706);
  strokeWeight(5);
  circle(70, 50, 300);
  triangle(330, 20, 230, 10, 230, 40);
  triangle(330, 80, 230, 60, 230, 90);
  triangle(320, 140, 225, 110, 212, 140);
  triangle(275, 220, 205, 155, 181, 176);
  triangle(220, 265, 165, 190, 134, 206);
  triangle(150, 290, 120, 210, 90, 216);
  triangle(90, 295, 73, 215, 50, 216);
  triangle(35, 298, 32, 215, 8, 209);
  
  //clouds
  fill(255, 255, 255);
  noStroke();
  ellipse(90, 500, 200, 100);
  ellipse(138, 450, 200, 100);
  ellipse(170, 507, 200, 100);
  
  ellipse(350, 330, 180, 100);
  ellipse(320, 370, 180, 80);
  ellipse(400, 290, 160, 100);
  ellipse(420, 320, 220, 100);
  ellipse(450, 376, 250, 100);
  
  ellipse(500, 600, 250, 150);
  ellipse(600, 650, 250, 150);
  ellipse(580, 545, 250, 150);
  ellipse(700, 610, 250, 150);
  ellipse(500, 600, 250, 150);
  ellipse(445, 640, 200, 100);
  ellipse(735, 660, 200, 100);
}
