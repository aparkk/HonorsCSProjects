
import peasy.*;

int size = 200;
int limit = 180;
int r = 75;
float x, y, z;

PeasyCam cam;

void setup() {
    size(1000, 700, P3D);
    
    cam = new PeasyCam(this, 0, 0, 0, 500);
}

void drawCylinder()  {
  strokeWeight(3);
  stroke(255);
  
  noFill();
  
  for(float v = 0; v <= limit; v += 15) {
    beginShape();
    
    for(float u = 0; u < 2 * PI; u += PI / 180) {
      float x = r * cos(u);
      float y = v;
      float z = r * sin(u);
      
      vertex(x, -y, z);
    }
    
    endShape();
  }
  
  beginShape(LINES);
  
  for(float u = 0; u < 2 * PI; u += 15 * PI / 180) {
    float x = r * cos(u);
    float z = r * sin(u);
    
    vertex(x, 0, z);
    vertex(x, -limit, z);
  }
  
  endShape();
}

void drawAxes() {
    strokeWeight(5);
    
    stroke(255, 0, 0);
    line(0, 0, 0, size, 0, 0);
    
    stroke(255, 220, 220);
    line(-size, 0, 0, 0, 0, 0);
    
    stroke(0, 255, 0);
    line(0, 0, 0, 0, size, 0);
    
    stroke(220, 255, 220);
    line(0, -size, 0, 0, 0, 0);
    
    stroke(0, 0, 255);
    line(0, 0, 0, 0, 0, size);
    
    stroke(220, 220, 255);
    line(0, 0,-size, 0, 0, 0);
}

void draw() {
    background(0);
    
    drawAxes();
    drawCylinder();
}
