/*
    PPaint v1.0
    Developers: Husanboy Qodirov & Hasanboy Qodirov
    softromeda.weebly.com
    
    Written in Processing 4.0b7
    https://processing.org
*/

import processing.sound.*; // first install and then import sound library

int inkSize = 1;
color inkColor = 0;
String cursor_coordinates = "";
boolean eraserEnabled = false;
color back = (255);

SoundFile song, notice;
PImage eraser, clear, tune, play;
  
void setup() {
  size (900, 600);
  background(255);
  cursor(HAND);
  eraser = loadImage("data/eraser.png");
  clear = loadImage("data/clear.png");
  tune = loadImage("data/tune.png");
  play = loadImage("data/play.png");
  song = new SoundFile(this, "data/one-step-closer.wav");
  notice = new SoundFile(this, "data/saved-notice.wav");
  toolBar();
}

void draw() {
  mouseCoordinates();
  strokeWeight(inkSize);
  stroke(inkColor);
  
  // draw
  if(mouseY > 30) {   // prevent drawing on toolbar    
    if (mousePressed) {
      if(eraserEnabled)
        erase();
      else
        line(mouseX, mouseY, pmouseX, pmouseY);
    }
  }
}

void toolBar() {
  strokeWeight(1);
  // toolbar frame
  stroke(0);
  fill(255);
  rect(-1, -1, width+1, 30);
  
  textSize(15);
  fill(80);
  text("Pencil Color", 10, 22);
  
  // buttons for ink color
  //red
  fill(255, 0, 0);
  square(105, 5, 20);
  //green
  fill(0, 255, 0) ;
  square(130, 5, 20);
  //blue
  fill (0,0,255) ;
  square(155, 5, 20);
  //yellow
  fill(255, 255, 0);
  square(180, 5, 20);
  //white
  fill (255) ;
  square(205, 5, 20);
  //black
  fill (0) ;
  square(230, 5, 20);
  
  textSize(15);
  fill(80);
  text("Ink Size", 265, 22);
  
  // ink size buttons
  // thin
  fill(230);
  square(330, 5, 20);
  fill(0);
  circle(340, 15, 6);
  // normal
  fill(230);
  square(355, 5, 20);
  fill(0);
  circle(365, 15, 8);
  // thick
  fill(230);
  square(380, 5, 20);
  fill(0);
  circle(390, 15, 10);
  
  textSize(15);
  fill(80);
  text("Background", 413, 22);
  
  // buttons for adjusting background
  // white
  fill(255);
  square(505, 5, 20);
  // black
  fill(0);
  square(530, 5, 20);
  // blue
  fill(#2986cc);
  square(555, 5, 20);
  // grid
  noFill();
  square(580, 5, 20);
  for(int i = 5; i <= 15; i+=5) {
    line(580, 6+i, 600, 6+i);
    line(581+i, 5, 581+i, 25);
  }
  // lined
  square(605, 5, 20);
  for(int i = 5; i <= 15; i+=5) {
    line(605, 5+i, 625, 5+i);
  }
  
  imageMode(CENTER);
  // button to clear sheet
  image(clear, 650, 15, 21, 21);
  // button to erase part of a drawing
  image(eraser, 675, 15, 21, 21);
  // music icon
  image(tune, 700, 15, 21, 21);
  // start tune
  image(play, 725, 15, 21, 21);
  
  // stop tune
  fill(240);
  square(740, 5, 20);
  textSize(15);
  fill(0);
  square(745, 10, 10);
  
  // text button to save drawing
  textSize(15);
  fill(80);
  text("Save Drawing", 785, 22);
}

// onClick events, interactons
void mousePressed() {
  // disable eraser when inkColor, inkSize and sheet style are selected 
  if((mouseX > 105 & mouseX < 660) & (mouseY > 5 & mouseY < 25))
    eraserEnabled = false;
  // select pencil color
  if((mouseX > 105 & mouseX < 125) & (mouseY > 5 & mouseY < 25))
    inkColor = color(255, 0, 0);
  if((mouseX > 130 & mouseX < 150) & (mouseY > 5 & mouseY < 25))
    inkColor = color(0, 255, 0);
  if((mouseX > 155 & mouseX < 175) & (mouseY > 5 & mouseY < 25))
    inkColor = color(0, 0, 255);
  if((mouseX > 180 & mouseX < 200) & (mouseY > 5 & mouseY < 25))
    inkColor = color(255, 255, 0);
  if((mouseX > 205 & mouseX < 225) & (mouseY > 5 & mouseY < 25))
    inkColor = color(255);
  if((mouseX > 230 & mouseX < 250) & (mouseY > 5 & mouseY < 25))
    inkColor = color(0);
  
  // select ink size
  if((mouseX > 330 & mouseX < 350) & (mouseY > 5 & mouseY < 25))
    inkSize = 1;
  if((mouseX > 355 & mouseX < 375) & (mouseY > 5 & mouseY < 25))
    inkSize = 3;
  if((mouseX > 380 & mouseX < 400) & (mouseY > 5 & mouseY < 25))
    inkSize = 5;
   
  // select sheet style
  if((mouseX > 505 & mouseX < 525) & (mouseY > 5 & mouseY < 25)) {
    clearBackground();
  }
  if((mouseX > 530 & mouseX < 550) & (mouseY > 5 & mouseY < 25)) {
    background(0);
    toolBar();
    back = (0);
  }
  if((mouseX > 555 & mouseX < 575) & (mouseY > 5 & mouseY < 25)) {
    background(#2986cc);
    toolBar();
    back = (#2986cc);
  }
  // square grid format
  if((mouseX > 580 & mouseX < 600) & (mouseY > 5 & mouseY < 25)) {
    background(255);
    strokeWeight(1);
    stroke(0);
    for(int i = 0; i <= width; i+=10) {
      line(0+i, 0, 0+i, height);
      line(0, 0+i, width, 0+i);
    }
    toolBar();
    back = (255);
  }
  // lined format
  if((mouseX > 605 & mouseX < 625) & (mouseY > 5 & mouseY < 25)) {
    background(255);
    strokeWeight(1);
    stroke(0);
    for(int i = 0; i <= width; i+=20) {
      line(0, 30+i, width, 30+i);
    }
    toolBar();
    back = (255);
  }
  
  // clear sheet
  if((mouseX > 638 & mouseX < 660) & (mouseY > 5 & mouseY < 25)) {
    clearBackground();
  }
  
  // enable eraser
  if((mouseX > 670 & mouseX < 690) & (mouseY > 5 & mouseY < 25)) {
    eraserEnabled = true;
  }
  
  // music control
  if((mouseX > 714 & mouseX < 735) & (mouseY > 5 & mouseY < 25))
    song.play();
  if((mouseX > 740 & mouseX < 760) & (mouseY > 5 & mouseY < 25))
    song.stop();
  
  // save drawing as .png file
  if((mouseX > 785 & mouseX < 885) & (mouseY > 5 & mouseY < 25))
    saveDrawing();
}

// keyboard shortcuts
void keyPressed() {
    if (key == 'c') {
      clearBackground();
    }
    if (key == 's') {
      saveDrawing();
    }
}

void clearBackground() {
  background(255);
  toolBar();
  back = (255);
}

void saveDrawing() {
  saveFrame("drawings/drawing####.png");
  notice.play();
}

// show mouse cursor coordinates
void mouseCoordinates() {
  noStroke();
  fill(255);
  rect(800, 580, 85, 14);
  textSize(13);
  fill(80);
  cursor_coordinates = "x: " + mouseX + " y: " + mouseY;
  text(cursor_coordinates, 800, 591);
}

// eraser
void erase() {
  noStroke();
  fill(back);
  circle(mouseX, mouseY, 20);
}
