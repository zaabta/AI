import java.util.*; 

class Puzzle{
  private int [][] grid;
  private int size;
  private int moves = 0;
   public Puzzle(){
     this.size = 3;
     this.grid = new int [this.size][this.size];
     int num = 0;
     for(int i = 0; i < grid.length; i++){
      for(int j = 0; j < grid[i].length; j++){
        num += 1;
        if(num == 9)
          this.grid[i][j] = 0;
        else 
          this.grid[i][j] = num;
      }
     }
   }
   public Puzzle(int[][] matrix){
     this.size = 3;
     this.grid = new int [this.size][this.size];
     for(int i = 0; i < this.grid.length; i++){
      for(int j = 0; j < this.grid[i].length; j++){
        int val = matrix[i][j];
        this.grid[i][j] = val;
      }
     }
   }
   
  public void show(){
    fill(155);
    strokeWeight(2);
    stroke(0);
    rect(5,  5, width - 10, (height - 100) - 10); // board;
     for(int i = 0; i < grid.length; i++){
      for(int j = 0; j < grid[i].length; j++){
        float x = w * i + w / 2;
        float y = h * j + h / 2;
        if(grid[j][i] != 0){
          fill(255);
          strokeWeight(1);
          stroke(0);
          rect((i * w)+20, (j * h)+20, w-30, h-30);
          fill(0);
          text(grid[j][i], x+5, y+5);
        }else{
          fill(155);
          noStroke();
          rect((i * w)+20, (j * h)+20, w-30, h-30);
        }
       }
     }
   }
  private void swap(int i, int j, int r, int c){
    int temp = this.grid[i][j];
    int val = this.grid[r][c];
    this.grid[i][j] = val;
    this.grid[r][c] = temp;
  }
  
  private int[][] getMatrix(){
    int[][] copy = new int[this.size][this.size];
    for(int i = 0; i < this.grid.length; i++){
      for(int j = 0; j < this.grid[i].length; j++){
        int val = this.grid[i][j];
        copy[i][j] = val;
      }
    }
    return copy;
  }
  
  public boolean equals(Object o){
      if(this != o)
        return false;
     Puzzle puzzle = (Puzzle) o;
     for(int i = 0; i < this.grid.length; i++){
      for(int j = 0; j < this.grid[i].length; j++){
        if(this.grid[i][j] != puzzle.grid[i][j])
           return false;
       }
     }
     return true;
   }
    
  public void printMatrix(){
    for(int j = 0; j < this.grid[0].length; j++){
       print(Arrays.toString(this.grid[j]));   
       println();
    }
    println();
  }
  
 void shuffle(){ // TO Shuffle the puzzle
   for(int i = 0; i < 1000; i++)
    this.slide(random(width - 10), random(height - 110));
    moves = 0;
   }
   
  boolean isWin(int[][] goal){
    for(int i = 0; i < this.size;i++){
      for(int j = 0; j < this.size; j++){
        if(this.grid[i][j] != goal[i][j])
          return false;
      }
    }
    return true;
  }  
 // move the Piece of puzzle if the neighbour are empty
 void slide(float x, float y) { 
  int mx = floor(y / w);
  int my = floor(x / h);
  List<Integer> neighbours = new ArrayList<Integer>();
  if (mx == 0) {
    neighbours.add(this.isSafe(mx + 1, my) ? this.grid[mx + 1][my] : null);
    neighbours.add(this.isSafe(mx, my + 1) ? this.grid[mx][my + 1]: null);
    neighbours.add(this.isSafe(mx, my - 1) ? this.grid[mx][my - 1]: null);
  }else if (mx == this.grid.length - 1) {
    neighbours.add(this.isSafe(mx - 1, my) ? this.grid[mx - 1][my] : null);
    neighbours.add(this.isSafe(mx, my + 1) ? this.grid[mx][my + 1] : null);
    neighbours.add(this.isSafe(mx, my - 1) ? this.grid[mx][my - 1] : null);
  }else{
    neighbours.add(this.isSafe(mx + 1, my) ? this.grid[mx + 1][my] : null);
    neighbours.add(this.isSafe(mx - 1, my) ? this.grid[mx - 1][my] : null);
    neighbours.add(this.isSafe(mx, my + 1) ? this.grid[mx][my + 1] : null);
    neighbours.add(this.isSafe(mx, my - 1) ? this.grid[mx][my - 1] : null);
  }
  for (int i = 0; i < neighbours.size(); i++) {
    if (neighbours.get(i) != null && neighbours.get(i) == 0) {
      int temp =this. grid[mx][my];
      if (mx != this.size - 1) {
        if (neighbours.get(i) == this.grid[mx + 1][my]) {
          this.swap(mx, my, mx + 1, my);
          this.moves += 1;
        }
      }
      if (mx != 0) {
        if (neighbours.get(i) == this.grid[mx - 1][my]) {
          this.swap(mx, my, mx - 1, my);
          this.moves += 1;
        }
      }
      if(my != this.size - 1) {
        if (neighbours.get(i) == this.grid[mx][my + 1]) {
          this.swap(mx, my, mx, my + 1);
          this.moves += 1;
        }
      }
      if(my != 0){
         if (neighbours.get(i) == this.grid[mx][my - 1]) {
           this.swap(mx, my, mx, my - 1);
           this.moves += 1;
        }
      }
    }
  }
}
 // Function to check if (x, y) is a valid matrix cordinate
 private boolean isSafe(int x, int y){
    return (x >= 0 && x < 3 && y >= 0 && y < 3);
  }
  
  private int getInvCount(int[][] arr){
    int inv_count = 0;
    for (int i = 0; i < arr.length - 1; i++)
        for (int j = i + 1; j < arr[i].length; j++)
            // Value 0 is used for empty space
            if (arr[j][i] > 0 && arr[j][i] > arr[i][j])
                inv_count++;
    return inv_count;
  }
 
  // This function returns true
  // if given 8 puzzle is solvable.
 public boolean isSolvable(){
    // Count inversions in given 8 puzzle
    int invCount = this.getInvCount(this.grid);
 
    // return true if inversion count is even.
    return (invCount % 2 == 0);
  }
  
  public int[] getEmptyPiece(){
    int[] emptyPiece = new int[2];
    for(int i = 0; i < this.grid.length; i++)
      for(int j = 0; j < this.grid[i].length; j++)
        if(this.grid[i][j] == 0){
          emptyPiece[0] = i;
          emptyPiece[1] = j;
        }
      return emptyPiece;
  }
  
  public int getMoves(){
    return this.moves;
  }
  
}
