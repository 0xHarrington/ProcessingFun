class LetterBubble {
  float c, x, y;
  char letter;
  float size;
  int orient, scale = 1;
  float xShake = 1.5;
  float yShake = .5;
  int textSize = 10;
 
  LetterBubble(char letter, int size, boolean isLeft, float top, float bottom) {
    this.letter = letter;
    this.size  = log(size) * 25;
    this.c = random(100);
    float letterpos = ((int(letter) + 7) % 26);
    this.y = map(letterpos, 0, 25, 
                 top+(size*scale), 
                 bottom-(size*scale));
    if (isLeft) {
      this.x = this.size * scale;
      this.orient =  1;
    }
    else {
      this.x = width - (this.size * scale);
      this.orient = -1;
    }
  }
  
  void show() {
    noStroke();
    fill(c, noise(letter)*100, 100);
    ellipse(x, y, size * scale, size * scale);
    
    colorMode(RGB);
    stroke(0);
    fill(0);
    textSize(textSize);
    text(letter, x, y);
    colorMode(HSB, 100);
  }
  
  void update() {
    this.x += orient * random(-xShake, (xShake + (1.25 * xShake)));
    this.y += orient * random(-yShake, yShake);
    size -= 0.15;
  }
  
  float size() {
   return this.size; 
  }
  
}