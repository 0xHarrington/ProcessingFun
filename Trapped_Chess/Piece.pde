/* We want the Piece class below to be able to support 
 * Peice(int GRID_MAX)     // Constructor
 * int Peice.next()        // The peice moves to the smallest available 
 *                         //   location, returning its new value
 * void Peice.disp()       // Draws current position, all visited squares, 
 *                         //   and arrows to viable next squares */
abstract class Piece {
  
  int[] origin, location;
  int[][] vals;
  boolean[][] visited;
  
  // Returns color the piece will use to color
  // piece-related displays on the animation
  abstract color fillColor();
  
  // Draws current position, all visited squares, 
  // and arrows to viable next squares
  abstract void disp();
  
  // The peice moves to the smallest available 
  // location, returning its new value
  abstract int next();
}
