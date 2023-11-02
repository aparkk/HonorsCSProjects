
import peasy.*;

int size = 200;
PeasyCam cam;

void setup() {
    size(1000, 700, P3D);
    
    cam = new PeasyCam(this, 0, 0, 0, 500);
}


void drawAxes() {
    strokeWeight(5);
    
    stroke(255, 0, 0);
    line(0, 0, 0, size, 0, 0);
    
    stroke(255, 220, 220);
    line(-size, 0, 0, 0, 0, 0);
    
    stroke(0, 255, 0);
    line(0, 0, 0, 0, -size, 0);
    
    stroke(220, 255, 220);
    line(0, size, 0, 0, 0, 0);
    
    stroke(0, 0, 255);
    line(0, 0, 0, 0, 0, size);
    
    stroke(220, 220, 255);
    line(0, 0,-size, 0, 0, 0);
}

void drawGrid() {
  strokeWeight(2);
  stroke(150);
  
  beginShape(LINES);
  for(int i = 20; i < 200; i += 20) {
    vertex(i, 0, 0);
    vertex(i, 0, size);
  }
  for(int i = 20; i < 200; i += 20) {
    vertex(0, 0, i);
    vertex(size, 0, i);
  }
  endShape();
}

void draw() {
    background(0);
    drawAxes();
    drawGrid();
}
