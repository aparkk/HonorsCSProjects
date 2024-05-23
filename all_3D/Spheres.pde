
class Spheres {
  PShape s;
  PImage img;
  float x1, x2, x3, x4,
    y1, y2, y3, y4,
    z1, z2, z3, z4,
    u1, u2,
    v1, v2, r;


  Spheres(float radius, PImage image) {
    r = radius;

    img = image;
  }

  void createSphere() {
    textureMode(NORMAL);
    
    noStroke();
    noFill();
    
    float tx1 = 0;
    float tx2 = (1f/36);

    for (float v = 0; v < 2 * PI - 0.1; v += 10 * PI / 180) {
      beginShape(QUADS);

      float ty1 = 0;
      float ty2 = 1f/15;

      for (float u = 0; u < PI - 0.1; u += 12 * PI / 180) {
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


        texture(img);


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
}
