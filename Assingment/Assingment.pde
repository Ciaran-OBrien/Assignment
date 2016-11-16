import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;



/*
Student Name: Ciarán O'Brien
Student Number: C15765215
Processing code that creates an array of planes.
*/

float rotation = 0.000f;
int numOfPlanets = 9;
int planetIndex;
int planetDistance = 0;
int cameraDistance = 400;



ArrayList<PlanetData> data = new ArrayList<PlanetData>();

PImage[] planetSurface = new PImage[numOfPlanets];
PShape[] planets = new PShape[numOfPlanets];
float[] planetSize = new float[numOfPlanets];

// Initialise a new camera. It's starting position delclared below
PeasyCam cam;
// Initialise each instance of the class Planet
Planets[] classPlanets = new Planets[numOfPlanets];

void setup ()
{

  size(1000,1000,P3D);
  noStroke();
  cam = new PeasyCam(this,width/2,height/2-200,2500,0);

  for (int i = 0; i < numOfPlanets;i ++)
  {
    // Load the images of the planets to an array
    planetSurface[i] = loadImage("/images/planet" + i + ".jpg");
    // create an array of sphere shapes
    planets [i] = createShape(SPHERE,50);
    // set each planet image as a texture to the planet.
    planets [i].setTexture(planetSurface[i]);
    // Create a new class object, passing two values: 
    // The planet's rotation speed and the planet shape with accompaning texture
    classPlanets[i] = new Planets(0.006,planetDistance,random(100,1000),planets[i]);
    // Currently the planets are all going to be equadistance from each other by 150 pixels
    planetDistance += 150;
  }
  


  

}

void draw()
{
  background(0); //Space is super black !
  classPlanets[0].shine();
  for (int i=1;i<numOfPlanets;i++){
    classPlanets[i].create();
  }
  
  keyPressed();
}

// Loading the data of the planets from csv file
void loadData(){
  
  data.clear();
  String[] lines = loadStrings("solarSystem.csv");

}

void keyPressed(){


   if (key == 'q'){
    planetIndex = 5;
    cam = new PeasyCam(this,classPlanets[planetIndex].getX(),width/2,classPlanets[planetIndex].getZ(),cameraDistance);
    planets[0].setVisible(false);
    planets[planetIndex+1].setVisible(false);
    planets[planetIndex+2].setVisible(false);
   }
   
   if (key == 'p'){
    cam = new PeasyCam(this,width/2,height/2-200,3000,0);
    for (int i =0;i < numOfPlanets; i++){
      planets[i].setVisible(true);
    }
 }
 
}