
class Planets {
  
  float rotation = 0;; 
  float planetRotation;
  float rotationRadius;
  float planetOrbitSpeed;
  PShape planet;
  
  // Variables for rotation 
  float planetPosX = 0.0000f; // New 0.0000f
  float planetPosY = 0.0000f;  
  float planetPosZ = 0.0000f;
  int cx = width/2;
  int cy = height/2;
  int cz = height/2;
  
  Planets(float r,int s,float o, PShape p)
  {
    planetRotation = r;
    rotationRadius = s;
    planetOrbitSpeed = o;
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
     float t = millis()/planetOrbitSpeed;
     planetPosX = (cx+rotationRadius*cos(t));
     planetPosY = (cy+rotationRadius*sin(t));
     planetPosZ = (cz+rotationRadius*sin(t));  
     translate(planetPosX,height/2,planetPosZ);
     rotateY(rotation);
     rotation = rotation + planetRotation;
     shape(planet);
     popMatrix();
     }

     float getX(){return planetPosX;}
     float getY(){return planetPosY;}
     float getZ(){return planetPosZ;}
     

    }