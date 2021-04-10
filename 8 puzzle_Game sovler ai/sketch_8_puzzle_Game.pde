import java.util.*;

int w, h;
Puzzle puzzle;
int [][] goal;
PriorityQueue<Node> pQueue;
Node root;
List<Node> path;
int i = 0;

// bottom, left, top, right
int row[] = { 1, 0, -1, 0 };
int col[] = { 0, -1, 0, 1 };
 

void setup(){
  frameRate(1);
  size(400, 500);
  puzzle = new Puzzle(new int[][] {{1, 8, 2},
                                    {0, 4, 3},
                                    {7, 6, 5} });
  w = width / puzzle.size;
  h = (height - 100) / puzzle.size;
  //puzzle.shuffle();
  goal = new int[][]{{1, 2, 3},
                     {4, 5, 6},
                     {7, 8, 0}};
  textSize(30);
  textAlign(CENTER, CENTER);
  //println(puzzle.getEmptyPiece()[0], puzzle.getEmptyPiece()[1],puzzle.grid[puzzle.getEmptyPiece()[0]][puzzle.getEmptyPiece()[1]]);
  root = new Node(puzzle.grid, puzzle.getEmptyPiece()[0], puzzle.getEmptyPiece()[1], puzzle.getEmptyPiece()[0], puzzle.getEmptyPiece()[1], 0, null);
  root.calculateCost(goal);
  pQueue = new PriorityQueue<Node>();
  pQueue.add(root);
}

void draw(){
  background(255);
  puzzle.show();
  if(puzzle.isWin(goal)){
    println("It is completed");
    noLoop();
  }
  fill(0);
  text("Moves : "+ puzzle.getMoves(), width /2, height - 50);
  if(path == null){
    if(puzzle.isSolvable() && puzzle.getMoves() == 0 || puzzle.getMoves() != 0){
      println("It is Solvable");
      while(!(pQueue.isEmpty())) {
        Node min = pQueue.poll();
        if(min.cost == 0){
          println("done !");
          path = new ArrayList<Node>();
          Node temp = min;
          while(temp != null){ // path
          path.add(temp);
          temp = temp.parent;
        }
        i = path.size();
        return;
      }
    // println(min.x+", "+min.y+" => "+min.puzzle.grid[min.x][min.y]);
      for(int i = 0; i < 4; i++){
         if(min.puzzle.isSafe(min.x + row[i], min.y + col[i])){
            Node child = new Node(min.puzzle.getMatrix(), min.x, min.y, min.x + row[i], min.y + col[i], min.level + 1, min);
            child.calculateCost(goal);
            pQueue.add(child);
          }
        }
    }
  }else{
    println("It is not Solvable");
    noLoop();
    }
  }else{
    i -= 1;
    if(i >= 0)
    puzzle.grid = path.get(i).puzzle.getMatrix();
    puzzle.moves += 1;
  }
}


void mousePressed() { // when mouse pressed
  if (mouseX < width - 10 && mouseX > 0 && mouseY < height - 110 && mouseY > 0) { // To check the mouse pressed in the board puzzle 
    puzzle.slide(mouseX, mouseY);
  }
}
