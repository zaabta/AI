import java.util.*;

float [][] matrix;
float temperature, min, max;
int w, size ,j = -1, cnt;
List<Integer> points; 
int currentpoint;

void setup(){
  frameRate(10);
  size(700, 200); // size of canves
  size = width /3; // size of probabilities
  matrix = fillRandMatrixTimeSeries(size, 1, -100, 100); // Generate the probabilities as Ranomd time series
  temperature = 25; // Temperature
  w = 20; // width of line in canves
  points = new ArrayList(); // the points of probabilities
  min = min(matrix);
  max = max(matrix);
  
  for(int i = 0; i < matrix.length; i++){
    matrix[i][0] = map(matrix[i][0], min(matrix), max(matrix), 40, height); // reMaping the  probabilities points  Cording to caves size
    points.add(i);
  }
   currentpoint = getIndex(min(matrix), matrix); 
   //points.remove(new Integer(currentpoint));
}

void draw(){
  background(255); // clear the canves 255 ==> white
  
  for(int i = w; i < height; i += w){ // draw The lines 
    stroke(130);
    line(0, i, width, i);
  }
  // draw the probabilities
  beginShape();
  for(int i = 0; i < matrix.length; i++){
      noFill();
      stroke(100);
      strokeWeight(1);
      vertex(map(i, 0, matrix.length, 0, width), matrix[i][0]);
  }
  endShape();
  

  if(temperature > 0.1) temperature *= 0.99;
  else noLoop();
  if(Math.random() < 1/Math.exp(matrix[currentpoint][0]/temperature)){
    ++cnt;
    currentpoint = nextPoint(currentpoint, points, matrix);
    //points.remove(new Integer(currentpoint));
  } 
  
  stroke(255, 0, 0);
  line(map(currentpoint, 0, size-1, 0, width), matrix[currentpoint][0], map(currentpoint, 0, size-1, 0, width), height);

  
  if(points.size() == 0){
    temperature = 0;
    noLoop();
  } 

  fill(255);
  stroke(255);
  rect(0, 0, 125, 20);
  fill(100);
  textSize(12);
  text("Temperature: "+String.format("%.1f", temperature), 10, 20);
  println("Solution count: "+ cnt);
  rec();
}
