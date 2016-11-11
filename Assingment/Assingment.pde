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

PImage[] planetSurface = new PImage[4];
PShape[] planets = new PShape[numOfPlanets];

// Initialise a new camera. It's starting position delclared below
PeasyCam cam;
// Initialise each instance of the class Planet
Planets sun;

void setup ()
{

  size(1000,1000,P3D);
  noStroke();
  cam = new PeasyCam(this,width/2,height/2,600,0);

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
  sun = new Planets(0.05,planets[0]); 
  

}

void draw()
{
  background(0); //Space is super black !
  //planetEarth();
  //planetMars();
  //sun();
  sun.create();
}

// Method that pushes a 'Planet Earth' to a certain co-ordinate
void planetEarth()
{

  pushMatrix();
  translate(200,200,-500);
  rotateY(rotation);
  rotation = rotation + 0.025;
  shape(planets[2]);
  popMatrix();

}

// Method that pushes a 'Planet Mars' to a certain co-ordinate
void planetMars()
{
  pushMatrix();
  translate(800,200,-500);
  rotateY(rotation);
  rotation = rotation + 0.025;
  shape(planets[1]);
  popMatrix();

}

void sun()
{
  
  pushMatrix();
  translate(width/2,height/2);
  rotateY(-rotation);
  rotation = rotation + 0.006;
  shape(planets[0]);
  popMatrix();

}