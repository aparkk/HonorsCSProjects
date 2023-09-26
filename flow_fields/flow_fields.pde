float speed = 100;
float constant = 0.005;

ArrayList<Particle> particles = new ArrayList<Particle>(0);

void setup() {
  colorMode(HSB);
  size(800, 750);
  background(0);
}

void draw() {
  for(Particle p : particles) {
    p.update();
  }
  
  if(keyPressed) {
    for(int i = 0; i < 500; i++) {
      particles.add(new Particle(random(width), random(height)));
    }
  }
}

class Particle {
  PVector pos;
  PVector vel;
  float noiseValue;
  
  Particle(float x, float y) {
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
  }
  
  void update() {
    if(pos.x > 0 & pos.x < width & pos.y > 0 & pos.y < height) {
      noiseValue = noise(pos.x * constant, pos.y * constant);
      vel = PVector.fromAngle(noiseValue * 15);
      vel.setMag(speed);
      pos.add(PVector.div(vel, frameRate));
      display();
    }
  }
  
  void display() {
    fill((2 * noiseValue * 255) % 255, 255, 255);
    noStroke();
    circle(pos.x, pos.y, 0.5);
  }
}
