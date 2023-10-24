
float angle;

void setup() {
  size(1000, 800);
  noStroke();
  colorMode(HSB);
}

void draw() {
  background(255);
  float x = width;
  float d = 110;
  int num = 100;
  
  translate(width/2, height/2);
  for (float a = 0; a < 360; a += 22.5) {
    rotate(radians(a));
    pushMatrix();
    for (int i = 0; i < num; i++) {
      scale(0.95);
      rotate(radians(angle));
      fill(noise(1), i, a);
      ellipse(x, 0, d, d);
    }
    popMatrix();
    
    pushMatrix();
    for(int i = 0; i < num; i++) {
      scale(0.95);
      rotate(-radians(angle));
      ellipse(x, 0, d, d);
    }
    popMatrix();
  }
  angle += 0.01;
}
    
  
