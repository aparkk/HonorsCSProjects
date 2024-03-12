
import peasy.*;


int size = 200;
int limit = 180;
float u1, u2, v1, v2, r1, r2;
PImage c, d;
PeasyCam cam;

void setup() {
    size(1000, 700, P3D);
    
    cam = new PeasyCam(this, 0, 0, 0, 500);
    c = loadImage("choco.jpeg");
    d = loadImage("donut.jpeg");
}

void drawDonut(PImage img1, PImage img2)  {
  strokeWeight(3);
  stroke(255);
  textureMode(IMAGE);
  
  noStroke();
  noFill();
  
  for(float u = 0; u < 2 * PI + 0.0001; u += PI/10) {
    beginShape(QUAD_STRIP);
    
    for(float v = 0; v < 2 * PI + 0.0001; v += PI/20) {
      u1 = u;
      u2 = u + PI/10;
      
      r1 = 80 + 40 * cos(u1);
      r2 = 80 + 40 * cos(u2);
      
      v1 = v;
      v2 = v + PI/20;
      
      if(u <= PI) texture(img1);
      else texture (img2);
      
      vertex(r1 * sin(v1), 40 * sin(u1), r1 * cos(v1), r1 * sin(v1), 40 * sin(u1));
      vertex(r2 * sin(v1), 40 * sin(u2), r2 * cos(v1), r2 * sin(v1), 40 * sin(u2));
      
      vertex(r1 * sin(v2), 40 * sin(u1), r1 * cos(v2), r2 * sin(v2), 40 * sin(u2));
      vertex(r2 * sin(v2), 40 * sin(u2), r2 * cos(v2), r1 * sin(v2), 40 * sin(u1));
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
    drawDonut(d, c);
}
