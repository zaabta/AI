import java.util.*;

float [][] matrix;
float temperature, min, max;
int w, size ,j = -1, cnt;
List<Integer> points; 
int currentpoint;
int nextPoint = -1;

void setup(){
  frameRate(100);
  size(900, 300); // size of canves
  size = 250; // size of probabilities
  matrix = fillRandMatrixTimeSeries(size, 1, -500, 500); // Generate the probabilities as Ranomd time series
  temperature = 100; // Temperature
  w = 20; // width of line in canves
  points = new ArrayList(); // the points of probabilities
  min = min(matrix);
  max = max(matrix);
  
  for(int i = 0; i < matrix.length; i++){
    matrix[i][0] = map(matrix[i][0], min(matrix), max(matrix), 30, height); // reMaping the  probabilities points  Cording to caves size
    points.add(i);
  }
   currentpoint = floor(random(size));
   //points.remove(new Integer(currentpoint));
}

void draw(){
  background(255); // clear the canves 255 ==> white
  strokeWeight(1);
  for(int i = w; i < height; i += w){ // draw The lines 
    stroke(130);
    line(0, i, width, i);
  }
  // draw the probabilities
  beginShape();
  for(int i = 0; i < matrix.length; i++){
      noFill();
      stroke(100);
      strokeWeight(2);
      vertex(map(i, 0, matrix.length-1, 0, width), matrix[i][0]);
  }
  endShape();
  

  if(temperature > 0.00001) temperature *= 0.99;
  else noLoop();
  nextPoint = getNextPoint(currentpoint, points, matrix);
  if(Math.random() < 1/Math.exp(Math.abs(matrix[currentpoint][0] - matrix[nextPoint][0])/temperature)){
    ++cnt;
    currentpoint = nextPoint;
    //points.remove(new Integer(currentpoint));
  }
  
  stroke(255, 0, 0);
  line(map(currentpoint, 0, size-1, 0, width), matrix[currentpoint][0], map(currentpoint, 0, size-1, 0, width), height);
  ellipse(map(getIndex(min(matrix), matrix), 0, size-1, 0 , width), min(matrix),10,10);
  
  if(points.size() == 0){
    temperature = 0;
    noLoop();
  } 

  fill(255);
  stroke(255);
  rect(0, 0, 125, 20);
  fill(100);
  textSize(12);
  text("Temperature: "+String.format("%.2f", temperature), 10, 20);
  println("Solution count: "+ cnt);
  rec();
}
