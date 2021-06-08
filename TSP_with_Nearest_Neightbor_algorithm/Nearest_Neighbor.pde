

public City findTheNearestNeighborOfCity(City city, List<City> cities){
  float minDistance = Float.POSITIVE_INFINITY;
  City nearestCity = null;
  for(int i = 0; i < cities.size(); i++){
    City currentCity = cities.get(i);
    if(city.getX() != currentCity.getX() && city.getY() != currentCity.getY()) {
      float d = city.distanceToCity(currentCity);
      if(d < minDistance) {
        minDistance = d;
        nearestCity = currentCity;
      }
    }
  }
  TestedCitiesList.remove(nearestCity);
  return nearestCity;
} 
