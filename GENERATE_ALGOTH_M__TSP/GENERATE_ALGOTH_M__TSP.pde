import java.util.*;

Random rnd;
int nCity, populationSize;
Travel travel;
Float min = Float.POSITIVE_INFINITY;
float bestDistance;
List<int[]> population;
int[] order;
float[] fitness;
int [] bestEver, currentBest; // best sort order of city
double mutationRate;

void setup(){
  size(400, 400);
  nCity = 50;
  populationSize = 500;
  mutationRate = 0.01;
  rnd = new Random(12);
  order = new int[nCity];
  population = new ArrayList();
  travel = new Travel(nCity, true); // create the cities with random val 
  for(int i = 0; i < order.length; i++) // init the order of cities
    order[i] = i;
  bestEver = order.clone();
  int[] orderCopy = order.clone();
  for(int i = 0; i < populationSize; i++){
    population.add(shuffle(orderCopy));
  }
  fitness = new float[population.size()]; 
  travel.generateInitialTravel(nCity, true);
  bestDistance = calDistanceAcoordingToOrder(travel.travel , order);
}

void draw(){
  background(0);
  
  calFitness(); // Calculate the fitness of each population
  normalizeFitness(); // normalize the values of Fitness
  nextGeneration(); // find the next Generation
  
  travel.display(bestEver); // draw it according to best order of cities
  text("Distance: "+bestDistance, 10, 20); // write the best Distance

}

int[] shuffle(int arr[]){
  int[] shuffleArr = arr.clone();
  for(int i = arr.length-1; i > 0; i--){
    int j = rnd.nextInt(i);
    int temp = shuffleArr[i];
    shuffleArr[i] = shuffleArr[j];
    shuffleArr[j] = temp;
  }
  return shuffleArr;
}

float calDistanceAcoordingToOrder(List<City> cites, int[] order){
  float sum = 0;
  for(int i = 0; i < cites.size() -1; i++){
    sum += dist(cites.get(order[i]).getX(), cites.get(order[i]).getY(), cites.get(order[i + 1]).getX(), cites.get(order[i + 1]).getY());
  }
  return sum;
}
