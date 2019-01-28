int savedTime;
int totalTime = 1000; // 1 second

int[][] vals;
boolean[][] visited;
final int GRID_MAX = 50;

public enum PieceType { 
  KNIGHT, ROOK, BISHOP, QUEEN;
}
PieceType pieceType = PieceType.KNIGHT;
Piece piece;

void setup() {  
  savedTime = millis();
  //size(500, 300);
  fullScreen();

  vals = new int[GRID_MAX][GRID_MAX];
  visited = new boolean[GRID_MAX][GRID_MAX];
  int[] origin = {(int) ceil(GRID_MAX / 2.0) - 1, 
    (int) ceil(( GRID_MAX + 1 ) / 2.0) - 1};


  /* --- initializing the spiral grid --- */
  int x = origin[0];
  int y = origin[1];
  int dx = 1, dy = 0;
  int val = 1;

  for (int i = 0; i < GRID_MAX * GRID_MAX; i++) {
    if (0 <= x && x < GRID_MAX && 0 <= y && y < GRID_MAX) {
      //println("x: " + x + ", y: " + y + ", |VAL = " + val + " |");
      vals[y][x] = val;
      val++;
    }
    int xdisp = x - origin[0];
    int ydisp = y - origin[1];
    if ((xdisp != 0 && xdisp == -ydisp) || 
      (xdisp < 0 && xdisp == ydisp) || 
      (xdisp > 0 && xdisp - ydisp == 1)) {
      // python version: dx, dy = dy, -dx
      int temp = dx;
      dx = dy;
      dy = -temp;
    }
    x += dx;
    y += dy;
  }

  /* --- initializing what Piece we'll be using --- */
  switch (pieceType) {
  default:
  case KNIGHT:
    piece = new Knight(vals);
    break;
  }
}

void draw() {
  // Calculate how much time has passed
  int passedTime = millis() - savedTime;
  if (passedTime > totalTime) {
    // Save the current time to restart the timer!
    savedTime = millis();
    
    // Draw everything necessary
    drawChessboard();
    int currentNum = piece.next();
    strokeWeight(24);
    stroke(piece.fillColor());
    fill(piece.fillColor());
    point(width/2,height/2);
  }
}

void drawChessboard() {
  final int min_dim = min(width, height);
  final int BLOCK_D = min_dim / GRID_MAX;
  final boolean wider = (width-height > 0); 
  int col_init = 0, row_init = 0;
  color col1 = color(124,87,61);   // Dark Brown
  color col2 = color(181,101,29);  // Neutral Brown

  if (wider)  col_init = (width - height) / 2;
  else        row_init = (height - width) / 2;

  noStroke();
  for (int i = 0; i < GRID_MAX; i ++) {
    for (int j = 0; j < GRID_MAX; j ++) {
      if ((i + j + 1) % 2 == 0) {
        fill(col1);
      } else {
        fill(col2);
      }
      int x = i * BLOCK_D + col_init;
      int y = j * BLOCK_D + row_init; 
      rect(x, y, BLOCK_D, BLOCK_D);
    }
  }
}

// Draw an arrow function borrowed from the following forum post:
// https://processing.org/discourse/beta/num_1219607845.html
void arrow(int x1, int y1, int x2, int y2) {
  line(x1, y1, x2, y2);
  pushMatrix();
  translate(x2, y2);
  float a = atan2(x1-x2, y2-y1);
  rotate(a);
  line(0, 0, -10, -10);
  line(0, 0, 10, -10);
  popMatrix();
} 
