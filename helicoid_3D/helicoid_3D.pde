
import peasy.*;


int size = 200;
int limit = 180;
float x, y, z;
PeasyCam cam;

void setup() {
    size(1000, 700, P3D);
    
    cam = new PeasyCam(this, 0, 0, 0, 500);
}

void drawHelix()  {
  strokeWeight(3);
  stroke(255,59,148);
  
  noFill();
  
  beginShape();
  for(float t = 0; t < 10 * PI; t +=  5 * PI/180) {
      x = 40 * cos(t);
      y = 5 * t;
      z = 40 * sin(t);
      
      vertex(x, y, z);
  }
  endShape();
}

void drawHelicoid()  {
  strokeWeight(3);
  stroke(85,255,225);
  
  noFill();
  
  for(float t = 0; t <= 8 * PI; t +=  15 * PI/180) {
    
    beginShape();
    for(float u = 0; u <= 2 * PI; u += 50 * PI/ 180) {
      x = 7 * u * cos(t);
      y = 7 * t;
      z = 7 * u * sin(t);
      
      vertex(x, -y, z);
    }
    endShape();
  }
  
  for(float u = 0; u <= 2 * PI; u +=  50 * PI/180) {
    beginShape();
    
    for(float t = 0; t <= 8 * PI; t += 15 * PI/ 180) {
      x = 7 * u * cos(t);
      y = 7 * t;
      z = 7 * u * sin(t);
      
      vertex(x, -y, z);
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
    drawHelix();
    drawHelicoid();
}
