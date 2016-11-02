/*
Student Name: Ciarán O'Brien
Student Number: C15765215
Processing code that creates an array of planes.
*/

float rotation = 0.000f;
int numOfPlanets = 3;

PImage[] planetSurface = new PImage[4];
PShape[] planets = new PShape[numOfPlanets];

void setup ()
{

  size(1000,1000,P3D);
  noStroke();

  for (int i = 0; i < numOfPlanets;i ++)
  {
    // Load the images of the planets to an array
    planetSurface[i] = loadImage("/images/planet" + i + ".jpg");
    // create an array of sphere shapes
    planets [i] = createShape(SPHERE,200);
    // set each planet image as a texture to the planet.
    planets [i].setTexture(planetSurface[i]);
  }

}

void draw()
{
  background(0); //Space is super black !
  planetEarth();
  planetMars();
  
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