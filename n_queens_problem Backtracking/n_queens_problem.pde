

Board board;
int w, h;
int size;
PImage Queen;

void setup(){
  size(400, 400);
  size = 16;
  board = new Board(size);
  w = width / size;
  h = (height) / size;
  Queen = loadImage("queen.png");
  if (solveNQUtil(board, 0) == false) {
    print("Solution does not exist");
    }
}

void draw(){
  background(255);
  fill(0);
  board.display();
  if(board.isSolved()) {
    noLoop();
    println("Completed it !");
    
    textSize(40);
    textAlign(CENTER, CENTER);
    fill(0);
    text("It is done !", width / 2, height / 2);
  }
}

void mousePressed(){
  if(mouseX < width && mouseY < height  && mouseX > 0 && mouseY > 0){
    int mx = floor(mouseX / w);
    int my = floor(mouseY / h);
    board.setQueen(mx, my);
  }
}
