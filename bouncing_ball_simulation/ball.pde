class Ball{
  private PVector pos;
  private PVector vel;
  private PVector acc;
  private int radius;
  private int maxSpeed = 8;
  private color col;
  
  public Ball(float x, float y){
    this.radius = floor(random(5, 20));
    this.pos = new PVector (x, y);
    this.vel = PVector.random2D();
    this.acc = new PVector (0, 0);
    this.col = color(random(255),random(255),random(255));
  }
  
  public Ball(){
    this.radius = floor(random(8, 20));
    this.pos = new PVector(random(this.radius, width - this.radius), random(this.radius, height - this.radius));
    this.vel = PVector.random2D();
    this.acc = new PVector(0, 0);
    this.col = color(random(255),random(255),random(255));
  }
  
  public void dispaly(){
    fill(this.col);
    noStroke();
    ellipse(this.pos.x, this.pos.y, this.radius, this.radius);
  }
  
  public void update() {
    this.vel.add(this.acc);
    this.vel.limit(this.maxSpeed);
    this.pos.add(this.vel);
    this.acc.mult(0);
    
    if(this.pos.y + this.vel.y - this.radius <= 0 || this.pos.y + this.vel.y + this.radius >= height){
       this.vel.y *= -1;
    }
    
    if(this.pos.x + this.vel.x - this.radius <= 0 || this.pos.x + this.vel.x + this.radius >= width){
       this.vel.x *= -1;
    }
  }
  
  
  public void collision(Ball[] balls){
    for(int i = 0; i < balls.length; i++){
      float d = dist(this.pos.x, this.pos.y, balls[i].pos.x, balls[i].pos.y);
      if(d <= this.radius && d > 0.0){
        // Swap the velocity
        PVector temp = this.vel;
        this.vel = balls[i].vel;
        balls[i].vel = temp;
      }
    }
  }
  
}
