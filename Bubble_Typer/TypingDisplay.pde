/* TODO: Possibly implement own dynamic way of displaying the text
//       StringBuilder is funky and buggy when trying to dynamically
//       alter what is being stored, especially with funky newline chars
*/

class TypingDisplay {
  StringBuilder string;
  int[] lineLengths;
  float w, top, bottom;
  int c, length, currentLine;
  int textSize = 32;
  
  TypingDisplay(float top, float bottom, float w) {
    this.w = w;
    this.top = top;
    this.bottom = bottom;
    length = 0;
    currentLine = 0;
    c = 0;
    lineLengths = new int[floor((bottom - top) / 50)];
    string = new StringBuilder();
  }
  
  void add(char k) {
    string.append(k);
    length++;
    if (k == '\n') 
      currentLine++;
    else 
      lineLengths[currentLine]++;
  }
  
  void del() {
    if (length > 0) {
      length--;
      
      if (string.charAt(length) == '\n') {
        currentLine--;
      }
      else if (lineLengths[currentLine] > 0) { //Shouldn't ever happen
        lineLengths[currentLine]--;
      }
      string.deleteCharAt(length); //+ currentLine because of weird StringBuilder behavior with \n chars
    }
  }
  
  void show() {
    textSize(textSize);
    stroke(0);
    colorMode(HSB, 100);
    fill(50, 50, 65);
    text(string.toString(), w/2, top + ((bottom - top)/2));
  }
  
  void update() {
    if (currentLine >= lineLengths.length) {
      string = new StringBuilder();
      lineLengths = new int[floor((bottom - top) / 50)];
      currentLine = 0;
      length = 0;
    }
    if ((textSize * .65) * (lineLengths[currentLine]) > w) {
      string.append('\n');
      length++;
      currentLine++;
    }
  }
  
  
  
  
}