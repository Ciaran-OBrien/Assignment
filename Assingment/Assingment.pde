import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;



/*
Student Name: Ciarán O'Brien
Student Number: C15765215
Processing code that creates an array of planes.
*/

float rotation = 0.000f;
int numOfPlanets = 3;



ArrayList<PlanetData> data = new ArrayList<PlanetData>();

PImage[] planetSurface = new PImage[4];
PShape[] planets = new PShape[numOfPlanets];
float[] planetSize = new float[numOfPlanets];

// Initialise a new camera. It's starting position delclared below
PeasyCam cam;
// Initialise each instance of the class Planet
Planets sun,mars,earth;

void setup ()
{

  size(1000,1000,P3D);
  noStroke();
  cam = new PeasyCam(this,width/2,height/2,1500,0);

  for (int i = 0; i < numOfPlanets;i ++)
  {
    // Load the images of the planets to an array
    planetSurface[i] = loadImage("/images/planet" + i + ".jpg");
    // create an array of sphere shapes
    planets [i] = createShape(SPHERE,200);
    // set each planet image as a texture to the planet.
    planets [i].setTexture(planetSurface[i]);
  }
  
  // Create a new class object, passing two values: 
  // The planet's rotation speed and the planet shape with accompaning texture
  sun = new Planets(0.006,0,planets[0]); 
  mars = new Planets(0.006,600,planets[1]);
  earth = new Planets(0.006,1200,planets[2]);
  

}

void draw()
{
  background(0); //Space is super black !
  //planetEarth();
  //planetMars();
  //sun();
  sun.shine();
  mars.create();
  earth.create();
}

// Loading the data of the planets from csv file
void loadData(){
  
  data.clear();
  String[] lines = loadStrings("solarSystem.csv");

}