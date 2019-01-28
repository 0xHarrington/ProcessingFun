ArrayList<Boid> flock = new ArrayList<Boid>();
//final int NUM_BOIDS = 100;
final int NUM_BOIDS = 800;

void setup() {
  //size(700, 500);
  //size(1000, 900);
  fullScreen();
  
  for (int i = 0; i < NUM_BOIDS; i++) 
    flock.add(new Boid());
}

void draw() {
  background(51);
  strokeWeight(8);
  stroke(255);
  
  for (Boid boid : flock) {
    boid.flock(flock);
    boid.update();
    boid.show();
  }
}
