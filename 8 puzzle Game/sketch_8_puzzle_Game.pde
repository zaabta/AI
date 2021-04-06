
int w, h;
Puzzle puzzle;
int [][] goal;

void setup(){
  frameRate(10);
  size(400, 500);
  puzzle = new Puzzle();
  w = width / puzzle.size;
  h = (height - 100) / puzzle.size;
  puzzle.shuffle();
  goal = new int[][]{{1, 2, 3},
                     {4, 5, 6},
                     {7, 8, 0}};
  textSize(30);
  textAlign(CENTER, CENTER);
  
  puzzle.printMatrix();
}

void draw(){
  background(255);
  puzzle.show();
  if(puzzle.isWin(goal)){
    noLoop();
  text("completed it : ", width /2, height - 50);
  }
  fill(0);
  text("Moves : "+ puzzle.getMoves(), width /2, height - 50);
}

void mousePressed() { // when mouse pressed
  if (mouseX < width - 10 && mouseX > 0 && mouseY < height - 110 && mouseY > 0) { // To check the mouse pressed in the board puzzle 
    puzzle.slide(mouseX, mouseY);
  }
}
