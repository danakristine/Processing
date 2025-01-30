import processing.serial.*;
Serial myPort;  // The serial port

void setup() {
  size(800, 600);
  background(255, 255, 255);


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

  fill(0, 0, 0);
  text("Time(Sec)", 390, 590);
  text("30",95,563);
  text("60",145,563);
}

void draw() {

  while (myPort.available() > 0) {
    String inBuffer = myPort.readString();
    if (inBuffer != null) {
      println(inBuffer);
    }

    String values = inBuffer;
    int startIdx, endIdx;
    String substr;
    float val1, val2, val3;

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
  }

  //drawing line
}
