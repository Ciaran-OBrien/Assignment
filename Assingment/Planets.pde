class Planets {
  
  float rotation = 0;; 
  float planetRotation;
  float rotationRadius;
  float planetOrbitSpeed;
  PShape planet;
  
  // Variables for rotation 
  float planetPosX;
  float planetPosY;  
  float planetPosZ;
  int cx = width/2;
  int cy = height/2;
  int cz = (cx+cy)/2;
  
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
     planetPosX = (int)(cx+rotationRadius*cos(t));
     planetPosY = (int)(cy+rotationRadius*sin(t));
     planetPosZ = (int)(cz+rotationRadius*sin(t));
     translate(planetPosX,width/2,planetPosZ);
     rotateY(rotation);
     rotation = rotation + planetRotation;
     shape(planet);
     popMatrix();
     
     
     }
     
     
     float getX(){return planetPosX;}
     float getY(){return planetPosY;}
     float getZ(){return planetPosZ;}
     

    }