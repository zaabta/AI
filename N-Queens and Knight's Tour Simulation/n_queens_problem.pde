

Board board;
int w, h;
int size;
PImage img;
img = loadImage("laDefense.jpg");

void setup(){
  size(400, 400);
  size = 4;
  board = new Board(size);
  w = width / size;
  h = height / size;
}

void draw(){
  background(255);
  board.display();
}
