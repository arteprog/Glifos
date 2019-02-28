int nx = 20;
int ny = 30;

int x;
int y;

void setup() {
  size(500, 700);
  background(255);

  ellipseMode(CENTER);
  x = 0;
  y = 0;
}



void draw() {
  if (random(1)<.5) drawLetter(x, y, width/nx, height/ny);
  x += width/nx;
  if (x>width) {
    y+= height/ny;
    if (y>height) {
      background(255);
      y = 0;
    }
    y = (y>height?0:y);
    x = 0;
  }
}
void drawLetter(int x, int y, int w, int h) {
  PVector[] L = new PVector[3];
  PVector[] C1 = new PVector[2];
  PVector[] C2 = new PVector[2];
  L[0] = new PVector(x, y+h/2);
  stroke(255, 0, 0);
  //ellipse(L[0].x,L[0].y,10,10);
  for (int i=1; i < L.length-1; ++i) {
    L[i] = new PVector(random(L[i-1].x, x+w), y+h/2);
    //ellipse(L[i].x,L[i].y,10,10);
  }
  L[L.length-1] = new PVector(x+w, y+h/2);
  //ellipse(L[L.length-1].x,L[L.length-1].y,10,10);

  stroke(0, 255, 0);
  for (int i=0; i < C1.length; ++i) {
    C1[i] = new PVector(random(x, x+w), map(randomGaussian(), -1, 1, y, y+h));
    C2[i] = new PVector(random(x, x+w), map(randomGaussian(), -1, 1, y, y+h));
    //ellipse(C2[i].x,C2[i].y,10,10);
  }

  noFill();
  stroke(#000C50);
  strokeWeight(2);
  beginShape();
  vertex(L[0].x, L[0].y);
  for (int i=0; i<C1.length; ++i) {
    bezierVertex(C1[i].x, C1[i].y, C2[i].x, C2[i].y, L[i+1].x, L[i+1].y);
  }
  endShape();
}
