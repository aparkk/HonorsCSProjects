
import peasy.*;


int size = 200;
int limit = 180;

float x1, x2, x3, x4,
      y1, y2, y3, y4,
      z1, z2, z3, z4;
      
float u1, u2, t1, t2, t3, a;


PImage s, st, sf;
PeasyCam cam;

void setup() {
    size(1000, 700, P3D);
    
    cam = new PeasyCam(this, 0, 0, 0, 500);
    s = loadImage("stairs.jpeg");
    st = loadImage("stairstop.jpeg");
    sf = loadImage("stairsfront.jpeg");
    
    u1 = 7 * 1.3 * PI;
    u2 = 7 * 3.4 * PI;
    
    a = 0.45;
}

void drawStairs()  {
  strokeWeight(3);
  stroke(225);
  textureMode(NORMAL);
  
  noStroke();
  noFill();
  
  
  for(float t = -2 * PI; t < 4 * PI - 0.01; t += 30 * PI/180) {
    beginShape(QUAD_STRIP);
    
     texture(sf);
     
      t1 = a * t;
      t2 = a * (t + 30 * PI/180);
      t3 = a * (t + 60 * PI/180);
      
      
      x1 = u1 * cos(t2);
      y1 = 30 * t1;
      z1 = u1 * sin(t1);
      
      x2 = u2 * cos(t2);
      y2 = 30 * t1;
      z2 = u2 * sin(t1);
      
      x3 = u1 * cos(t2);
      y3 = 30 * t2;
      z3 = u1 * sin(t1);
      
      x4 = u2 * cos(t2);
      y4 = 30 * t2;
      z4 = u2 * sin(t1);
      
      
      vertex(x1, y1, z1, 0, 0);
      vertex(x2, y2, z2, 1, 0);
      
      vertex(x3, y3, z3, 0, 1);
      vertex(x4, y4, z4, 1, 1);
      
      endShape();
      
      beginShape(QUAD_STRIP);
      texture(st);
      
        x1 = u1 * cos(t3);
        y1 = 30 * t2;
        z1 = u1 * sin(t2);
      
        x2 = u2 * cos(t3);
        y2 = 30 * t2;
        z2 = u2 * sin(t2);
      
      
      vertex(x3, y3, z3, 0, 0);
      vertex(x4, y4, z4, 1, 0);
      
      vertex(x1, y1, z1, 0, 1);
      vertex(x2, y2, z2, 1, 1);
      
    endShape();
    
  }
}




void draw() {
    background(0);
    
    drawStairs();
}
