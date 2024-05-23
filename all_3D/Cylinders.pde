
class Cylinders {
  PShape c;
  PImage img1, img2, img3;
  float x1, x2, x3, x4,
    y1, y2, y3, y4,
    z1, z2, z3, z4,
    u1, u2,
    v1, v2,
    r1, r2,
    h;

  Cylinders(float outerR, float innerR, float heightC, PImage image1, PImage image2) {
    r1 = outerR;
    r2 = innerR;
    h = heightC;
    img1 = image1;
    img2 = image2;
  }

  Cylinders(float radius, float heightC, PImage image1, PImage image2, PImage image3) {
    r1 = radius;
    h = heightC;
    img1 = image1;
    img2 = image2;
    img3 = image3;
  }


  void createCylinder() {
    textureMode(NORMAL);
    
    noStroke();
    noFill();

    float ty1 = 0;
    float ty2 = 1f/36;

    for (float u = 0; u < 2 * PI - 0.01; u += 10 * PI / 180) {
      beginShape(QUADS);

      float tx1 = 0;
      float tx2 = 1f/4;

      for (float v = -h/2; v < h/2 - 0.01; v += h/4) {
        noStroke();

        u1 = u;
        u2 = u + 10 * PI/180;

        v1 = v;
        v2 = v + h/4;


        x1 = r1 * cos(u1);
        y1 = v1;
        z1 = r1 * sin(u1);

        x2 = r1 * cos(u2);
        y2 = v1;
        z2 = r1 * sin(u2);


        x3 = r1 * cos(u1);
        y3 = v2;
        z3 = r1 * sin(u1);

        x4 = r1 * cos(u2);
        y4 = v2;
        z4 = r1 * sin(u2);


        texture(img1);


        vertex(x1, y1, z1, tx1, ty1);
        vertex(x2, y2, z2, tx1, ty2);
        vertex(x4, y4, z4, tx2, ty2);
        vertex(x3, y3, z3, tx2, ty1);


        endShape();

        tx1 += 1f/4;
        tx2 += 1f/4;
      }

      ty1 += 1f/36;
      ty2 += 1f/36;
    }

    ty1 = 0;
    ty2 = 1f/36;

    for (float u = 0; u < 2 * PI - 0.01; u += 10 * PI / 180) {
      beginShape(QUADS);

      float tx1 = 0;
      float tx2 = 1f/4;

      for (float v = -h/2; v < h/2 - 0.01; v += h/4) {
        noStroke();

        u1 = u;
        u2 = u + 10 * PI/180;

        v1 = v;
        v2 = v + h/4;


        x1 = r2 * cos(u1);
        y1 = v1;
        z1 = r2 * sin(u1);

        x2 = r2 * cos(u2);
        y2 = v1;
        z2 = r2 * sin(u2);


        x3 = r2 * cos(u1);
        y3 = v2;
        z3 = r2 * sin(u1);

        x4 = r2 * cos(u2);
        y4 = v2;
        z4 = r2 * sin(u2);


        texture(img1);


        vertex(x1, y1, z1, tx1, ty1);
        vertex(x2, y2, z2, tx1, ty2);
        vertex(x4, y4, z4, tx2, ty2);
        vertex(x3, y3, z3, tx2, ty1);


        endShape();

        tx1 += 1f/4;
        tx2 += 1f/4;
      }

      ty1 += 1f/36;
      ty2 += 1f/36;
    }

    if (img3 == null) {



      for (float l = -h/2; l <= h/2; l += h) {
        beginShape(QUADS);
        float tx1 = 0;
        float tx2 = 1f/8;

        ty1 = 0;
        ty2 = 1f/36;

        for (float u = 0; u < 2 * PI - 0.01; u += 10 * PI / 180) {


          texture(img2);

          u1 = u;
          u2 = u + 10 * PI/180;

          x1 = r1 * cos(u1);
          z1 = r1 * sin(u1);

          x2 = r1 * cos(u2);
          z2 = r1 * sin(u2);

          x3 = r2 * cos(u1);
          z3 = r2 * sin(u1);

          x4 = r2 * cos(u2);
          z4 = r2 * sin(u2);

          vertex(x1, l, z1, tx1, ty1);
          vertex(x2, l, z2, tx1, ty2);
          vertex(x4, l, z4, tx2, ty2);
          vertex(x3, l, z3, tx2, ty1);

          endShape();

          ty1 += 1f/36;
          ty2 += 1f/36;
        }
      }
    } else {
      for (float u = 0; u < 2 * PI - 0.01; u += 10 * PI / 180) {
        beginShape(TRIANGLES);

        texture(img2);
        u1 = u;
        u2 = u + 10 * PI/180;

        x1 = r1 * cos(u1);
        z1 = r1 * sin(u1);

        x2 = r1 * cos(u2);
        z2 = r1 * sin(u2);

        vertex(0, h/2 + 2.5, 0, 0.5, 0.5);
        vertex(x1, h/2, z1, (1 + sin(u1)) / 2, (1 + cos(u1)) / 2);
        vertex(x2, h/2, z2, (1 + sin(u2)) / 2, (1 + cos(u2)) / 2);

        endShape();
      }


      for (float u = 0; u < 2 * PI - 0.01; u += 10 * PI / 180) {
        beginShape(TRIANGLES);

        texture(img3);

        u1 = u;
        u2 = u + 10 * PI/180;

        x1 = r1 * cos(u1);
        z1 = r1 * sin(u1);

        x2 = r1 * cos(u2);
        z2 = r1 * sin(u2);

        vertex(0, -h/2 - 2.5, 0, 0.5, 0.5);
        vertex(x1, -h/2, z1, (1 + sin(u1)) / 2, (1 + cos(u1)) / 2);
        vertex(x2, -h/2, z2, (1 + sin(u2)) / 2, (1 + cos(u2)) / 2);

        endShape();
      }
    }
  }
}
