class Planets {
  
  float rotation = 0;; 
  float planetRotation;
  PShape planet;
  
  Planets(float r, PShape p)
  {
    planetRotation = r;
    planet = p;
  }
 
  void create() {
    pushMatrix();
    translate(width/2, height/2, 0);
    rotateY(rotation);
    rotation = rotation + planetRotation;
    shape(planet);
    popMatrix();
  } 




}