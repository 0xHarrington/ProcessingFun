int cols, rows;
int w = 2600;
int h = 2000;
int scl = 20;
int bg = 0;
int str = 0;
float angle = 7 * PI/18;
float flying = 0;
float noiseOffset = 150;

float[][] terrain;

void setup() {
  fullScreen(P3D);
  cols = w / scl;
  rows = h / scl;
  terrain = new float[cols][rows];
  colorMode(HSB, 100);
}

void draw() {
  background(bg);
  stroke(str);
  //noStroke();
  noFill();
  translate(width/2, height/2);
  rotateX(angle);
  translate(-w/2, -h/2);
  flying -= 0.07;
 
  float yoffset = flying;
  for (int y = 0; y < rows-1; y++) {
     float xoffset = 0;
     for (int x = 0; x < cols; x++) {
       terrain[x][y] = 
         map(noise(xoffset, yoffset), 0, 1, 
         -noiseOffset, noiseOffset);
       xoffset += 0.1;
     }
   yoffset += 0.1;
  }
  
  for (int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      //fill(map(terrain[x][y], -noiseOffset, noiseOffset, 100, 0), 100, 80);
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
    }
    endShape();
  }
  
  rotateX(-angle);
  textSize(64);
  text(frameRate, -100, -100);
  rotateX(angle);
}

void mousePressed() {
  if (bg == 255) {
    bg = 0;
    str = 255;
  }
  else {
    bg = 255;
    str = 0;
  }
}