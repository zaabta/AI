
float heuristic(Spot a, Spot b){
  //float d = dist(a.x, a.y, b.x, b.y);
  float d = abs(a.x - b.x) + abs(a.y - b.y);
  return d;
}


import java.util.*; 

Spot [][] grid;
Spot start ,end, current;
int cols = 40;
int rows = 40;
int H, W;

List<Spot> openedSet, closedSet, path;

void setup(){
  size(600, 600);
  
  H = height / cols;
  W = width / rows;
  
  
  grid = new Spot [rows][cols];
  
  for(int i = 0; i < rows; i++){
    for(int j = 0; j < cols; j++){
      grid[i][j] = new Spot(i, j);
    }
  }
  

  
  start = grid[0][0];
  end = grid[floor(random(rows))][floor(random(cols))];
  start.isWall = false;
  end.isWall = false;
  
  for(int i = 0; i < rows; i++){
    for(int j = 0; j < cols; j++){
      grid[i][j].addNeighbors(grid);
    }
  }
  
  openedSet = new ArrayList<Spot>();
  closedSet = new ArrayList<Spot>();
  path = new ArrayList<Spot>();
  
  openedSet.add(start);
}

void draw(){
  
  if(openedSet.size() > 0){
    // we can keep going
    
    int winner = 0;
    for(int i = 0; i < openedSet.size(); i++){  // getting the winner index 
      if(openedSet.get(i).f < openedSet.get(winner).f){
        winner = i;
      }
    }
    
    current = openedSet.get(winner);
    
    if(current == end){
      // find the path
      path = new ArrayList<Spot>(); 
      Spot temp = current;
      path.add(temp);
      while(temp.previous != null){
        path.add(temp.previous);
        temp = temp.previous;
      }
      noLoop();
      println("\n Done !");
    }
    
    openedSet.remove(current);
    closedSet.add(current);
    
    List<Spot> neighbors = current.getNeighbors();
    for(int i = 0; i < neighbors.size(); i++){
      Spot neighbor = neighbors.get(i);
      if(closedSet.contains(neighbor)){
            continue;
      }else if(closedSet.contains(neighbor) == false  && neighbor.isWall == false){
        int tempG = (int)current.g + 1;
        if(openedSet.contains(neighbor)){
          if(tempG < neighbor.g)
            neighbor.g = tempG;
        }else{
          neighbor.g = tempG;
          openedSet.add(neighbor);
        }
        neighbor.h = heuristic(neighbor, end);
        neighbor.f = neighbor.g + neighbor.h;
        neighbor.previous = current;
      }      
              
    }
    
  }else{
    // no solution
    noLoop();
    println("No Solution !");
  }
  background(255);
  
  for(int i = 0; i < rows; i++){
    for(int j = 0; j < cols; j++){
      if(grid[i][j].isWall)
        grid[i][j].show(color(0));
      else  
        grid[i][j].show(color(255));
      if(grid[i][j] == end)
        grid[i][j].show(color(255,255,0));
    }
  }
  
  for(int i = 0; i < closedSet.size(); i++){
    closedSet.get(i).show(color(255, 0, 0)); 
  }
  
  for(int i = 0; i < openedSet.size(); i++){
    openedSet.get(i).show(color(0, 255, 0)); 
  }
 
  for(int i = 0; i < path.size(); i++){
    if(path.get(i) == end)
      path.get(i).show(color(255, 255, 0));
      else
      path.get(i).show(color(0, 0, 255)); 
  }
  
}
