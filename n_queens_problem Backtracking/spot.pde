class Spot{
  private int i, j;
  private color col;
  boolean queen;
  Spot(int i, int j, color col){
    this.i = i;
    this.j = j;
    this.col = col;
    queen = false;
  }
  
  void display(){
    float x = (w * i) + w / 3;
    float y = (h * j) + h / 3;
    fill(col);
    stroke(0);
    rect((this.i * w), (this.j * h), w, h);
    if(this.isQueen())
      image(Queen, x, y, w/2, h/2);
  }
  
  void setQueen(){
    this.queen = (this.isQueen()) ?  false :  true;
  }
  
  boolean isQueen(){
    return this.queen;
  }
  
}
