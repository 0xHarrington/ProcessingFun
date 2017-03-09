import java.util.Random;
public enum Forms {Z, BACKZ, L, BACKL, STRAIGHT, BLOCK, T};
public enum Orient {FIRST, SECOND, THIRD, FOURTH};
color Zrgb = color(225, 137, 66);
color Lrgb = color(61, 50, 66);
color Trgb = color(255, 240, 170);
color BACKZrgb = color(176, 229, 124);
color BACKLrgb = color(192, 161, 114);
color BLOCKrgb = color(86, 186, 236);
color STRAIGHTrgb = color(255, 51, 51);


class Piece {
  private Forms form;
  private color col;
  Orient o;
  private ArrayList<Integer> positions = new ArrayList<Integer>();
  
  // Constructor Function, with the top left x and y positions passed in.
  Piece(float tlx, float tly) {
    form = randomPiece();
    o = Orient.FIRST;
    
    int fbx = new Random().nextInt(6) + 2 + (int)tlx; // value for first box's x-value, aspect of randomness
    int fby = (int)tly;
    
    // Unfortunate set of if statements to set color of the piece.
    if (form == Forms.Z) {
      int[] Zpos = {fbx, fby, fbx-1, fby, fbx, fby+1, fbx+1, fby+1};
      for (int i = 0; i < Zpos.length; i++)
        positions.add(i, Zpos[i]);  
      col = Zrgb;
    }
    else if (form == Forms.L) {
      int[] Lpos = {fbx, fby, fbx-1, fby, fbx-2, fby, fbx-2, fby+1};
      for (int i = 0; i < Lpos.length; i++)
        positions.add(i, Lpos[i]);       
      col = Lrgb;
    }
    else if (form == Forms.BACKZ) {
      int[] BACKZpos = {fbx, fby, fbx+1, fby, fbx, fby+1, fbx-1, fby+1};
      for (int i = 0; i < BACKZpos.length; i++)
        positions.add(i, BACKZpos[i]);       
      col = BACKZrgb;
    }
    else if (form == Forms.BACKL) {
      int[] BACKLpos = {fbx, fby, fbx-1, fby, fbx+1, fby, fbx+1, fby+1};
      for (int i = 0; i < BACKLpos.length; i++)
        positions.add(i, BACKLpos[i]);       
      col = BACKLrgb;
    }
    else if (form == Forms.STRAIGHT) {
      int[] STRAIGHTpos = {fbx, fby, fbx-1, fby, fbx+1, fby, fbx+2, fby};
      for (int i = 0; i < STRAIGHTpos.length; i++)
        positions.add(i, STRAIGHTpos[i]);       
      col = STRAIGHTrgb;
    }
    else if (form == Forms.BLOCK) {
      int[] BLOCKpos = {fbx, fby, fbx-1, fby, fbx, fby+1, fbx-1, fby+1};
      for (int i = 0; i < BLOCKpos.length; i++)
        positions.add(i, BLOCKpos[i]);       
      col = BLOCKrgb;
    }
    else if (form == Forms.T) {
      int[] Tpos = {fbx, fby, fbx-1, fby, fbx+1, fby, fbx, fby+1};
      for (int i = 0; i < Tpos.length; i++)
        positions.add(i, Tpos[i]);       
      col = Trgb;
    }
  }
  
  // Private helper function that returns a random tetris piece form
  private Forms randomPiece() {
    int pick = new Random().nextInt(Forms.values().length);
    return Forms.values()[pick];
  }

  // The method that updates the values of the Piece
  public void fallOne() {
    for (int i = 0; i < positions.size(); i++)
      positions.set(i ,(positions.get(i) - 1) );
  }

  // The method that displays the peice on the board
  public void show() {
    switch(form){
      case Z:
        
        break;
      
      case BACKZ:
      
        break;
      
      case L:
      
        break;
      
      case BACKL:
      
        break;
      
      case T:
      
        break;
      
      case STRAIGHT:
      
        break;
      
      case BLOCK:
      
        break;
    }
  }
  
  // The method that displays the peice in the preview window.
  public void showPreview() {
    switch(form){
      case Z:
        
        break;
      
      case BACKZ:
      
        break;
      
      case L:
      
        break;
      
      case BACKL:
      
        break;
      
      case T:
      
        break;
      
      case STRAIGHT:
      
        break;
      
      case BLOCK:
      
        break;
    }
  }
  
  
  public void turnCW(){}
  public void turnCCW(){} 
  public void Fall(){}
  public ArrayList<Integer> getBoxes() {
    return positions;
  }
  public color getCol() {
    return col; 
  }
}