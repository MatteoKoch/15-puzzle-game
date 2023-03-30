Grid grid;
boolean touched = false;
boolean set = false;
int w = 800;
int h = 800;
int[] score;
float sc = 0;
float fc = 0;


void setup() {
  size(800,1000);
  score = new int[3];
  score[0] = 0;
  score[1] = 0;
  score[2] = 0;
}

void draw() {
  sc = frameCount/frameRate;
  background(0);
  if(touched) {
    sc = (frameCount-fc)/frameRate;
    grid.show();
    grid.checkWin();
    if(!grid.won) {
      score[2] = floor((sc - floor(sc))*1000);
      score[1] = int(sc % 60);
      score[0] = int(sc/60);
    } else {
      noLoop();
    }
  } else {
    fc=frameCount;
    strokeWeight(2);
    stroke(0);
    textSize(50);
    fill(255);
    rect(0, 0, w/2, h/2);
    fill(0);
    text("3", w/4, h/4);
    fill(255);
    rect(w/2, 0, w/2, h/2);
    fill(0);
    text("4", 3*w/4, h/4);
    fill(255);
    rect(0, h/2, w/2, h/2);
    fill(0);
    text("5", w/4, 3*h/4);
    fill(255);
    rect(w/2, h/2, w/2, h/2);
    fill(0);
    text("6", 3*w/4, 3*h/4);
  }
  textSize(100);
  fill(255);
  text(score[0]+":"+score[1]+":"+score[2], 100, height-100);
}

void mousePressed() {
  if(touched) {
    grid.move(mouseX, mouseY);
  } else {
    int num;
    if(mouseX < width/2 && mouseY < height/2) num = 3;
    else if(mouseX > width/2 && mouseY < height/2) num = 4;
    else if(mouseX < width/2 && mouseY > height/2) num = 5;
    else num = 6;
    grid = new Grid(num);
    grid.initGrid();
    grid.scramble();
    touched = true;
  }
}
