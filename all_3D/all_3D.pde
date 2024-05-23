
import peasy.*;

int rIndex = 1;
int shapeIndex = 0;
int shapeState = 0;
int shapeNum = 0;

int size = 200;
float angle;

PeasyCam cam;

Cubes blk, wht, rbks, crt;
PImage[] diceBlk, diceWht, rubiks, crate;

Spheres bch, ten, soc, glb, bb;
PImage be, t, s, g, b;

Torus dnt, spr, stp, dgstp, pmk, cshn, apl, wtm, rbsl;
PImage d, sp, st, dst, p, csn, ap, wt;

Cylinders tcn, stne, btty, tssu;
PImage cn, cnb, cnt, stn, bt, btb, btt, tss, tsst;

Stairs mtlS, stneS, mrblS, wdnS;
PImage mf, mt, stf, stt, mbf, mbt, wdf, wdt;

void setup() {
  size(1000, 700, P3D);

  cam = new PeasyCam(this, 0, 20, 0, 500);



  diceBlk = new PImage[6];
  diceWht = new PImage[6];
  rubiks = new PImage[6];
  crate = new PImage[6];

  for (int i = 0; i < 6; i++) {
    diceBlk[i] = loadImage("dice-black-" + (i + 1) + ".png");
    diceWht[i] = loadImage("dice-white-" + (i + 1) + ".png");
    rubiks[i] = loadImage("rubiks-" + i + ".png");
    crate[i] = loadImage("crate-" + i + ".png");
  }

  blk = new Cubes(90, diceBlk);
  wht = new Cubes(80, diceWht);
  rbks = new Cubes(110, rubiks);
  crt = new Cubes(120, crate);



  be = loadImage("beachball.jpeg");
  t = loadImage("tennis.png");
  s = loadImage("soccer.jpeg");
  g = loadImage("globe.jpeg");
  b = loadImage("basketball.jpeg");

  bch = new Spheres(80, be);
  ten = new Spheres(50, t);
  soc = new Spheres(70, s);
  glb = new Spheres(90, g);
  bb = new Spheres(70, b);



  d = loadImage("donut.jpg");
  sp = loadImage("sprinkles.jpeg");
  st = loadImage("stripes.jpeg");
  dst = loadImage("diagonalstripes.png");
  p = loadImage("pumpkin.jpeg");
  csn = loadImage("cushion.jpeg");
  ap = loadImage("apple.jpeg");
  wt = loadImage("watermelon.jpeg");

  dnt = new Torus(80, 40, d);
  spr = new Torus(80, 40, sp, d);
  stp = new Torus(60, 30, st);
  dgstp = new Torus(100, 5, dst);
  pmk = new Torus(40, 80, p);
  cshn = new Torus(40, 40, csn);
  apl = new Torus(20, 60, ap);
  wtm = new Torus(10, 70, wt);
  rbsl = new Torus(70, 40);



  cn = loadImage("can.jpeg");
  cnb = loadImage("canbottom.jpeg");
  cnt = loadImage("cantop.jpeg");
  stn = loadImage("stone.jpeg");
  bt = loadImage("battery.jpeg");
  btb = loadImage("batterybottom.jpeg");
  btt = loadImage("batterytop.jpeg");
  tss = loadImage("tissue.jpeg");
  tsst = loadImage("tissuetop.jpeg");

  tcn = new Cylinders(40, 100, cn, cnb, cnt);
  stne = new Cylinders(50, 30, 95, stn, stn);
  btty = new Cylinders(20, 140, bt, btb, btt);
  tssu = new Cylinders(60, 20, 150, tss, tsst);
  
  
  
  mf = loadImage("stairsmetalfront.jpeg");
  mt = loadImage("stairsmetaltop.jpeg");
  stf = loadImage("stairsstonefront.jpeg");
  stt = loadImage("stairsstonetop.jpeg");
  mbf = loadImage("stairsmarblefront.jpeg");
  mbt = loadImage("stairsmarbletop.jpeg");
  wdf = loadImage("stairswoodfront.jpeg");
  wdt = loadImage("stairswoodtop.jpeg");
  
  mtlS = new Stairs(mf, mt);
  stneS = new Stairs(stf, stt);
  mrblS = new Stairs(mbf, mbt);
  wdnS = new Stairs(wdf, wdt);
}

void draw() {
  background(10);

  rotating();
  if (shapeState == 1) {
    if (shapeIndex == 0) wht.createCube();
    else if (shapeIndex == 1) blk.createCube();
    else if (shapeIndex == 2) rbks.createCube();
    else if (shapeIndex == 3) crt.createCube();
  } 
  
  else if (shapeState == 2) {
    if (shapeIndex == 0) bch.createSphere();
    else if (shapeIndex == 1) ten.createSphere();
    else if (shapeIndex == 2) soc.createSphere();
    else if (shapeIndex == 3) glb.createSphere();
    else if (shapeIndex == 4) bb.createSphere();
  } 
  
  else if (shapeState == 3) {
    if (shapeIndex == 0) dnt.createTorus();
    else if (shapeIndex == 1) spr.createTorus();
    else if (shapeIndex == 2) stp.createTorus();
    else if (shapeIndex == 3) dgstp.createTorus();
    else if (shapeIndex == 4) pmk.createTorus();
    else if (shapeIndex == 5) cshn.createTorus();
    else if (shapeIndex == 6) apl.createTorus();
    else if (shapeIndex == 7) wtm.createTorus();
    else if (shapeIndex == 8) rbsl.createTorus();
  } 
  
  else if (shapeState == 4) {
    if (shapeIndex == 0) tcn.createCylinder();
    else if (shapeIndex == 1) stne.createCylinder();
    else if (shapeIndex == 2) btty.createCylinder();
    else if (shapeIndex == 3) tssu.createCylinder();
  }
  
  else if (shapeState == 5) {
    if (shapeIndex == 0) mtlS.createStairs();
    else if (shapeIndex == 1) stneS.createStairs();
    else if (shapeIndex == 2) mrblS.createStairs();
    else if (shapeIndex == 3) wdnS.createStairs();
  }
}

void rotating() {
  rotateX(angle/1.3);
  rotateY(2 * angle/1.3);

  if (rIndex == 0) angle = -PI/8;
  else angle+= PI/200;
}

void keyPressed() {
  if (key == ' ') {
    if (rIndex == 1) rIndex = 0;
    else rIndex = 1;
  }

  if (key == 'a' || keyCode == LEFT) {
    shapeIndex--;

    if (shapeIndex == -1) shapeIndex = shapeNum - 1;
  }

  if (key == 'd' || keyCode == RIGHT) {
    shapeIndex++;

    if (shapeIndex == shapeNum) shapeIndex = 0;
  }


  if (key == '1') {
    shapeState = 1;
    shapeNum = 4;
  }
  if (key == '2') {
    shapeState = 2;
    shapeNum = 5;
  }
  if (key == '3') {
    shapeState = 3;
    shapeNum = 9;
  }
  if (key == '4') {
    shapeState = 4;
    shapeNum = 4;
  }
  if (key == '5') {
    shapeState = 5;
    rIndex = 0;
    shapeNum = 4;
  }
}
