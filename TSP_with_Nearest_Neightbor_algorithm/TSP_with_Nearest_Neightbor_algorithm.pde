import java.util.*;

Random rnd;
Travel travel;
int nCity, j;
List<City> TestedCitiesList;
City firstCity;
float bestDistance;

void setup(){
  size(400, 400);
  nCity = 50;
  rnd = new Random(12);
  travel = new Travel(nCity, true);
  travel.generateInitialTravel(nCity, false);
  TestedCitiesList = new ArrayList(travel.travel);
  j = 0;
  background(0);
  for(int i = 0; i < travel.getNumberOfCities(); i++){
    travel.getCity(i).display(color(255));
  }
  firstCity = travel.getCity(j);
}

void draw(){
  City nearestCity = findTheNearestNeighborOfCity(firstCity, TestedCitiesList);
  travel.attach(firstCity, nearestCity);
  bestDistance += firstCity.distanceToCity(nearestCity);
  firstCity = nearestCity;
  
  if(TestedCitiesList.size() == 0){
    noLoop();
    println("Done !");
  }
  fill(0);
  noStroke();
  rect(10,10, 130, 30);
  fill(255);
  text("Distance:" + bestDistance, 10, 20 ,130,30);
}
