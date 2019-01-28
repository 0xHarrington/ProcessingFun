class Boid {

  private final int ALIGN_RAD = 200;
  private final int SEP_RAD = 100;
  private final float MAX_SPEED = 15;
  private final float MAX_FORCE = .5;

  private PVector position;
  private PVector velocity;
  private PVector acceleration;


  Boid() {
    position = new PVector(random(width), random(height));
    velocity = PVector.random2D().mult(MAX_SPEED);
    acceleration = new PVector(0, 0);
  }


  /* The steering force w.r.t. to the local flock:
   * steering = desired - current */
  PVector align(ArrayList<Boid> boids) {

    int count = 0;
    PVector desired = new PVector(0, 0);

    for (Boid other : boids) {

      if (other == this) continue;

      // Determining how far the Boid can see around it 
      float dist = PVector.dist(position, other.getPosition());
      if (dist <= ALIGN_RAD) {
        desired.add(other.getVelocity());
        count++;
      }
    }
    if (count > 0) {
      desired.div(count);
      desired.setMag(MAX_SPEED);
      desired.sub(velocity);
      desired.limit(MAX_FORCE);
    }
    return desired;
  }

  /* Cohesion force seeks to steer towards the position 
   * of local flockmates: Average positions and return location */
  PVector cohere(ArrayList<Boid> boids) {

    int count = 0;
    PVector cohesion = new PVector(0, 0);

    for (Boid other : boids) {

      if (other == this) continue;

      // Determining how far the Boid can see around it 
      float dist = PVector.dist(position, other.getPosition());
      if (dist <= ALIGN_RAD) {
        cohesion.add(other.getPosition());
        count++;
      }
    }
    if (count > 0) {
      cohesion.div(count);
      cohesion.sub(position);
      cohesion.setMag(MAX_SPEED);
      cohesion.sub(velocity);
      cohesion.limit(MAX_FORCE);
    }
    return cohesion;
  }

  /* Separation force seeks to steer away from 
   * of local flockmates: Average positions and return location */
  PVector separate(ArrayList<Boid> boids) {

    int count = 0;
    PVector separation = new PVector(0, 0);

    for (Boid other : boids) {

      if (other == this) continue;

      // Determining how far the Boid can see around it
      float dist = PVector.dist(position, other.getPosition());
      if (dist <= SEP_RAD) {
        PVector diff = PVector.sub(position, other.getPosition());
        diff.div(dist);
        separation.add(diff);
        count++;
      }
    }
    if (count > 0) {
      separation.div(count);
      separation.setMag(MAX_SPEED);
      separation.sub(velocity);
      separation.limit(MAX_FORCE);
    }
    return separation;
  }

  void flock(ArrayList<Boid> boids) {
    acceleration.add(align(boids)); 
    acceleration.add(cohere(boids));
    acceleration.add(separate(boids));
  }

  void update() {
    position.add(velocity);
    velocity.add(acceleration);
    velocity.limit(MAX_SPEED);

    // Reset acceleration for next iteration
    acceleration.mult(0);

    if (position.x < 0) position.x = width;
    if (position.y < 0) position.y = height;
    if (position.x > width) position.x = 0;
    if (position.y > height) position.y = 0;
  }

  void show() {
    point(position.x, position.y);
  }

  PVector getVelocity() {
    return velocity;
  }

  PVector getPosition() {
    return position;
  }
}
