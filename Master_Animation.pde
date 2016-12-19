import oscP5.*;
import processing.video.*;

OscP5 oscP5;
int theinput;
Movie movie;

String currentVideoLocation = "";
int state = 0; // 1 - 8

void setup() {
  //size(1280, 720);
  fullScreen(2);
  oscP5 = new OscP5( this, 12001 );
  // Load and play the video in a loop
  movie = new Movie(this, "0/1.mov"); // Start & no db selected
  movie.play();
}

void movieEvent(Movie m) {
  m.read();
}

void draw() {
  
  // Movie has ended.
  //println(movie.time());
  //println(movie.duration());
  if (movie.time() >= movie.duration()) {
    constructVideo();
  }

  image(movie, 0, 0, width, height);
}

//This is called automatically when OSC message is received
void oscEvent( OscMessage oscMsg ) {
  print( "OSC message received." );
  print( " Address Patterm: " + oscMsg.addrPattern() );
  println( " Typetag: " + oscMsg.typetag() );
  if ( oscMsg.checkAddrPattern( "/wek/outputs1" ) == true ) {
    println("got msg", second(), oscMsg.get( 0 ).floatValue() );

    theinput = int (oscMsg.get( 0 ).floatValue());
    state = theinput;
  }
}

void keyPressed() {
  int intKey = Character.getNumericValue(key);
  state = intKey;
  println("CHANGE the state to " + intKey);
}


void constructVideo() {
  if (state >= 0 && state <= 8) {
    float videoId = int(random(1, 5));
    if (state == 0) {
      videoId = 1;
    }
    currentVideoLocation = state + "/" + int(videoId) + ".mov";
    println(currentVideoLocation);
    movie = new Movie(this, currentVideoLocation);
    movie.play();
  }
}