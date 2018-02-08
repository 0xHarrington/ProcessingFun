PImage orig, newp;
float[] filter = 
  { -1, -1,  -1,
    -1,  8,  -1,
    -1, -1,  -1};

void setup() {
  
  // Set up the canvas size based on the changing image
  /*
  initp = loadImage("headshot.jpg");
  size(1000, 340); // Photo is: 500 x 340
  */
  
  newp = filterImage(orig);
}

void draw() {
  image(orig, 0, 0);
  image(newp, width/2, 0);
}

PImage filterImage(PImage img) {
  
  PImage ret = img.copy();
  
  
  
  return ret;
}