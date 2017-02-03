Star starArray[];
int arraySize = 2500;

void setup() {
  fullScreen();
  //  size(840, 480);
  starArray = new Star[arraySize];
  for (int i = 0; i < arraySize; i++) {
     starArray[i] = new Star(); 
  }
}

void draw() {
  background(0);
  for (Star s : starArray) {
    s.fall();
    s.show();
  
  }
}