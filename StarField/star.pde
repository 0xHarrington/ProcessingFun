class Star {
 float x = random(0, width);
 float y = random(-300, 200);
 float yspeed = random(2, 5);
 float length = random(9, 12);
 
 void fall() {
   y = y + yspeed;
   if (y > height) {
     y = random(-100, 0);
     yspeed = random(3, 5);
   }
   yspeed += map(y, 0, height, 0, .2);
 }
 void show() {
   stroke(255);
   strokeWeight(2);
   line(x, y, x, y+length);
 }
}