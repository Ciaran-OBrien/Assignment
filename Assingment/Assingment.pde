/*
Student Name: Ciarán O'Brien
Student Number: C15765215
Processing code that creates an array of rotating 
planets.
*/

float rotation = 0;
int numOfPlanets = 2;

PImage earthPhoto,marsPhoto;
PShape[] planets = new PShape[numOfPlanets];

void setup ()
{

  size(1000,1000,P3D);
  // Load the images of the plantes and assign them
  // to variables of type PImage
  earthPhoto = loadImage("/images/planet1.jpg");
  marsPhoto = loadImage("/images/planet2.jpg");
  noStroke();
  
  // Create two planets of type SPHERE of typ PShape
  planets [0] = createShape(SPHERE,200);
  planets [0].setTexture(earthPhoto);
  
  planets [1] = createShape(SPHERE,200);
  planets [1].setTexture(marsPhoto);
  

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
  rotateY(mouseY);
  ///rotation = rotation + 0.025;
  shape(planets[0]);
  popMatrix();

}

// Method that pushes a 'Planet Mars' to a certain co-ordinate
void planetMars()
{
  pushMatrix();
  translate(800,200,-500);
  rotateY(mouseY);
  //rotation = rotation + 0.025;
  shape(planets[1]);
  popMatrix();

}