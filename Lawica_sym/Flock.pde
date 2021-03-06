
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
    if(boids.size()>0){
      boids.remove(boids.size()-1);
    }
  }
  
  
  void feed(){
    for (Boid b : boids){
      PVector mouse = new PVector(mouseX,mouseY);
      float d = PVector.dist(b.position,mouse);
      
      if(d < b.neighbord*2){
      PVector feed = b.seek(mouse);
      feed.mult(1.9);
      b.applyForce(feed);
    }
    else if(d == 0) {
      b.applyForce(b.seek(new PVector(width-mouseX,height-mouseY)));
    }
    }
  }
  

}
