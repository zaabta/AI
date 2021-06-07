import java.util.Arrays;

public void calFitness(){
  float currentRecord = Float.POSITIVE_INFINITY;
  for(int i = 0; i < population.size(); i++){
    float d = calDistanceAcoordingToOrder(travel.travel, population.get(i));
    if(d < bestDistance){
      bestDistance = d;
      bestEver = population.get(i); // the order of best sort for cities
    }
    if (d < currentRecord) {
      currentRecord = d;
      currentBest = population.get(i);
    }
    
    fitness[i] =  (1 / (pow(d, 8) + 1)) ; // d+1 to not be zero !? 
    
  }  
}

public void normalizeFitness(){
  float sum = 0;
  for(int i = 0; i < fitness.length; i++) // getting the sum of fitness
    sum += fitness[i];
  for(int i = 0; i < fitness.length; i++)
    fitness[i] = fitness[i] / sum;   
}

public void nextGeneration(){
  List<int[]> newPopulation = new ArrayList();
  for(int i = 0; i < population.size(); i++){
    int[] partA = pickOne(population, fitness);
    int[] partB = pickOne(population, fitness);
    int[]newOrder = crossOver(partA, partB);
    newOrder = mutate(newOrder , mutationRate);
    newPopulation.add(newOrder);
  }
  population = new ArrayList(newPopulation);
}

public int[] pickOne(List<int[]> population, float[] prob){
  int index = 0;
  float r = random(1);
  
  while(r > 0) {
    r = r - prob[index];
    index++;
  }
  index--;
  if(index >=  population.size() || index < 0){
    noLoop();
    println("Done !");
  }
  return population.get(index).clone();
}  

public int[] mutate(int[] order, double mutationRate){
  int[] mutatedOrder = order.clone();
  for(int i = 0; i < mutatedOrder.length; i++){
    if(random(1) < mutationRate){
      int indexA = floor(random(mutatedOrder.length));
      int indexB = (indexA + 1) % nCity;
      swap(mutatedOrder, indexA, indexB);
    }
  }
  
  return mutatedOrder;
}

public int[] crossOver(int[] partA, int[] partB){
  int start = floor(random(partA.length));
  int end = floor(random(start+1, partA.length));
  int[] newOrder = new int[nCity];
  int j = -1;
  
  for(int i = start; i < end; i++)
    newOrder[++j] = partA[i]; 
  
  for(int i = 0; i < partB.length; i++)
    if(!content(newOrder, partB[i]))
      newOrder[++j] = partB[i]; 
  
   return  newOrder;
}

public void swap(int[] arr, int i, int j){
  int temp = arr[i];
  arr[i] = arr[j];
  arr[j] = temp;
}

public boolean content(int[] arr, int val){
  for(int i = 0; i < arr.length; i++)
    if(arr[i] == val)
      return true;
  return false;
}
