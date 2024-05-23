
class Cubes {
  PShape c;
  PImage[] img;
  float x1, x2, y1, y2, z1, z2, s;

  Cubes(float side, PImage[] image) {
    s = side;

    x1 = -s/2;
    x2 = s/2;

    y1 = s/2;
    y2 = -s/2;

    z1 = -s/2;
    z2 = s/2;

    img = image;
  }

  void createCube() {
    textureMode(NORMAL);
    
    planeXY(z1, img[0]);
    planeXY(z2, img[1]);

    planeXZ(y1, img[2]);
    planeXZ(y2, img[3]);

    planeYZ(x1, img[4]);
    planeYZ(x2, img[5]);
  }

  void planeXY(float z, PImage img) {

    beginShape(QUADS);

    noFill();
    noStroke();

    texture(img);

    vertex (x1, y1, z, 0, 0);
    vertex (x1, y2, z, 0, 1);
    vertex (x2, y2, z, 1, 1);
    vertex (x2, y1, z, 1, 0);

    endShape();
  }

  void planeXZ (float y, PImage img) {

    beginShape(QUADS);

    noFill();
    noStroke();

    texture(img); //bottom

    vertex (x1, y, z1, 0, 0);
    vertex (x1, y, z2, 0, 1);
    vertex (x2, y, z2, 1, 1);
    vertex (x2, y, z1, 1, 0);

    endShape();
  }

  void planeYZ (float x, PImage img) {

    beginShape(QUADS);

    noFill();
    noStroke();

    texture(img); //right

    vertex (x, y1, z1, 0, 0);
    vertex (x, y1, z2, 0, 1);
    vertex (x, y2, z2, 1, 1);
    vertex (x, y2, z1, 1, 0);

    endShape();
  }
}
