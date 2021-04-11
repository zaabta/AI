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
}
