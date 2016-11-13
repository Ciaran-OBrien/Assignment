class Planets {
  
  float rotation = 0;; 
  float planetRotation;
  float rotationRadius;
  PShape planet;
  
  // Variables for rotation 
  float planetPosX;
  float planetPosY;  
  float planetPosZ;
  int cx = width/2;
  int cy = height/2;
  int cz = (cx+cy)/2;
  
  Planets(float r,int s, PShape p)
  {
    rotationRadius = s;
    planetRotation = r;
    planet = p;
  }
 
  void shine() {
    pushMatrix();
    translate(width/2, height/2, cy);
    rotateY(rotation);
    rotation = rotation + planetRotation;
    shape(planet);
    popMatrix();
    
   
  } 

 
   void create(){
     pushMatrix();
     float t = millis()/600.0f;
     planetPosX = (int)(cx+rotationRadius*cos(t));
     planetPosY = (int)(cy+rotationRadius*sin(t));
     planetPosZ = (int)(cz+rotationRadius*sin(t));
     translate(planetPosX,height/2,planetPosZ);
     rotateY(rotation);
     rotation = rotation + planetRotation;
     shape(planet);
     popMatrix();
     }
    }