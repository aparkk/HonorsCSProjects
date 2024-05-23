
import peasy.*;

int size = 200;
int limit = 180;
int r = 100;
float x1, x2, x3, x4,
      y1, y2, y3, y4,
      z1, z2, z3, z4,
      u1, u2, 
      v1, v2;

PImage img;

PeasyCam cam;

void setup() {
    size(1000, 700, P3D);
    
    cam = new PeasyCam(this, 0, 0, 0, 500);
}

void drawSphere() {
  strokeWeight(3);
  stroke(255);
  
  noFill();
  
  for(float v = 0; v < 2 * PI; v += 20 * PI / 180) {
    beginShape(QUADS);
    
    for(float u = 0; u < PI; u += 15 * PI / 180) {
      u1 = u;
      u2 = u + 15 * PI/180;
      
      v1 = v;
      v2 = v + 20 * PI/180;
      
      x1 = r * cos(v1) * sin(u1);
      y1 = r * cos(u1);
      z1 = r * sin(v1) * sin(u1);
      
      x2 = r * cos(v1) * sin(u2);
      y2 = r * cos(u2);
      z2 = r * sin(v1) * sin(u2);
      
      
      x3 = r * cos(v2) * sin(u1);
      y3 = r * cos(u1);
      z3 = r * sin(v2) * sin(u1);
      
      x4 = r * cos(v2) * sin(u2);
      y4 = r * cos(u2);
      z4 = r * sin(v2) * sin(u2);
      
      
      vertex(x1, y1, z1);
      vertex(x2, y2, z2);
      vertex(x4, y4, z4);
      vertex(x3, y3, z3);
      
      endShape();
    }
  }
  
}

void draw() {
    background(0);
    
    drawSphere();
}
