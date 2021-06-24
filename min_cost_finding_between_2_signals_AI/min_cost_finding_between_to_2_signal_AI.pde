

Random rnd;
double[] signal1;
double[] signal2;
int n, i;
int numberOfIterations;
double coolingRate = 0.99, t;
int frameRate = 19;

void setup(){
  frameRate(frameRate);
  n = 100;  // number of cities
  i = 0;
  size(600, 300);
  signal1 = getColum(data, 0);
  signal2 = getColum(data, 1);
  numberOfIterations = n * 100000;
  t = 100;
  coolingRate = 0.9999;
  /*
  rnd = new Random(12);
  fillRandomSerise(signal1, -1, 1);
  map(signal1, 0, n);
  rnd = new Random(13);
  fillRandomSerise(signal2, -1, 1);
  map(signal2, 0, n);
  */
  println("Cuurent cost:"+ calCost(signal1, signal2, n));
}

void draw(){
  double bestCost = calCost(signal1, signal2, n);
  int k = 1; // left & right amount
  double p = 0.1; // up & dwon amount
  int oper = -1;  // number of opertion
  
  if(i < numberOfIterations){
    if (t > 0.1){
      oper = new Random().nextInt(4); // opertion numbers 0 ->left 1->right 2->up 3->down
      switch(oper){
        case 0: leftShift(signal2, k); break;
        case 1: rightShift(signal2, k); break;
        case 2: up(signal2, p); break;
        case 3:down(signal2, p); break;
      }
        double currentCost = calCost(signal1, signal2, n); 
        if (currentCost < bestCost){
            bestCost = currentCost;
            //System.out.println("Temperature: "+ t+" numberOfIterations:"+ i+" BestCot: "+bestCost+" oper:"+oper+" K:"+k+" P:"+p);
        }else if (Math.exp((bestCost - currentCost) / t) < Math.random()) {
           switch(oper){
             case 0: rightShift(signal2, k); break;
             case 1: leftShift(signal2, k); break;
             case 2: down(signal2, p); break;
             case 3:up(signal2, p); break;
             }
         }
    }
          t *= coolingRate;
  }
  i++;
  if(i == numberOfIterations) noLoop();
    background(255);
  

  plot(signal1, color(255, 0, 0));
  plot(signal2, color(0 , 0, 255));
               

  fill(0);
  text("Temperature: "+ String.format("%.0f",t),10,20);
  text("Cost : "+ String.format("%.1f",bestCost), width - 100, 20);
  rec();
}

private static double simulateAnnealing(double[] d1, double[] d2, double Temperature, int numberOfIterations, double coolingRate, int nCity){
        double t = Temperature;
       
       
        double bestCost = calCost(d1, d2, nCity);
        int k = 1; // left & right amount
        double p = 0.1; // up & dwon amount
        int oper = -1;  // number of opertion
       
        for (int i = 0; i < numberOfIterations; i++){
            if (t > 0.1){
                oper = new Random().nextInt(4); // opertion numbers 0 ->left 1->right 2->up 3->down
                switch(oper){
                    case 0: leftShift(d2, k); break;
                    case 1:rightShift(d2, k); break;
                    case 2: up(d2, p); break;
                    case 3:down(d2, p); break;
                }
               
               
                double currentCost = calCost(d1, d2, nCity);
                double tempCost = bestCost;
               
                if (currentCost < bestCost){
                    bestCost = currentCost;
                    System.out.println("Temperature: "+ t+" numberOfIterations:"+ i+" BestCot: "+bestCost+" oper:"+oper+" K:"+k+" P:"+p);
                   
                }else if (Math.exp((bestCost - currentCost) / t) < Math.random()) {
                    switch(oper){
                    case 0: rightShift(d2, k); break;
                    case 1: leftShift(d2, k); break;
                    case 2: down(d2, p); break;
                    case 3:up(d2, p); break;
                    }
                }
                t *= coolingRate;
            }else
                continue;
               
        }
        return bestCost;
    }
    
void keyPressed() {
  if (key == 'q') {
    videoExport.endMovie();
    exit();
  }
}    
