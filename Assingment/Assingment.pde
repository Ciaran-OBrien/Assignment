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


String lastInput = new String();
String currentInput = new String();
PFont myFont; 
String planetsMars = "mars";
String planetNames [] = {"sun","mars","venus","earth","mercury","jupiter","saturn","uranus","neptune"};


ArrayList<PlanetData> data = new ArrayList<PlanetData>();

PImage[] planetSurface = new PImage[numOfPlanets];
PShape[] planets = new PShape[numOfPlanets];
float[] planetSize = new float[numOfPlanets];

// Initialise a new camera. It's starting position delclared below
PeasyCam cam;
// Initialise each instance of the class Planet
//Planets sun,mars,venus,earth,mercury,jupiter,saturn,uranus,neptune;
// New new new aray of class objects
Planets[] classPlanets = new Planets[numOfPlanets];


void setup (){
  fullScreen(P3D);
  //size(1000,1000,P3D);
  frameRate(24);
  noStroke();
  cam = new PeasyCam(this,width/2,height/2-200,3000,0);

  for (int i = 0; i < numOfPlanets;i ++){
    // Load the images of the planets to an array
    planetSurface[i] = loadImage("/images/planet" + i + ".jpg");
    // create an array of sphere shapes
    planets [i] = createShape(SPHERE,50);
    // set each planet image as a texture to the planet.
    planets [i].setTexture(planetSurface[i]);
    

    myFont = createFont("FFScala", 32);
    textFont(myFont);
    textAlign(CENTER);
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
  

}

void draw(){
  background(0); //Space is super black !
  classPlanets[0].shine();
  for (int i=1;i<numOfPlanets;i++){
    classPlanets[i].create();
  }
  //mars.create();
  //venus.create();
  //earth.create();
  //mercury.create();
  //jupiter.create();
  //saturn.create();
  //uranus.create();
  //neptune.create();
  
   
  fill(255);
  textSize(100);
  //text(lastInput,width/2,height/2);
  fill(255,0,0);
  text(currentInput,width/2,height-50);

  check();
  
}

// Loading the data of the planets from csv file
void loadData(){
  
  data.clear();
  String[] lines = loadStrings("solarSystem.csv");

}

void keyPressed(){

  if(key == ENTER){
    currentInput = "";
    cam = new PeasyCam(this,classPlanets[0].getX(),classPlanets[0].getY()-200,3000,0);
    for (int i =0;i < numOfPlanets; i++){
     planets[i].setVisible(true);
    }
  }
  else if(key == BACKSPACE && currentInput.length() > 0){
    currentInput = currentInput.substring(0, currentInput.length() - 1);
  }
  else{
    currentInput = currentInput + key;
  }


}

void check(){

  for (int i = 0;i< numOfPlanets;i++){
    if(currentInput.equals(planetNames[i]) == true){
         background(0);
         planetIndex = i;
         classPlanets[planetIndex].shine();
         cam = new PeasyCam(this,classPlanets[planetIndex].getX(), classPlanets[planetIndex].getY(),classPlanets[planetIndex].getZ(),cameraDistance);
        
      }

  }

}