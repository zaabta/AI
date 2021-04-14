class Board{
  Spot[][] grid;
  int size;
  Board(int size){
    this.size = size;
    this.grid = new Spot[this.size][this.size];
    for(int i = 0; i < this.grid.length; i++){
      for(int j = 0; j < this.grid[i].length; j++){
        if(i % 2 == 0){
          this.grid[i][j] = new Spot(i, j, j % 2 == 0 ? color(255): color(155));
        }else{
          this.grid[i][j] = new Spot(i, j, j % 2 != 0 ? color(255): color(155));
        }
      }
    }
  }
  
  void display(){
     for(int i = 0; i < this.grid.length; i++){
      for(int j = 0; j < this.grid[i].length; j++){
        this.grid[i][j].display();
      }
    }
  }
  
  boolean isSolved(){
    for(int i = 0; i < this.grid[0].length; i++){
      int queenCount = 0;
      for(int j = 0; j < this.grid.length; j++){
        if(this.grid[i][j].isQueen())
          queenCount +=1;
      }
      if(queenCount != 1) return false;
    }
    return true;
  }
  
  void setQueen(int x, int y){
    if(!this.grid[x][y].isQueen()){
      if(this.isSafe(x, y)) this.grid[x][y].setQueen();
    }else
      this.grid[x][y].setQueen();
  }
  
  int countOfQueen(){
    int queenCount = 0;
    for(int i = 0; i < this.grid[0].length; i++){
      for(int j = 0; j < this.grid.length; j++){
        if(this.grid[i][j].isQueen())
          queenCount +=1;
      }
    }
    return queenCount;
  }
  
  private boolean isSafe(int row, int col){
    
       for (int i = 0; i < this.size; i++)
            if (this.grid[i][col].isQueen())
                return false; 
                
      for (int i = 0; i < this.size; i++)
            if (this.grid[row][i].isQueen())
                return false; 
                
        /* Check upper diagonal on left side */
        for (int i = row, j = col; i >= 0 && j >= 0; i--, j--)
            if (this.grid[i][j].isQueen())
                return false;
                
        /* Check lower diagonal on left side */
        for (int i = row, j = col; j >= 0 && i < this.size; i++, j--)
            if (this.grid[i][j].isQueen())
                return false;
                
        /* Check lower diagonal on left side */
        for (int i = row, j = col; j < this.size && i < this.size; i++, j++)
            if (this.grid[i][j].isQueen())
                return false;
      
        
        for (int i = row, j = col; j < this.size && i >= 0; i--, j++)
            if (this.grid[i][j].isQueen())
                return false;
  
        return true;
    }
}
