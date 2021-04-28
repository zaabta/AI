
Ball[] balls;
final int count = 15; 

void setup(){
  size(600, 600);
  balls = new Ball[count];
  for(int i = 0; i < count; i++){
    balls[i] = new Ball();
  }
}

void draw(){
  background(0);
  for(int i = 0; i < count; i++){
    balls[i].dispaly();
    balls[i].update();
    balls[i].collision(balls);
  }
}
