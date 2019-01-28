import java.util.Queue;
class Knight extends Piece {

  private final color c = color(65,105,225);
  private int len;
  private int[] location, origin;
  private int[][] vals;
  private boolean[][] visited;
  
  Knight(int[][] vals) {
    len = vals[0].length;
    visited = new boolean[len][len];
    this.vals = new int[len][];
    
    for (int i = 0; i < len; i++) 
      this.vals[i] = vals[i].clone();
    
    origin = new int[2];
    origin[0] = (int) ceil(GRID_MAX / 2.0) - 1;
    origin[1] = (int) ceil(( GRID_MAX + 1 ) / 2.0) - 1;
    location = origin.clone();
  };
  
  color fillColor() {
    return this.c;
  }
  
  int currentVal() {
    return vals[location[0]][location[1]];
  }
  
  int next() {
    // Change location based on set of possible points  
    return currentVal();
  }
  
  void disp() {
    point(width/2, height/2);
  }
}
