
import peasy.*;

int size = 200;
int limit = 180;
int r = 50;
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
    img = loadImage("cant.jpeg");
    textureMode(NORMAL);
}

void drawCylinder() {
  strokeWeight(3);
  stroke(255);
  noStroke();
  noFill();
  float ty1 = 0;
  float ty2 = 1f/36;
    
  for(float u = 0; u < 2 * PI; u += 10 * PI / 180) {
    beginShape(QUADS);
    
    float tx1 = 0;
      float tx2 = 1f/3;
    
      for(float v = 0; v < 150; v += 50) {
      u1 = u;
      u2 = u + 10 * PI/180;
      
      v1 = v;
      v2 = v + 50;
      
      x1 = r * cos(u1);
      y1 = v1;
      z1 = r * sin(u1);
      
      x2 = r * cos(u2);
      y2 = v1;
      z2 = r * sin(u2);
      
      
      x3 = r * cos(u1);
      y3 = v2;
      z3 = r * sin(u1);
      
      x4 = r * cos(u2);
      y4 = v2;
      z4 = r * sin(u2);
      
      //texture(img);
      
      vertex(x1, y1, z1, tx1, ty1);
      vertex(x2, y2, z2, tx1, ty2);
      vertex(x4, y4, z4, tx2, ty2);
      vertex(x3, y3, z3, tx2, ty1);
      
      endShape();
      
      tx1 += 1f/3;
      tx2 += 1f/3;
    }
    
     ty1 += 1f/36;
     ty2 += 1f/36;
  }
  
}

void drawQuads() {
  strokeWeight(3);
  stroke(255);
  noFill();
    
  for(float u = 0; u < 30 * PI/180; u += 10 * PI / 180) {
    beginShape(QUADS);
    
      for(float v = 0; v < 150; v += 75) {
      u1 = u;
      u2 = u + 10 * PI/180;
      
      v1 = v;
      v2 = v + 75;
      
      x1 = r * cos(u1);
      y1 = v1;
      z1 = r * sin(u1);
      
      x2 = r * cos(u2);
      y2 = v1;
      z2 = r * sin(u2);
      
      
      x3 = r * cos(u1);
      y3 = v2;
      z3 = r * sin(u1);
      
      x4 = r * cos(u2);
      y4 = v2;
      z4 = r * sin(u2);
      
      
      vertex(x1, y1, z1);
      vertex(x2, y2, z2);
      vertex(x4, y4, z4);
      vertex(x3, y3, z3);
      
      endShape();
      }
  }
 /*
  beginShape(TRIANGLES);
  for(float u = 0; u < 2 * PI; u += 10 * PI / 180) {
    strokeWeight(3);
    stroke(255);
    
      u1 = u;
      u2 = u + 10 * PI/180;
      
      x1 = r * cos(u1);
      y1 = 0;
      z1 = r * sin(u1);
      
      x2 = r * cos(u2);
      y2 = 0;
      z2 = r * sin(u2);
      
      vertex(0, 0, 0);
      vertex(x1, y1, z1);
      vertex(x2, y2, z2);
  }
  endShape();
  */
  
  beginShape(QUADS);
  for(float u = 0; u < 2 * PI; u += 10 * PI / 180) {
    strokeWeight(3);
    stroke(255);
    
      u1 = u;
      u2 = u + 10 * PI/180;
    
      x1 = r * cos(u1);
      z1 = r * sin(u1);
      
      x2 = r * cos(u2);
      z2 = r * sin(u2);
      
      x3 = 1 * cos(u1);
      z3 = 1 * sin(u1);
      
      x4 = 1 * cos(u2);
      z4 = 1 * sin(u2);
      texture(img);
      noStroke();
      vertex(x1, 0, z1, (1 + sin(u1)) / 2, (1 + cos(u1)) / 2);
      vertex(x2, 0, z2, (1 + sin(u2)) / 2, (1 + cos(u2)) / 2);
      
      vertex(x4, 0, z4, (1 + sin(u2)/r) / 2,  (1 + cos(u2)/r) / 2);
      vertex(x3, 0, z3, (1 + sin(u1)/r) / 2, (1 + cos(u1)/r) / 2);
      
      
  }
  endShape();
}

void draw() {
    background(0);
    
    drawQuads();
    //drawCylinder();
}
