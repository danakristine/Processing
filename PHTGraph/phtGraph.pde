import processing.serial.*;
Serial myPort;  // The serial port
float val1, val2, val3;
float x1, x2, t1, t2, p1, p2, h1, h2, x3, x4, x5, x6;
int num = 30;
String txt = "";
void setup() {
  size(800, 600);
  background(255, 255, 255);
  x1 = 50;
  x3 = 50;
  x5 = 50;
  h1 = 0;
  h2 = 0;
  t1 = 0;
  t2 = 0;
  p1 = 0;
  p2 = 0;
  printArray(Serial.list());
  // Open the port you are using at the rate you want:
  myPort = new Serial(this, Serial.list()[0], 9600);
  // vertical
  for (int i = 50; i < width + 1; i += 50) {
    line(i, 0, i, height - 50);
  }
  // horizontal
  for (int i = 50; i < height + 1; i += 50) {
    line(50, i, width, i);
  }
  //top labels
  fill(0, 0, 255);
  text("1050 hPa", 3, 10);
  fill(0, 128, 0);
  text("100%", 3, 25);
  fill(255, 0, 0);
  text("85 deg", 3, 40);
  //bottom labels
  fill(0, 0, 255);
  text("950 hPa", 3, 535);
  fill(0, 128, 0);
  text("0%", 3, 550);
  fill(255, 0, 0);
  text("62 deg", 3, 565);
  //seconds labels
  fill(0, 0, 0);
  for (int i = 100; i < width; i+= 50) {
    txt = String.valueOf(num);
    text(txt, i -5, 563);
    num += 30;
  }
}
void draw() {
  while (myPort.available() > 0) {
    String inBuffer = myPort.readString();
    if (inBuffer != null) {
      println(inBuffer);
      String values = inBuffer;
      int startIdx, endIdx;
      String substr;
      startIdx = 0;
      endIdx = values.indexOf(',', startIdx);
      if (endIdx != -1) {
        substr = values.substring(startIdx, endIdx);
        val1 = Float.parseFloat(substr);
        println(val1);
        startIdx = endIdx + 1;
      }
      endIdx = values.indexOf(',', startIdx);
      if (endIdx != -1) {
        substr = values.substring(startIdx, endIdx);
        val2 = Float.parseFloat(substr);
        println(val2);
        startIdx = endIdx + 1;
      }
      if (endIdx < values.length()-1) {
        substr = values.substring(startIdx);
        val3 = Float.parseFloat(substr);
        println(val3);
      }
      float temp = val3;
      float mapValTemp = 600 - map(temp, 62, 85, 0, 550);
      print("temp " + temp + " map " + mapValTemp);// 62 - 85 temp
      println();
      float humid = val2;
      float mapValHum = 600 - map(humid, 0, 100, 0, 550);
      print("humidity " + humid + " map " + mapValHum);// 0 - 100 humidity
      float press = val1;
      float mapValPres = 600 - map(press, 850, 1100, 0, 550);
      print(" pressure " + press + " map " + mapValPres);// 850 - 1100 pressure


      //temp line
      x2 = x1 + 50;
      if (t1 == 0 && t2 == 0) {
        t1 = mapValTemp;
        t2 = mapValTemp;
      } else {
        t2 = mapValTemp;
      }
      stroke(255, 0, 0);
      strokeWeight(3);
      line(x1, t1, x2, t2);
      x1 = x2;
      t1 = t2;

      //humidity line
      x4 = x3 + 50;
      if (h1 == 0 && h2 == 0) {
        h1 = mapValHum;
        h2 = mapValHum;
      } else {
        h2 = mapValHum;
      }
      stroke(0, 128, 0);
      strokeWeight(3);
      line(x3, h1, x4, h2);
      x3 = x4;
      h1 = h2;

      //pressure line
      x6 = x5 + 50;
      if (p1 == 0 && p2 == 0) {
        p1 = mapValPres;
        p2 = mapValPres;
      } else {
        p2 = mapValPres;
      }
      stroke(0, 0, 255);
      strokeWeight(3);
      line(x5, p1, x6, p2);
      x5 = x6;
      p1 = p2;
    }
  }
}
