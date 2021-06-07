

class City{
   private int x, y;
   
   public int getX() {
     return this.x;
      }
      
   public int getY() {
     return this.y;
   }
   
   
   public City() {
        this.x = 10 + (int) (Math.random() * width-15);
        this.y = 10 + (int) (Math.random() * height-15);
    }
    
    
   public City(boolean isSeeded) {
     if (!isSeeded) {
            this.x = 10 + (int) (Math.random() * width-15);
            this.y = 10 + (int) (Math.random() * height-15);
        } else {
            this.x = 10 + rnd.nextInt(width-15);
            this.y = 10 + rnd.nextInt(height-15);
        }
    }
    
    public City(int x, int y) {
      this.x = x;
      this.y = y;
    }
    
    public double distanceToCity(City city) {
      return dist(this.getX(), this.getY(), city.getX(), city.getY());
    }
    
    public void display(color col){
      fill(col);
      circle(this.x, this.y, 10);
    }
}
