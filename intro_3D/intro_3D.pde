
import peasy.*;

int size = 200;
int limit = 175;
PeasyCam cam;

void setup() {
    size(1000, 700, P3D);
    
    cam = new PeasyCam(this, 0, 0, 0, 500);
}

void drawHyperboloid()  { //not finished
  strokeWeight(2);
  stroke(255);
  
  noFill();
  
  for(int x = -size; x <= size; x += 7) {
    beginShape();
    
    for(int z = -size; z <= size; z += 7) {
      float y = sqrt(((x * x) - (z * z)) - 200);
      
      if(y > size) vertex(x * size/y, -y * size/y, z * size/y);
      else vertex(x, -y, z);
    }
    
    endShape();
  }
  
  for(int z = -size; z <= size; z += 7) {
    beginShape();
    
    for(int x = -size; x <= size; x += 7) {
      float y = sqrt(((x * x) - (z * z)) - 200);

      if(y > size) vertex(x * size/y, -y * size/y, z * size/y);
      else vertex(x, -y, z);
      
    }
    
    endShape();
  }
  
  for(int x = -size; x <= size; x += 7) {
    beginShape();
    
    for(int z = -size; z <= size; z += 7) {
      float y = sqrt(((x * x) - (z * z)) - 200);
      
      if(y > size) vertex(x * size/y, y * size/y, z * size/y);
      else vertex(x, y, z);
    }
    
    endShape();
  }
  
  for(int z = -size; z <= size; z += 7) {
    beginShape();
    
    for(int x = -size; x <= size; x += 7) {
      float y = sqrt(((x * x) - (z * z)) - 200);

      if(y > size) vertex(x * size/y, y * size/y, z * size/y);
      else vertex(x, y, z);
      
    }
    
    endShape();
  }
  
}

void drawHyperbolicParaboloid()  {
  strokeWeight(2);
  stroke(85,255,225);
  
  noFill();
  
  for(int x = -limit; x <= limit; x += 7) {
    beginShape();
    
    for(int z = -limit; z <= limit; z += 7) {
      float y = (x * x)/200 - (z * z)/200;
      
      if(y > limit) vertex(x * limit/y, -y * limit/y, z * limit/y);
      else vertex(x, -y, z);
    }
    
    endShape();
  }
  
  for(int z = -limit; z <= limit; z += 7) {
    beginShape();
    
    for(int x = -limit; x <= limit; x += 7) {
      float y = (x * x)/200 - (z * z)/200;

      if(y > limit) vertex(x * limit/y, -y * limit/y, z * limit/y);
      else vertex(x, -y, z);
    }
    
    endShape();
  }
  
}

void drawParaboloid()  {
  strokeWeight(2);
  stroke(255,59,148);
  
  noFill();
  
  for(int x = -limit; x <= limit; x += 7) {
    beginShape();
    
    for(int z = -limit; z <= limit; z += 7) {
      float y = (x * x + z * z) / 125;
      
      if(y > limit) vertex(x * limit/y, -y * limit/y, z * limit/y);
      else vertex(x, -y, z);
    }
    
    endShape();
  }
  
  for(int z = -limit; z <= limit; z += 7) {
    beginShape();
    
    for(int x = -limit; x <= limit; x += 7) {
      float y = (x * x + z * z) / 125;

      if(y > limit) vertex(x * limit/y, -y * limit/y, z * limit/y);
      else vertex(x, -y, z);
    }
    
    endShape();
  }
  
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

void drawGridXZ() {
  strokeWeight(1);
  stroke(150);
  
  noFill();
  
  for(int x = 0; x < size; x += 7) {
    beginShape();
    
    for(int z = 0; z <= size; z += 7)
      vertex(x, 0, z);
    vertex(x, 0, size);
    
    endShape();
  }
  
  for(int z = 0; z < size; z += 7) {
    beginShape();
    
    for(int x = 0; x <= size; x += 7)
      vertex(x, 0, z);
    vertex(size, 0, z);
    
    endShape();
  }
}

void draw() {
    background(0);
    
    drawAxes();
    drawGridXZ();
    
    drawParaboloid();
    drawHyperbolicParaboloid();
    //drawHyperboloid();
}
