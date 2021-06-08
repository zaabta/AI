class Travel{
   private List<City> travel = new ArrayList();
   private List<City> previousTravel = new ArrayList();
   
   public Travel(int numberOfCities, boolean isSeeded) {
     
     for (int i = 0; i < numberOfCities; i++) {
       this.travel.add(new City(isSeeded));
     }
   }
   
   private Travel(){}
   
   public Travel copy(){
        Travel ret = new Travel();
        for (City city : this.travel) {
            ret.travel.add(city);
        }
        for (City city : this.previousTravel) {
            ret.previousTravel.add(city);
        }
        return ret;
    }
    
    public City getCity(int index) {
        return this.travel.get(index);
    }
    
    private int generateRandomIndex() {
        return (int) (Math.random() * travel.size());
    }
    
    public void swapCities() {
        int a = this.generateRandomIndex();
        int b = this.generateRandomIndex();
        this.previousTravel = travel;
        City x = this.travel.get(a);
        City y = this.travel.get(b);
        this.travel.set(a, y);
        this.travel.set(b, x);
    }
    
    public int calTotalDistance() {
        int distance = 0;
        for (int index = 0; index < travel.size(); index++) {
            City starting = getCity(index);
            City destination;
            if (index + 1 < travel.size()) {
                destination = getCity(index + 1);
            } else {
                destination = getCity(0);
            }
            distance += starting.distanceToCity(destination);
        }
        return distance;
    }
    
    public void revertSwap() {
        travel = previousTravel;
    }
    
    public void generateInitialTravel(int numberOfCities, boolean isSeeded) {
        if (this.travel.isEmpty())
            new Travel(numberOfCities, isSeeded);
        Collections.shuffle(travel);
    }
    
    public void display(){
      for(int i = 0; i < this.travel.size() -1; i++){
        this.travel.get(i).display(color(255));
        stroke(255);
        strokeWeight(2);
        line(travel.get(i).getX(), travel.get(i).getY(), travel.get(i+1).getX(),travel.get(i+1).getY());
      }
      this.travel.get(this.travel.size()-1).display(color(255));
    }
    
   public void display(int[] order){
     beginShape();
     stroke(255);
     strokeWeight(2);
      for(int i = 0; i < order.length; i++){
        this.travel.get(order[i]).display(color(255));
        vertex(this.travel.get(order[i]).getX(), this.travel.get(order[i]).getY());
      }
      noFill();
      endShape();
      
    }
    
    public void attach(City A, City B){
      stroke(255);
      strokeWeight(2);
      line(A.getX(), A.getY(), B.getX(), B.getY());
    }
    
    public int getNumberOfCities(){
      return this.travel.size();
    }
    
    public boolean containCity(City city){
      for(City c : this.travel)
        if(c.equals(city))
          return true;
      return false;
    }
}
