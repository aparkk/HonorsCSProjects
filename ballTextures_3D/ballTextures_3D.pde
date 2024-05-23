
import peasy.*;


PImage soccer, b;
float x1, x2, x3, x4,
        y1, y2, y3, y4,
        z1, z2, z3, z4,
        u1, u2, 
        v1, v2, r;

PeasyCam cam;

void setup() {
    size(1000, 700, P3D);
    
    cam = new PeasyCam(this, 0, 0, 0, 500);
    soccer = loadImage("soccer.jpeg");
    b = loadImage("basketball.jpeg");
    r = 100;
    //noStroke();
    noFill();
    textureMode(NORMAL);
}



void draw() {
    background(0);
    
    
    /*
     float tx1 = 0;
    float tx2 = 0.25;
    for(int i = 0; i < 400; i += 100) {
      
    beginShape(QUADS);
    strokeWeight(3);
    stroke(255);
    
    float ty1 = 0;
      float ty2 = 0.25;
      
    for(int j = 0; j < 200; j+=50) {
      
      texture(basketball);
      
      
    vertex(i, j, 0,tx1, ty1);
    vertex(i, j + 50, 0, tx1, ty2);
    vertex(i + 100, j + 50, 0, tx2, ty2);
    vertex(i + 100, j, 0, tx2, ty1);
    endShape();
     ty1 += 0.25;
     ty2 += 0.25;
      
    }
    tx1 += 0.25;
    tx2 += 0.25;
    
    }
    */
    float tx1 = 0;
    float tx2 = (1f/36);
  
    for(float v = 0; v < 2 * PI; v += 10 * PI / 180) {
      beginShape(QUADS);
      noStroke();
      
      float ty1 = 0;
      float ty2 = 1f/15;
      
      for(float u = 0; u < PI; u += 12 * PI / 180) {
        u1 = u;
        u2 = u + 12 * PI/180;
        
        v1 = v;
        v2 = v + 10 * PI/180;
      
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
      
        //vertex(u1, v1, 0);
      //vertex(u1, v2, 0);
        
        texture(b);
      
      
        vertex(x1, y1, z1, tx1, ty1);
        vertex(x2, y2, z2, tx1, ty2);
        vertex(x4, y4, z4, tx2, ty2);
        vertex(x3, y3, z3, tx2, ty1);

      
        endShape();
      
        ty1 += 1f/15;
        ty2 += 1f/15;
      }
      
      tx1 += 1f/36;
      tx2 += 1f/36;
      
    }
  }
