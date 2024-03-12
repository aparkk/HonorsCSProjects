
import peasy.*;


int size = 200;
int limit = 180;
float u1, u2, t1, t2, a;
float[][] v;
PImage s;
PeasyCam cam;

void setup() {
    size(1000, 700, P3D);
    
    cam = new PeasyCam(this, 0, 0, 0, 500);
    s = loadImage("stairs.jpeg");
    
    u1 = 1.3 * PI;
    u2 = 3.4 * PI;
    
    a = 0.45;
}

void drawStairs()  {
  strokeWeight(3);
  stroke(225);
  textureMode(IMAGE);
  
  noStroke();
  noFill();
  beginShape(QUAD_STRIP);
  texture(s);
  
  float[][] v = new float[4][3];
  
  t1 = -2 * PI - 30 * PI/180;
  t2 = -2 * PI;
  
      vertex(7 * u1 * cos(a * t2), 13 * t1, 7 * u1 * sin(a * t1), 0, 64);
      vertex(7 * u2 * cos(a * t2), 13 * t1, 7 * u2 * sin(a * t1), 512, 64);
  
      v[2][0] = 7 * u1 * cos(a * t2);
      v[2][1] = 13 * t2;
      v[2][2] = 7 * u1 * sin(a * t1);
      v[3][0] = 7 * u2 * cos(a * t2);
      v[3][1] = 13 * t2;
      v[3][2] = 7 * u2 * sin(a * t1);
      
      vertex(v[2][0], v[2][1], v[2][2], 0, 128);
      vertex(v[3][0], v[3][1], v[3][2], 512, 128);
  
  endShape();
  for(float t = -2 * PI; t <= 4 * PI; t += 30 * PI/180) {
    beginShape(QUAD_STRIP);
     texture(s);
      t1 = t;
      t2 = t + 30 * PI/180;
      
      vertex(v[2][0], v[2][1], v[2][2], 0, 0);
      vertex(v[3][0], v[3][1], v[3][2], 512, 0);
      
      v[0][0] = 7 * u1 * cos(a * t2);
      v[0][1] = 13 * t1;
      v[0][2] = 7 * u1 * sin(a * t1);
      v[1][0] = 7 * u2 * cos(a * t2);
      v[1][1] = 13 * t1;
      v[1][2] = 7 * u2 * sin(a * t1);
  
      vertex(v[0][0], v[0][1], v[0][2], 0, 64);
      vertex(v[1][0], v[1][1], v[1][2], 512, 64);
      
      
      vertex(v[0][0], v[0][1], v[0][2], 0, 64);
      vertex(v[1][0], v[1][1], v[1][2], 512, 64);
      
      v[2][0] = 7 * u1 * cos(a * t2);
      v[2][1] = 13 * t2;
      v[2][2] = 7 * u1 * sin(a * t1);
      v[3][0] = 7 * u2 * cos(a * t2);
      v[3][1] = 13 * t2;
      v[3][2] = 7 * u2 * sin(a * t1);
      
      vertex(v[2][0], v[2][1], v[2][2], 0, 128);
      vertex(v[3][0], v[3][1], v[3][2], 512, 128);
      
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
    drawStairs();
}
