
class Flock {
  ArrayList<Boid> boids; 

  Flock() {
    boids = new ArrayList<Boid>();
  }

  void run() {
    for (Boid b : boids) {
      b.run(boids);  
    }
  }

  void addBoid(Boid b) {
    boids.add(b);   
  }
  
  void delBoid() {
    if(boids.size()>1){
      boids.remove(boids.size()-1);
    }
  }
  
  
  void feed(boolean condition){
    if (!condition)
      return;
    for (Boid b : boids){
      PVector mouse = new PVector(mouseX,mouseY);
      float d = PVector.dist(b.position,mouse);
      
      if(d < b.neighbour*2){
      PVector feed = b.seek(mouse);
      feed.mult(1.9);
      b.applyForce(feed);
    }
    else if(d == 0) {
      b.applyForce(b.seek(new PVector(width-mouseX,height-mouseY)));
    }
    }
  }
  
  
  void eat(){
    for (Boid b : boids){
       float d = PVector.dist(b.position,shark.position);
       if(d<=17){
         boids.remove(b);
         break;
       }
       
    }
  }
  
  void changeSeparation(float ms, boolean condition){
    if (!condition)
      return;
    for (Boid b : boids)
    {
      b.separationmult=ms;
    }
  }
  
  void changeAlign(float ma, boolean condition){
    if (!condition)
      return;
    for (Boid b : boids)
    {
      b.alignmult=ma;
    }
  }
  
  void changeCohesion(float mc, boolean condition){
    if (!condition)
      return;
    for (Boid b : boids)
    {
      b.cohesionmult=mc;
    }
  }
  
  void changeNeighbour(float n, boolean condition){
    if (!condition)
      return;
    for (Boid b : boids)
    {
      b.neighbour=n;
    }
  }
  
  float getSeparationmult(){
    if(boids.size()>0){
      return boids.get(0).separationmult;
    }
    return 0;
  }
  
    float getAlignmult(){
    if(boids.size()>0){
      return boids.get(0).alignmult;
    }
    return 0;
  }
    float getCohesionmult(){
    if(boids.size()>0){
      return boids.get(0).cohesionmult;
    }
    return 0;
  }
    float getNeighbour(){
    if(boids.size()>0){
      return boids.get(0).neighbour;
    }
    return 0;
  }

}
