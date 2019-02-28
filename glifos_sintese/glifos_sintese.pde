PVector[][] alphabet_L;
PVector[][] alphabet_C1;
PVector[][] alphabet_C2;
int Q = 3;
int q = round(random(-0.499, 2.499) );
float[] div = { 0.501, 3.499, 2.501, 6.499, 5.501, 9.499 };
float phi = 1.6180339887498948482;
int w, h;
float mx, my;
//............................................qQTYzaPf
//............................................4dbsmyss
void setup(){
  size( 800, 500 );
  
  h = 30;
  w = round( h / phi );
  float sv = h / 9.0;
  float sh = w / 6.0;
  mx = (width-(40*w))*0.5;
  my = (height-(10*(1.5*h)))*0.5;
  alphabet_L = new PVector[20][3];
  alphabet_C1 = new PVector[20][2];
  alphabet_C2 = new PVector[20][2];
  for( int n = 0; n < alphabet_L.length; ++n ){
    alphabet_L[n][0] = new PVector(0,h/2);
    for(int i=1;i < alphabet_L[0].length-1; ++i){
     alphabet_L[n][i] = new PVector(random(alphabet_L[n][i-1].x, w), h/2);
    }
    alphabet_L[n][alphabet_L[0].length-1] = new PVector(w,h/2);   
    for(int i=0; i < alphabet_C1[0].length; ++i){
      alphabet_C1[n][i] = new PVector(random(0,w),map(randomGaussian(),-1,1,0,h));
      alphabet_C2[n][i] = new PVector(random(0,w),map(randomGaussian(),-1,1,0,h));
    }
  }
  
  noLoop();
}

void draw(){
  background(255);
  
  noFill();
  stroke(#000C50);
  strokeWeight(2);
  
  for( int y = 0; y < 10; ++y ){
    for( int x = 0; x < 40; ++x ){
      int n = round( random( -6.499, alphabet_L.length -0.501 ) );
      if( n >= 0 ){
        translate(mx + x*w, my + y*(1.5*h));
        beginShape();
        vertex(alphabet_L[n][0].x, alphabet_L[n][0].y);
        for(int i=0; i<alphabet_C1[0].length;++i){
          bezierVertex(alphabet_C1[n][i].x, alphabet_C1[n][i].y, alphabet_C2[n][i].x, alphabet_C2[n][i].y, alphabet_L[n][i+1].x, alphabet_L[n][i+1].y);
        }
        endShape();
        resetMatrix();
      }
    }
  }
}

void keyReleased(){
  redraw();
}
