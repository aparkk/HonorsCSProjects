
class Torus {
  PShape t;
  PImage img, img1, img2;
  float x1, x2, x3, x4,
    y1, y2, y3, y4,
    z1, z2, z3, z4,
    u1, u2,
    v1, v2,
    c, a;

  Torus(float outerR, float innerR) {
    c = outerR;
    a = innerR;

    colorMode(HSB);
  }

  Torus(float outerR, float innerR, PImage image) {
    c = outerR;
    a = innerR;

    img = image;
  }

  Torus(float outerR, float innerR, PImage image1, PImage image2) {
    c = outerR;
    a = innerR;

    img1 = image1;
    img2 = image2;
  }

  void createTorus() {
    textureMode(NORMAL);
    
    noStroke();
    noFill();

    if (img == null && img1 == null && img2 == null) {
      strokeWeight(3);
      for (float v = 0; v < 2 * PI - PI/2; v += 10 * PI /180) {
        beginShape();

        for (float u = 0; u < 2 * PI; u += PI/180) {
          stroke(u * 180/PI, 255, 255);

          x1 = (c + a * cos(u)) * sin(v);
          y1 = a * sin(u);
          z1 = (c + a * cos(u)) * cos(v);

          vertex(x1, y1, z1);
        }
        endShape();
      }
    } else {

      float tx1 = 0;
      float tx2 = 1f/24;

      for (float v = 0; v < 2 * PI - 0.1; v += 15 * PI / 180) {
        beginShape(QUADS);

        float ty1 = 0;
        float ty2 = 1f/18;

        for (float u = -PI; u < PI - 0.1; u += 20 * PI / 180) {
          u1 = u;
          u2 = u + 20 * PI/180;

          v1 = v;
          v2 = v + 15 * PI/180;


          x1 = (c + a * cos(u1)) * sin(v1);
          y1 = a * sin(u1);
          z1 = (c + a * cos(u1)) * cos(v1);

          x2 = (c + a * cos(u1)) * sin(v2);
          y2 = a * sin(u1);
          z2 = (c + a * cos(u1)) * cos(v2);

          x3 = (c + a * cos(u2)) * sin(v1);
          y3 = a * sin(u2);
          z3 = (c + a * cos(u2)) * cos(v1);

          x4 = (c + a * cos(u2)) * sin(v2);
          y4 = a * sin(u2);
          z4 = (c + a * cos(u2)) * cos(v2);


          if (img != null && (img1 == null && img2 == null)) {
            texture(img);
          }


          if (img == null && (img1 != null && img2 != null)) {
            texture(img1);
            if (u >= 0) break;
          }


          vertex(x1, y1, z1, ty1, tx1);
          vertex(x2, y2, z2, ty1, tx2);
          vertex(x4, y4, z4, ty2, tx2);
          vertex(x3, y3, z3, ty2, tx1);


          endShape();

          ty1 += 1f/18;
          ty2 += 1f/18;
        }

        tx1 += 1f/24;
        tx2 += 1f/24;
      }


      if (img == null && (img1 != null && img2 != null)) {
        tx1 = 0;
        tx2 = 1f/24;

        for (float v = 0; v < 2 * PI - 0.1; v += 15 * PI / 180) {
          beginShape(QUADS);

          float ty1 = 0;
          float ty2 = 1f/18;

          for (float u = 0; u < PI - 0.1; u += 20 * PI / 180) {
            u1 = u;
            u2 = u + 20 * PI/180;

            v1 = v;
            v2 = v + 15 * PI/180;


            x1 = (c + a * cos(u1)) * sin(v1);
            y1 = a * sin(u1);
            z1 = (c + a * cos(u1)) * cos(v1);

            x2 = (c + a * cos(u1)) * sin(v2);
            y2 = a * sin(u1);
            z2 = (c + a * cos(u1)) * cos(v2);

            x3 = (c + a * cos(u2)) * sin(v1);
            y3 = a * sin(u2);
            z3 = (c + a * cos(u2)) * cos(v1);

            x4 = (c + a * cos(u2)) * sin(v2);
            y4 = a * sin(u2);
            z4 = (c + a * cos(u2)) * cos(v2);


            texture(img2);

            vertex(x1, y1, z1, ty1, tx1);
            vertex(x2, y2, z2, ty1, tx2);
            vertex(x4, y4, z4, ty2, tx2);
            vertex(x3, y3, z3, ty2, tx1);


            endShape();

            ty1 += 1f/18;
            ty2 += 1f/18;
          }

          tx1 += 1f/24;
          tx2 += 1f/24;
        }
      }
    }
  }
}
