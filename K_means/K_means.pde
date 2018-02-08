PImage initp, newp;
int k = 10;
float MAX_COLOR = 255;
int MAX_ITER = 5000;
int count = 0;

void setup() {
  
  // Set up the canvas size based on the changing image
  /*
  initp = loadImage("TOSoM1.jpg");
  size(1000, 500); // Photo is: 500 x 500
  */
  /*
  initp = loadImage("Blonde Handshake.jpeg");
  size(986, 500); // Photo is: 493 x 500
  */
  
  initp = loadImage("headshot.jpg");
  size(1000, 340); // Photo is: 500 x 340
  
  /*
  initp = loadImage("UF Swimming Photo.jpeg");
  size(800, 300); // Photo is: 400 x 300
  */
  
  newp = parseImage(initp);
}


void draw() {
  image(initp, 0, 0);
  image(newp, width/2, 0);
}


/*   Big function to return the global-K-means   */
PImage parseImage(PImage oldp) {
  
  // Ready the pixels for parsing
  PImage ret = oldp.copy();
  ret.loadPixels();
  
  // Use the k to create random initialization 
  color[] centroids = new color[k];
  for(int i = 0; i < k; i++) {
    int val = (int) random(ret.pixels.length);
    centroids[i] = color(ret.pixels[val]);
  }
  
  int[] labels = new int[ret.pixels.length];
  int[] oldlabs = new int[ret.pixels.length];
  
  
  // Big while loop that uses the E-M K-Means alg to set the centers
  while(count < MAX_ITER && !labels.equals(oldlabs)) {
    
    arrayCopy(labels, oldlabs);
    
    /* Iterating through all pixels and assigning 
    them a label based on which center is closest  */
    for(int i = 0; i < ret.pixels.length; i++) {
      float mindist = Float.MAX_VALUE;
      
      // Going through all centers
      for(int j = 0; j < centroids.length; j++) {
        float d = distance(ret.pixels[i], centroids[j]);
        if (d <= mindist) {
          mindist = d;
          labels[i] = j;
        }
      }
    }
   
    /*  Assigning new values to the centroids 
    based on their newly calculated clusters  */
    int[] counts = new int[centroids.length];
    int[][] sums = new int[centroids.length][3];
    for(int i = 0; i < labels.length; i++) {
      counts[labels[i]]++;
      sums[labels[i]][0] += red(ret.pixels[i]);
      sums[labels[i]][1] += green(ret.pixels[i]);
      sums[labels[i]][2] += blue(ret.pixels[i]);
    }
    for (int i = 0; i < centroids.length; i++) {
      if (counts[i] != 0) {
        int r = sums[i][0] / counts[i];
        int g = sums[i][1] / counts[i];
        int b = sums[i][2] / counts[i];
        centroids[i] = color(r, g, b);
      }
    }
    count++;
  }
  
  /* Now that the while loop is exited, set the pixels 
  in ret to be equal to the centers they're closest to */
  for(int i = 0; i < labels.length; i++) {
    ret.pixels[i] = centroids[labels[i]];
  }
  
  ret.updatePixels();
  return ret;
}


// Helper function to calculated the Euclidian Distance from one color to another color
float distance(color c1, color c2){

  float r = red(c1) - red(c2);
  float b = blue(c1) - blue(c2);
  float g = green(c1) - green(c2);
  
  float sum = (r * r) + (b * b) + (g * g);
  
  return sqrt(sum);  
}