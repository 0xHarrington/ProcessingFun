int score;
int piecesGenerated;
Piece upcomingPiece, currentPiece;
Mound mound;
float fallCount;
float gravity;
float scl;
// Total grid width and height, calculated from alotted rows
int w, cols = 10, rows = 16; 
// Tetris grid is 10 columns, 16 rows

void setup(){
  background(55);
  size(800, 560);
  
  scl = height / (rows+2);
  w = (int) (width / scl);
  fill(201);
  rect(((w/2)-6)*scl, 0, 12*scl, height, 7);
  currentPiece = new Piece(((w/2)-5)*scl, scl);
  upcomingPiece = new Piece(((w/2)-5)*scl, scl);
  mound = new Mound(cols, rows, scl);
  
  Piece p = new Piece(((w/2)-5)*scl, scl);
  mound.add(p);
}

void draw() {
  fill(0);
  rect(((w/2)-5)*scl, scl, 10*scl, height-(2*scl));
  
  if (fallCount > 1) {
    currentPiece.fallOne();
    fallCount = 0;
  }
  
  currentPiece.show();
  upcomingPiece.showPreview();
  
  mound.show(((w/2)-5)*scl, scl);
  
  fallCount += 0.01+gravity;
  gravity += 0.0001;
}

void keyPressed() {
  if (key == ' ')   currentPiece.Fall(); //TODO: come back later and automate fall down
  if (key == UP || key == LEFT)    currentPiece.turnCCW();
  if (key == DOWN || key == RIGHT)  currentPiece.turnCW();
}