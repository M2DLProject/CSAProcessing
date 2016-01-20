import gab.opencv.*;
import java.awt.Rectangle;
import processing.video.*;

import processing.opengl.*;


PImage img;
PImage nian;
PImage article;
PImage map;
PImage home;
PImage news;
PImage news1;
PImage mapi;
PImage japon;

PImage right;
PImage left;

int screen = 0;
int menu1 = 1;
int articleNum = 1;
int transition = 0;
int transitionx = 0;
int transitiony = 0;
int zoom = 0;


void setup() {
  
  
  size(800,600);
  img = loadImage("f.jpeg");
  nian = loadImage("NYAN_CAT.gif");
  article =  loadImage("a.png");
  map =  loadImage("m.png");
  home =  loadImage("h.png");
  news =  loadImage("article.jpg");
  news1 =  loadImage("article1.jpg");
  left =  loadImage("left.png");
  right =  loadImage("right.png");
  mapi =  loadImage("map.jpg");
  japon = loadImage("japon4.jpg");

  textSize(32);

  fill(0, 102, 153);

}


void screen0(){
  
if (keyPressed) {
    screen = 1;
  }
  
  image(nian, 0, 0, width/2, height/2 - 100);
  text("Tapez des mains pour essayer.", 150, 300); 
  

}
  


void screen1(){
  
   if (keyPressed) {
  if (keyCode == UP) {
      menu1 = 1;
    } else if (keyCode == DOWN) {
      menu1 = 0;
    } else if (key == ENTER && menu1 == 1) {
      screen = 2;
    } else if (key == ENTER && menu1 == 0) {
      screen = 3;
    }
      
   }
   
   
       tint(255, 255);
     image(nian, 0, 400, width/2, height/2 - 100);
          
          
     if (menu1 ==  0) {
       tint(255, 40);
       text("Promenez vous!", 420, 410); 
     }
     else tint(255, 255);
     image(article,100+20, 170, 200, 200 );     

     if (menu1 ==  1 ){
       tint(255, 16);
       text("Regardez des articles...", 100, 150); 
     }
     else tint(255, 255);
     image(map, 400+20, 170, 200, 200 ); 
    
}

void runTransition(){
 
    transitionx = 0;
      transitiony = 0;
      transition = 1;
  
}

void endTransition(){
 
    transitionx = 0;
      transitiony = 0;
      transition = 0;
  
}
void screen3(){
  
     if (keyPressed && transition == 0) {
    if (key == 'R' || key == 'r') {
      screen = 1;
      
    } else if (key == ENTER) {
      runTransition(); 
    }
   }
   
  if(transition == 1){
    transitionx += 12 ;
    transitiony += 2;
    tint(255, 255-transitionx);
    

  
   
    if (transitionx > 200){
      endTransition();
       if (articleNum == 0){
        articleNum = 1;
      }else{
        articleNum = 0;
      }
    }
   
    
  }
   
   
  if (articleNum == 0){
    image(news, 100+transitionx, 100+transitiony+mouseY-600, (width/1.3)-transitiony*2, (1000+transitiony)-transitiony*2);
  }else{
    image(news1,100+transitionx, 100+transitiony+mouseY-600, (width/1.3)-transitiony*2, (1000+transitiony)-transitiony*2);
  }
 
  
  image(left, 10, height/2-50, 100, 100);
  image(right,width-105, height/2-50, 100, 100);
  
  image(home, 750, 0, 50, 50 ); 
  
}

void screen4(){
  
     if (keyPressed) {
    if (keyCode == UP) {
      screen = 4;
      
    } else if (key == 'R' || key == 'r') {
    screen = 1;
    }
   }
   
   if (mouseX < 100) transitionx = transitionx + 40;
   if (mouseX > width - 100) transitionx = transitionx - 40;
     if (mouseY < 100) transitiony = transitiony + 40;
   if (mouseY > height - 100) transitiony = transitiony - 40;
   
   if (transitionx < -500 ) transitionx =  -500;
    if (transitiony < -200 ) transitiony =  -200;
     if (transitionx > 500 ) transitionx =  500;
      if (transitiony > 200 ) transitiony =  200;
  
    image(mapi, -500+transitionx, -500+transitiony, 2000+zoom, 1500+zoom);

 

  
  image(home, 750, 0, 50, 50 ); 
  
}


void screen5(){
  
       if (keyPressed) {
         if (key == 'R' || key == 'r') {
    screen = 3;
    delay(100);
    }
   }
  
  image(japon, 100, 100, 300, 300 ); 
  text("Sanctuaire Azakuta", 420, 140); 
  
  image(map, 750, 0, 50, 50 ); 
}



void draw() {
 

   tint(255, 255);
  image(img, 0, 0);
  if (screen == 0){
     screen0();
  } else if (screen == 1){
      screen1();
  } else if (screen == 2){
      screen3();
  } else if (screen == 3){
      screen4();
  } else if (screen == 4){
      screen5();
  }

}