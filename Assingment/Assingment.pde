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
int cameraDistance = 400;



ArrayList<PlanetData> data = new ArrayList<PlanetData>();

PImage[] planetSurface = new PImage[numOfPlanets];
PShape[] planets = new PShape[numOfPlanets];
float[] planetSize = new float[numOfPlanets];

// Initialise a new camera. It's starting position delclared below
PeasyCam cam;
// Initialise each instance of the class Planet
Planets sun,mars,venus,earth,mercury,jupiter,saturn,uranus,neptune;

void setup ()
{

  size(1000,1000,P3D);
  noStroke();
  cam = new PeasyCam(this,width/2,height/2,2500,0);

  for (int i = 0; i < numOfPlanets;i ++)
  {
    // Load the images of the planets to an array
    planetSurface[i] = loadImage("/images/planet" + i + ".jpg");
    // create an array of sphere shapes
    planets [i] = createShape(SPHERE,50);
    // set each planet image as a texture to the planet.
    planets [i].setTexture(planetSurface[i]);
  }
  
  // Create a new class object, passing two values: 
  // The planet's rotation speed and the planet shape with accompaning texture
  sun = new Planets(0.006,0,0,planets[0]); 
  mars = new Planets(0.006,150,random(100,1000),planets[1]);
  venus = new Planets(0.006,300,random(100,1000),planets[2]);
  earth = new Planets(0.006,450,random(100,1000),planets[3]);
  mercury = new Planets(0.006,600,random(100,1000),planets[4]);
  jupiter = new Planets(0.006,750,random(100,1000),planets[5]);
  saturn = new Planets(0.006,900,random(100,1000),planets[6]);
  uranus = new Planets(0.006,1050,random(100,1000),planets[7]);
  neptune = new Planets(0.006,1200,random(100,1000),planets[8]);
  

}

void draw()
{
  background(0); //Space is super black !
  sun.shine();
  mars.create();
  venus.create();
  venus.create();
  earth.create();
  mercury.create();
  jupiter.create();
  saturn.create();
  uranus.create();
  neptune.create();
  
  keyPressed();
}

// Loading the data of the planets from csv file
void loadData(){
  
  data.clear();
  String[] lines = loadStrings("solarSystem.csv");

}

void keyPressed(){


   if (key == 'q'){
    planetIndex = 1;
    cam = new PeasyCam(this,mars.getX(),width/2,mars.getZ(),cameraDistance);
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