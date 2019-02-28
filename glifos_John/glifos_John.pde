PVector[][] alphabet;
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
  alphabet = new PVector[30][9];
  for( int n = 0; n < alphabet.length; ++n ){
    boolean vert = (random(2)>1)? true : false;
    alphabet[n][0] = new PVector( 0, sv*round(random(div[2*q], div[(2*q)+1])) );
    for( int i = 1; i < alphabet[0].length; ++i ){
      if( vert ){
        alphabet[n][i] = new PVector( sh*round(random(-0.499, 6.499)), alphabet[n][i-1].y );
      }
      else{
        alphabet[n][i] = new PVector( alphabet[n][i-1].x, sv*round(random(-0.499, 10.499)) );
      }
      vert = !vert;
    }
  }
  
  noLoop();
}

void draw(){
  background(255);
  
  noFill();
  stroke(#0A71A2);
  strokeWeight(2);
  
  for( int y = 0; y < 10; ++y ){
    for( int x = 0; x < 40; ++x ){
      int n = round( random( -6.499, 29.499 ) );
      if( n >= 0 ){
        translate(mx + x*w, my + y*(1.5*h));
        beginShape();
        vertex( alphabet[n][0].x, alphabet[n][0].y );
        for( int i = 1; i < alphabet[0].length; i += 2 ){
          quadraticVertex( alphabet[n][i].x, alphabet[n][i].y, alphabet[n][i+1].x, alphabet[n][i+1].y );
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



//textAlign(CENTER, CENTER);
//for( int i = 0; i < L.length; ++i ){
//  fill(255);
//  ellipse( L[i].x, L[i].y, 20, 20 );
//  fill(0);
//  text(str(i), L[i].x, L[i].y );
//}
