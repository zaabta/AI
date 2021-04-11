class Spot{
  private int i, j;
  private color col;
  boolean queen;
  Spot(int i, int j, color col){
    this.i = i;
    this.j = j;
    this.col = col;
  }
  
  void display(){
    float x = w * i + w / 2;
    float y = h * j + h / 2;
    fill(col);
    stroke(0);
    image(Queen, x, y, 5, 5);
    rect((this.i * w), (this.j * h), w-1, h-1);
  }
  
  void setQueen(boolean isQueen){
    this.queen = isQueen;
  }
  
  boolean isQueen(){
    return this.queen;
  }
  
}
