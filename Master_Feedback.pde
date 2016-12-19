import oscP5.*;

OscP5 oscP5;
int theinput;
PImage imgNothing;  // Declare variables of type PImage
PImage imgX;
PImage imgO;
PImage imgL;
PImage imgOX;
PImage imgOL;
PImage imgXL;
PImage imgOXL;

void setup() {
  //size(1280, 720);
  fullScreen (1);
  oscP5 = new OscP5( this, 12002 );
  imgNothing = loadImage("1.jpg");  // Load the images into the program
  imgX = loadImage("2.jpg");
  imgO = loadImage("3.jpg");
  imgL = loadImage("4.jpg");
  imgOX = loadImage("5.jpg");
  imgOL = loadImage("6.jpg");
  imgXL = loadImage("7.jpg");
  imgOXL = loadImage("8.jpg");
}

void draw() {
  background(0);
  if (theinput == 1) {
    image(imgNothing, 0, 0);
  } else if (theinput == 2) {
    image(imgX, 0, 0);
  } else if (theinput == 3) {
    image(imgO, 0, 0);
  } else if (theinput == 4) {
    image(imgL, 0, 0);
  } else if (theinput == 5) {
    image(imgOX, 0, 0);
  } else if (theinput == 6) {
    image(imgOL, 0, 0);
  } else if (theinput == 7) {
    image(imgXL, 0, 0);
  } else if (theinput == 8) {
    image(imgOXL, 0, 0);
  }
}

//This is called automatically when OSC message is received
void oscEvent( OscMessage oscMsg ) {
  print( "OSC message received." );
  print( " Address Patterm: " + oscMsg.addrPattern() );
  println( " Typetag: " + oscMsg.typetag() );
  if ( oscMsg.checkAddrPattern( "/wek/outputs2" ) == true ) {
    println("got msg", second(), oscMsg.get( 0 ).floatValue() );
    theinput = int (oscMsg.get( 0 ).floatValue());
  }
}