class Mound {
  private color[][] filled;
  private float scl;

  Mound(int x, int y, float scl){
    filled = new color[x][y]; 
    this.scl = scl;
  }
  
  void add(Piece p) {
    ArrayList<Integer> toAdd = p.getBoxes();
    for (int i = 0; i < toAdd.size(); i += 2) {
      filled[toAdd.get(i)][toAdd.get(i+1)] = p.getCol();
    }
  }
  
  void show(float topLeftX, float topLeftY) {
    for (int i = 0; i < filled.length; i++) {
      for (int j = 0; j < filled[i].length; j++) {
        fill(filled[i][j]);        
        rect((i+topLeftX)*scl, (j+topLeftY)*scl, scl, scl);
      }
    }
  }
}