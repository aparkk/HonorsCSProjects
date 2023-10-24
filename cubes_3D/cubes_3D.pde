int max = 255;

void setup() {
  size(1000, 800, P3D);
}

void draw() {
  background(0);
  translate(width / 2, height / 2, -2 * max);
  rotateX(frameCount * .01);
  rotateY(frameCount * .01);
  rotateZ(frameCount * .01);
  
  for(int i = -max; i <= max; i += 50) {
    for(int j = -max; j <= max; j += 50) {
      for(int k = -max; k <= max; k += 50){
        pushMatrix();
        translate (i, j, k);
        rotateX(frameCount * .02);
        rotateY(frameCount * .02);
        rotateZ(frameCount * .02);
        fill((i + 255)/2, (j + 255)/2, (k + 255)/2);
        box((float) (17 + (Math.sin(frameCount / 20.0)) * 10));
        popMatrix();
      }
    }
  }
}
