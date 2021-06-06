import java.util.*;

Random rnd;
int nCity = 0;
Travel travel, bestSolution, finalSolution, currentSolution;
int min = Integer.MAX_VALUE;
double startingTemperature, numberOfIterations , t;
double coolingRate;
double bestDistance;
int i = 0;

void setup(){
  size(400, 400);
  rnd = new Random(12);
  nCity = 50;
  startingTemperature = 1000;
  numberOfIterations = nCity * 100000;
  coolingRate = 0.99999;
  travel = new Travel(nCity, true);
  println("Starting SA with temperature: " + startingTemperature + ", # of iterations: " + numberOfIterations + " and cooling rate: " + coolingRate);
  t = startingTemperature;
  travel.generateInitialTravel(nCity, true);
  bestDistance = travel.calTotalDistance();
  println("Initial distance of travel: " + bestDistance);
  bestSolution = travel;
  finalSolution = null;
  currentSolution = bestSolution;
}

void draw(){
  background(0);
  if(i < numberOfIterations){
    currentSolution.display();
    if(t > 0.1){
      currentSolution.swapCities();  
      double currentDistance = currentSolution.calTotalDistance();
      if (currentDistance < bestDistance) {
        bestDistance = currentDistance;
        finalSolution = currentSolution.copy();
      } else if (Math.exp((bestDistance - currentDistance) / t) < Math.random()) {
        currentSolution.revertSwap();
      }
      t *= coolingRate;
    }
    if (i % 100 == 0) {
      println("Iteration #" + i + " temp:" + t + " best distance:" + bestDistance);
    }
  
  }
  else {
    noLoop();
    background(0);
    finalSolution.display();
  }
  i++;
  fill(255);
  text("Distance: "+bestDistance, 10, 20);
}
