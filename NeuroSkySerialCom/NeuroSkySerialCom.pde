//arduino & processing serial communication code pulled from Luke DuBois'
//creative coding class NYU 2014

import processing.serial.*; // this is a library to use serial

int whichport = 5; // change to your serial port

Serial myPort;      // The serial port
String inPut = "";    // Incoming (string) serial data
int val = 0; // stash *actual* serial data

void setup() {
    // List all the available serial ports:
  println(Serial.list());

  // open the serial port to the arduino
  String portName = Serial.list()[whichport];
  myPort = new Serial(this, portName, 57600);
}

void draw(){
  if ( myPort.available() > 0) {  // If data is available,
    inPut = myPort.readStringUntil('\n');
    if (inPut!=null) { // only run if not bogus
      inPut = trim(inPut); // gets rid of white space
      val = parseInt(inPut); // interpret as an integer
      println(val);
    }
  }
}
