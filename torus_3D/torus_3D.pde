
import peasy.*;


int size = 200;
int limit = 180;
int a = 35;
int b = 80;
float x, y, z, r;
float x1, y1, z1, r1;
PeasyCam cam;

void setup() {
    size(1000, 700, P3D);
    
    cam = new PeasyCam(this, 0, 0, 0, 500);
}

void drawTorus()  {
  strokeWeight(3);
  stroke(255);
  
  noFill();
  for(float v = 0; v < 2 * PI; v +=  7 * PI / 180) {
    beginShape();
    
    for(float u = 0; u < 2 * PI; u += PI / 180) {
      r = b + a * cos(u);
     
      x = r * sin(v);
      y = a * sin(u);
      z = r * cos(v);
      
      vertex(x, y, z);
    }
    endShape();
  }
  
  for(float v = 0; v < 2 * PI; v +=  15 * PI / 180) {
    beginShape();
    
    for(float u = 0; u < 2 * PI; u += PI / 180) {
      r = b + a * cos(v);
     
      x = r * sin(u);
      y = a * sin(v);
      z = r * cos(u);
      
      vertex(x, y, z);
    }
    endShape();
  }
}

void drawAxes() {
  // x - red, y - green, z - blue
  
    strokeWeight(5);
    
    fill(255, 0, 0);
    textSize(25);
    text("x", size + 10, 5, 0);
    
    stroke(255, 0, 0);
    line(0, 0, 0, size, 0, 0);
    stroke(255, 220, 220);
    line(-size, 0, 0, 0, 0, 0);
    
    
    fill(0, 255, 0);
    textSize(25);
    text("y", -5, size + 20, 0);
    
    stroke(0, 255, 0);
    line(0, 0, 0, 0, size, 0);
    stroke(220, 255, 220);
    line(0, -size, 0, 0, 0, 0);
    
    
    fill(0, 0, 255);
    textSize(25);
    rotateY(PI/2);
    text("z", -(size + 20), 5, 0);
    rotateY(-PI/2);
    
    stroke(0, 0, 255);
    line(0, 0, 0, 0, 0, size);
    stroke(220, 220, 255);
    line(0, 0,-size, 0, 0, 0);
}

void draw() {
    background(0);
    
    drawAxes();
    drawTorus();
}
