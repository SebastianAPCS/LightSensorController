boolean jumpState;
double x;
double tRef;
double v0 = 10;
double a = -9.81;

void setup() {
  size(400, 400); // Create a canvas
  jumpState = false;
  x = 0;
  tRef = 0;
}

void draw() {
  background(220); // Clear the canvas
  
  if (jumpState) {
    double t = (millis() - tRef) / 1000.0;
    x = 0.5 * a * t * t + v0 * t;
    System.out.println("T: " + t);
    System.out.println("X: " + x);
    
    if (x < 0) {
      x = 0;
      jumpState = false;
    }
  }

  // Display the x value on the canvas
  textSize(16);
  fill(0);
  text("x: " + x, 10, 20);
}

void mousePressed() {
  if (!jumpState) {
    jumpState = true;
    tRef = millis();
  }
}
