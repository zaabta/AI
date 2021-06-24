
void fillRandomSerise(double[][] d, int min, int max){
  int nr=d.length;
  int nc=d[0].length;
  fillRandom(d, min, max);  
  double[][] ret=new double[nr][nc];
  for (int j = 0; j < nc; j++) {
    ret[0][j]=d[0][j];
    for (int i = 1; i < nr; i++) {
      ret[i][j] = ret[i-1][j]+d[i][j];
    }
  }
}

void fillRandom(double[][] arr, int min, int max){
  
  for(int i = 0; i < arr.length; i++){
    for(int j = 0; j < arr[i].length; j++){
      arr[i][j] = min + rnd.nextDouble() * (max - min);
    }
  }
  
}


void plot(double[] arr, color col){
  
  beginShape();
  stroke(col);
  
  noFill();
  float min = (float) min(arr);
  float max = (float) max(arr);
  
  for(int i = 0; i < arr.length; i++){
    
    strokeWeight(6);
     point(map(i, 0, arr.length, 0 , width), map((float) arr[i], 0, n, height, 0));
     //point(map(i, 0, arr.length, 0, width), map((float)arr[i], 0, 100, height, 0));
     strokeWeight(1);
     vertex(map(i, 0, arr.length, 0, width), map((float) arr[i], 0, n, height, 0));
    }
  endShape();
}


double max(double[][] arr){
  double max = Double.MIN_VALUE;
  
  for(int i = 0; i < arr.length; i++){
    for(int j = 0; j < arr[0].length; j++){
      if(max < arr[i][j]) max = arr[i][j];
    }
  }
  return max;
}

double max(double[] arr){
  double max = Double.MIN_VALUE;
  
  for(int i = 0; i < arr.length; i++){
      if(max < arr[i]) max = arr[i];
    }
  return max;
}


double min(double[][] arr){
  double min = Double.MAX_VALUE;
  
  for(int i = 0; i < arr.length; i++){
    for(int j = 0; j < arr[0].length; j++){
      if(min > arr[i][j]) min = arr[i][j];
    }
  }
  return min;
}

double min(double[] arr){
  double min = Double.MAX_VALUE;
  
  for(int i = 0; i < arr.length; i++){
      if(min > arr[i]) min = arr[i];
    }
  return min;
}


void map(double[][] arr, int min, int max){
  double Min = min(arr);
  double Max = max(arr);
  
  for(int i = 0; i < arr.length; i++)
    arr[i][0] = map((float)arr[i][0], (float)Min, (float)Max, (float)min, (float)max);
    
}

double[] getColum(double[][] matrix, int n){
  double[] arr = new double[matrix.length];
  for(int i = 0; i < matrix.length; i++){
    arr[i] = matrix[i][n];
  }
  return arr;
}

private static double  calCost(double[] d1, double[] d2, int n){
   double res = 0;
   for(int i = 0; i < n; i++)
     res += Math.abs(d1[i] - d2[i]);
       
  return res;
}

private static void leftShift(double[] arr, int d){
        for(int i = 0; i < d; i++)
            leftShift(arr);
    }
   
   
    private static void leftShift(double[] arr){
        double temp = arr[0];
        for (int i = 0; i < arr.length - 1; i++)
            arr[i] = arr[i + 1];
        arr[arr.length - 1] = temp;
    }
   
    private static void reverseArray(double arr[], int start,
                             int end){
        while (start < end)
        {
           double temp = arr[start];
           arr[start] = arr[end];
           arr[end] = temp;
           start++;
           end--;
         }
    }
 
    private static void rightShift(double arr[], int d){
       reverseArray(arr, 0, arr.length - 1);
       reverseArray(arr, 0, d - 1);
       reverseArray(arr, d, arr.length - 1);
    }
   
    private static void up(double[] arr, double k){
        double[] copyOfArray = arr.clone();
        for(int i = 0; i < arr.length; i++){
            copyOfArray[i] = copyOfArray[i] + k;
        }
         if(isSafe(copyOfArray)) setArray(arr, copyOfArray.clone());
             
    }
   
   
    private static void down(double[] arr, double k){
        double[] copyOfArray = arr.clone();
        for(int i = 0; i < arr.length; i++){
            copyOfArray[i] = copyOfArray[i] - k;
        }
        if(isSafe(copyOfArray)) setArray(arr, copyOfArray.clone());
    }
   
    private static boolean isSafe(double[] arr){
        for(int i = 0; i < arr.length; i++){
            if(arr[i] > 100  || arr[i] < 0)
                return false;
            }
        return true;
    }
   
    private static void setArray(double arr[], double[] clone){
        for(int i = 0; i < arr.length; i++)
            arr[i] = clone[i];
    }
   
   
