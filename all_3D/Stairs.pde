

class Stairs {
  float x1, x2, x3, x4, x5, x6,
    y1, y2, y3, y4, y5, y6,
    z1, z2, z3, z4, z5, z6,
    u1, u2,
    t1, t2, t3,
    a;

  PImage img1, img2;


  Stairs (PImage image1, PImage image2) {
    img1 = image1;
    img2 = image2;
    
    u1 = 7 * 1.3 * PI;
    u2 = 7 * 3.4 * PI;
    
    a = 0.45;
  }


  void createStairs() {
    textureMode(NORMAL);

    noStroke();
    noFill();

    for (float t = -2 * PI; t < 4 * PI - 0.01; t += 30 * PI/180) {
      beginShape(QUADS);

      texture(img1);

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
      vertex(x4, y4, z4, 1, 1);
      vertex(x3, y3, z3, 0, 1);

      endShape();

      beginShape(QUADS);
      texture(img2);

      x5 = u1 * cos(t3);
      y5 = 30 * t2;
      z5 = u1 * sin(t2);

      x6 = u2 * cos(t3);
      y6 = 30 * t2;
      z6 = u2 * sin(t2);


      vertex(x3, y3, z3, 0, 0);
      vertex(x4, y4, z4, 1, 0);
      vertex(x6, y6, z6, 1, 1);
      vertex(x5, y5, z5, 0, 1);

      endShape();
    }
  }
}
