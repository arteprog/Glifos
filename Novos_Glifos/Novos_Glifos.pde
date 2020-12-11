/*
Código originalmente desenvlvido Na Noite de Processing 
de 26/02/2019, Code Jam: glifos e scripts gerativos.
Aprimorado e comentado para o DiaTipoX em 11/12/2020.
*/
import processing.pdf.*;


PVector[][] alfabeto;

//proporção aurea
float phi = 1.6180339887498948482;

int w, h;
float mx, my;

float entrelinha = 1.5;

void setup(){
  size( 800, 500 );
  
  //altura do caractere (pixels)
  h = 30;
  //largura
  w = round( h / phi );
  //margem x do texto
  mx = (width-(40*w))*0.5;
  //margem y
  my = (height-(10*(1.5*h)))*0.5;
  
  
  criar_alfabeto();
  noLoop();
}

void draw(){
  background(255);
  
  noFill();
  stroke(#0A71A2);
  strokeWeight(2);
  
  for( int y = 0; y < 10; ++y ){
    for( int x = 0; x < 40; ++x ){
      int n = round( random( -6.499, alfabeto.length-0.501 ) );
      if( n >= 0 ){
        translate(mx + x*w, my + y*(entrelinha * h));
        beginShape();
        vertex( alfabeto[n][0].x, alfabeto[n][0].y );
        for( int i = 1; i < alfabeto[0].length; i += 2 ){
          quadraticVertex( alfabeto[n][i].x, alfabeto[n][i].y, alfabeto[n][i+1].x, alfabeto[n][i+1].y );
        }
        endShape();
        resetMatrix();
      }
    }
  }
}

void keyReleased(){
  //Aperte espaço para escrever um novo texto
  if( key == ' ' ) redraw();
  
  //Aperte P para salvar a imagem em png.
  else if( key == 'p' || key == 'P' ) save("glifos "+year()+"-"+month()+"-"+day()+" "+hour()+"."+minute()+"."+second()+".jpg");
  
  //Aperte R para re-criar o alfabeto. 
  else if( key == 'r' || key == 'R' ){
    criar_alfabeto();
    redraw();
  }
  
  //Aperte A para salvar o alfabeto em pdf
  else if( key == 'a' || key == 'A' ){
    String title = "Alfabeto "+year()+"-"+month()+"-"+day()+"  "+hour()+"."+minute()+"."+second();
    beginRecord(PDF, title+".pdf");
    
    for( int n = 0; n < alfabeto.length; ++n ){
      translate(mx + n*w, my );
      beginShape();
      vertex( alfabeto[n][0].x, alfabeto[n][0].y );
      for( int i = 1; i < alfabeto[0].length; i += 2 ){
        quadraticVertex( alfabeto[n][i].x, alfabeto[n][i].y, alfabeto[n][i+1].x, alfabeto[n][i+1].y );
      }
      endShape();
      resetMatrix();
    }
    
    endRecord();
  }
}

void criar_alfabeto(){
  //numero de caracteres no alfabeto
  int A = round( random( 10, 40 ) );
  //comprimento de cada caractere em vertices.
  int C = (2*floor(random(1,4)))+1;
  //numero vertical do grid
  float nv = 7;
  //horizontal do grid
  float nh = 3;
  
  float sv = h / nv;
  float sh = w / nh;
  alfabeto = new PVector[ A ][ C ];
  for( int n = 0; n < alfabeto.length; ++n ){
    boolean vert = (random(2)>1)? true : false;
    alfabeto[n][0] = new PVector( 0, sv*floor(random(0, nv)) );
    for( int i = 1; i < alfabeto[0].length; ++i ){
      if( vert ){
        float nx = alfabeto[n][i-1].x;
        while( nx == alfabeto[n][i-1].x ) nx = sh*floor(random(0, nh));
        alfabeto[n][i] = new PVector( nx, alfabeto[n][i-1].y );
      }
      else{
        float ny = alfabeto[n][i-1].y;
        while( ny == alfabeto[n][i-1].y ) ny = sv*floor(random(0, nv));
        alfabeto[n][i] = new PVector( alfabeto[n][i-1].x, ny );
      }
      vert = !vert;
    }
  }
}


//textAlign(CENTER, CENTER);
//for( int i = 0; i < L.length; ++i ){
//  fill(255);
//  ellipse( L[i].x, L[i].y, 20, 20 );
//  fill(0);
//  text(str(i), L[i].x, L[i].y );
//}
