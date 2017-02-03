ArrayList<LetterBubble> currentLetters;
TypingDisplay typingDisplay;
int timePassed;
float timeScale = 1;
boolean isLeft = true;
PFont font;

void setup() {
  background(35);
  fullScreen();
  //size(600, 400);
  currentLetters = new ArrayList<LetterBubble>();
  typingDisplay = new TypingDisplay(height * .75, height, width);
  
  
  font = createFont("Monaco", 32);
  textFont(font);
  textAlign(CENTER, CENTER);
  colorMode(HSB, 100);
}


void draw() {
  background(35);
  for (int i = currentLetters.size() - 1; i >= 0; i--) {
    LetterBubble lb = currentLetters.get(i);
    if (lb.size() < 14) currentLetters.remove(i);
    else {
      lb.update();      
      lb.show();
    }
  }
  
  typingDisplay.update();
  typingDisplay.show();
  
  timePassed += timeScale;
}

void keyPressed() {
  int ascii = int(key);
  if ( (ascii <= 90 && ascii >= 65) || (ascii <= 122 && ascii >= 97) ) {
    LetterBubble newBubble = new LetterBubble(key, timePassed, isLeft, 0, height * .75);
    timePassed = 0;
    currentLetters.add(newBubble);
  }
  
  if (ascii == 8) typingDisplay.del();
  else typingDisplay.add(key);
}

void mousePressed() {
  isLeft = !isLeft; 
}