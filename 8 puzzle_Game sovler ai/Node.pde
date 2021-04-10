class Node implements Comparable<Node>{
  Node parent;
  Puzzle puzzle;
  int x, y;
  int cost;
  int level;
  Node(int[][] grid, int x, int y, int newX, int newY, int level, Node parent){
    this.parent = parent;
    this.puzzle = new Puzzle(grid);
    this.puzzle.swap(x, y, newX, newY);
    this.cost = Integer.MAX_VALUE;
    this.level = level;
    this.x = newX;
    this.y = newY;
  }
  
  // compareTo method to sort in
  // ascending order
  @Override
  public int compareTo(Node obj){
    if(this.cost > obj.cost)
      return 1;
    else if(this.cost == obj.cost)
      return 0;
     else
     return -1;
  }
  
 void calculateCost(int goal[][]){
    int count = 0;
    for (int i = 0; i < this.puzzle.grid.length; i++)
      for (int j = 0; j < this.puzzle.grid[i].length; j++)
        if (this.puzzle.grid[i][j] > 0 && this.puzzle.grid[i][j] != goal[i][j])
           count++;
    this.cost = count;
  }
  
  
}
