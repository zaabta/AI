

class Spot{
  private int x, y;
  private float f, g, h;
  private List<Spot> neighbors;
  private Spot previous = null;
  private boolean isWall = false; 
  
  public Spot(int i, int j){
    this.x = i;
    this.y = j;
    if(random(1) < 0.3)
      this.isWall = true;
    neighbors = new ArrayList<Spot>();
  }
  
  public void show(color col){
    fill(col);
    stroke(0);
    rect(this.x * W, this.y * H, W-1, H-1);
  }
  
  public void addNeighbors(Spot[][] grid){
    int i = this.x;
    int j = this.y;
    
    if(i < rows - 1)
      this.neighbors.add(grid[i + 1][j]);
    if(i > 0)  
      this.neighbors.add(grid[i - 1][j]);
    if(j < cols - 1)  
      this.neighbors.add(grid[i][j + 1]);
    if(j > 0) 
      this.neighbors.add(grid[i][j - 1]);
  }
  
  public List<Spot> getNeighbors(){
    return this.neighbors;
  }
}
