import java.util.Arrays;

public static float[][] fillRandMatrix(int r, int c, int min, int max) {
  float[][]  d = new float[r][c];
  for (int i = 0; i < d.length; i++) {
    for (int j = 0; j < d[0].length; j++) {
      d[i][j] = (float) (min + Math.random() * (max - min));
    }
  }
  return d;
}

public static float[][] fillRandMatrixTimeSeries(int nr, int nc, int min, int max) {
  float[][] d = fillRandMatrix(nr, nc, min, max);
  float[][] ret = new float[nr][nc];
  for (int j = 0; j < nc; j++) {
    ret[0][j] = d[0][j];
    for (int i = 1; i < nr; i++) {
      ret[i][j] = ret[i-1][j] + d[i][j];
    }
  }
  return ret;
}

public static void printMatrix(float[][] matrix) {
  for(int i = 0; i < matrix.length; i++){
      println(Arrays.toString(matrix[i]));
  }
}

public static float min(float[][] matrix){
  float min = Float.MAX_VALUE;
  for(int i = 0; i < matrix.length; i++){
      min = Math.min(min, matrix[i][0]);
  }
  return min;
}

public static float max(float[][] matrix){
  float max = Float.MIN_VALUE;
  for(int i = 0; i < matrix.length; i++){
      max = Math.max(max, matrix[i][0]);
  }
  return max;
}

public static int getIndex(float val,float[][] matrix){
  for(int i = 0; i < matrix.length; i++){
      if(matrix[i][0] == val)
      return i;
  }
  return 0;
}

public int nextPoint(int cuurentPoint, List<Integer> points, float[][] matrix){
  int nextPoint = points.get(floor(random(points.size())));
  while(matrix[cuurentPoint][0] < matrix[nextPoint][0]){
    
      nextPoint = points.get(floor(random(points.size())));
  }
  return nextPoint;
}
