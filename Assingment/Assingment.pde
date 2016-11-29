import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;


/*
Student Name: Ciarán O'Brien
Student Number: C15765215
Processing code that creates an array of planes.
*/


int numOfPlanets = 9;
int planetDistance = 0;
int cameraDistance = 200;
int planetIndex;
int maxWarpSpeed = 7;

float sx [] = new float [6];
float sy [] = new float [6];

String currentInput = new String();
PFont myFont,detailText; 
String planetsMars = "mars";
String planetNames [] = {"sun","mars","venus","earth","mercury","jupiter","saturn","uranus","neptune"};

boolean stringCheck = false;
boolean warpReady = false;
boolean click = false;
boolean fade = false;

ArrayList<PlanetData> data = new ArrayList<PlanetData>();

PImage[] planetSurface = new PImage[numOfPlanets];
PShape[] planets = new PShape[numOfPlanets];
float[] planetSize = new float[numOfPlanets];

//Star
Star[] stars = new Star[9000];
float speed = 0;

// Initialise a new camera. It's starting position delclared below
PeasyCam cam;
// Initialise each instance of the class Planet
//Planets sun,mars,venus,earth,mercury,jupiter,saturn,uranus,neptune;
// New new new aray of class objects
Planets[] classPlanets = new Planets[numOfPlanets];

// Initialise a new object of type prompt
// a method within the class will be called to display the prompt 
Prompt newLine;

Text userText;

Details allDetails;

// Declaring sound instancies
Minim minim;
AudioPlayer door;

Credits endCredits;

void setup (){

  //fullScreen(P3D);
  size(1000,1000,P3D);
  frameRate(120);
  noStroke();
  cam = new PeasyCam(this,width/2,height/2-200,3000,0);

  for (int i = 0; i < numOfPlanets;i ++){
    // Load the images of the planets to an array
    planetSurface[i] = loadImage("/images/planet" + i + ".jpg");
    // create an array of sphere shapes
    planets [i] = createShape(SPHERE,50);
    // set each planet image as a texture to the planet.
    planets [i].setTexture(planetSurface[i]);
    

  }
  
  // Create a new class object, passing two values: 
  // The planet's rotation speed and the planet shape with accompaning texture
  //classPlanets[0] = new Planets(0.006,0,0,planets[0]); 
  //classPlanets[1] = new Planets(0.006,150,random(1000,2000),planets[1]);
  //classPlanets[2] = new Planets(0.006,300,random(1000,2000),planets[2]);
  //classPlanets[3] = new Planets(0.006,450,random(1000,2000),planets[3]);
  //classPlanets[4] = new Planets(0.006,600,random(1000,2000),planets[4]);
  //classPlanets[5] = new Planets(0.006,750,random(1000,2000),planets[5]);
  //classPlanets[6] = new Planets(0.006,900,random(1000,2000),planets[6]);
  //classPlanets[7] = new Planets(0.006,1050,random(1000,2000),planets[7]);
  //classPlanets[8] = new Planets(0.006,1200,random(1000,2000),planets[8]);
  
  for (int i = 0; i < numOfPlanets; i ++){
    classPlanets[i] = new Planets(0.006, planetDistance, random(1000,2000),planets[i]);
    planetDistance +=150;
  }
  
  //star
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
  
  currentInput = "";
  
  newLine = new Prompt();
  userText = new Text();
  
  
  allDetails = new Details();
  
    
  minim = new Minim(this);
  
  door = minim.loadFile("door_slide.mp3");
  
  endCredits = new Credits();
  

}

void draw(){
  background(0); //Space is super black !
  classPlanets[0].shine();
  for (int i=1;i<numOfPlanets;i++){
   classPlanets[i].create();
  }

  
  userText.display();
  if (currentInput == "")
    {
      userText.askUser();
    }
    
  check();
  
  newLine.activate();
  //door.play();
  stars();
  
  
  newLine.end();
  if (click && warpReady)
  {
    warpSpeed();
  }


}

// Loading the data of the planets from csv file
void loadData(){
  
  data.clear();
  String[] lines = loadStrings("solarSystem.csv");

}

void keyPressed(){

  if(key == ENTER){
    currentInput = "";
    cam = new PeasyCam(this,width/2,height/2-200,3000,0);
    for (int i =0;i < numOfPlanets; i++){
     planets[i].setVisible(true);
    }
  }
  else if(key == BACKSPACE && currentInput.length() > 0){
    currentInput = currentInput.substring(0, currentInput.length() - 1);
    cam = new PeasyCam(this,width/2,height/2-200,3000,0); 
}
  else if (keyCode >= 65 && keyCode <=90){
    currentInput = currentInput + key;
    cam = new PeasyCam(this,width/2,height/2-200,3000,0);
  }



}


void check(){

  for (int i = 0;i< numOfPlanets;i++){
    if(currentInput.equals(planetNames[i]) == true){
         clear();
         planetIndex = i;
         classPlanets[planetIndex].shine();
         cam = new PeasyCam(this,classPlanets[planetIndex].getX(), classPlanets[planetIndex].getY(),classPlanets[planetIndex].getZ(),cameraDistance);
         displayDetails(width/2, height/2, 450, 5);
         warpReady = true;  
    }
    
}



  //if (currentInput != "")
  //{
  //  stringCheck = true;
  //}
  
}
  
 
void displayDetails(float x, float y, float radius, int npoints){
    translate(0,0,-300);
    float angle = TWO_PI / npoints;
    int count = 0;
    for (float a = 0; a < TWO_PI; a += angle) {
      sx[count] = x + cos(a) * radius;
      sy[count] = y + sin(a) * radius;
      detailText = createFont("ARCADE",40);
      textFont(detailText);            
      
      
      switch(currentInput){

       case "mercury":
         text(allDetails.mercury()[count], sx[count], sy[count]);
          break;
           
       case "venus":
         text(allDetails.earth()[count], sx[count], sy[count]);
         break;
          
       case "earth":
         text(allDetails.earth()[count], sx[count], sy[count]);
         break;
          
      case "mars":
         text(allDetails.mars()[count], sx[count], sy[count]);
         break;
          
      case "jupiter":
         text(allDetails.jupiter()[count], sx[count], sy[count]);
         break;
      
      case "saturn":
         text(allDetails.saturn()[count], sx[count], sy[count]);
         break;
       
      case "uranus":
         text(allDetails.uranus()[count], sx[count], sy[count]);
         break;
          
      case "neptune":
         text(allDetails.neptune()[count], sx[count], sy[count]);
         break;      
      }
      count++;
        
    }
  }

void stars()
{

  //speed = 0;//map(mouseX, 0, width, 0, 50);
  //translate(100, 100,-2000);

  for (int i = 0; i < stars.length; i++) {
   stars[i].update();
   stars[i].show();
  }
  

}

void mouseClicked(){click = true;}
  
void warpSpeed(){
  clear();
  stars();
  translate(width/2,height/2,-2000);
  if (speed<maxWarpSpeed){
     speed += frameCount/100f;
  }
  else{
    speed = maxWarpSpeed;
    delay(10);
    clear();
    pushMatrix();
    translate(-width/2,-height/2,2000);
    endCredits.roll();
    popMatrix();
  }

}

void fadeToBlack(){

    fill(0, 10);
    rect(height/2, width/2, width, height);
  
}