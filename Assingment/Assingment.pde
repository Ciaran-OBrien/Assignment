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

float sx [] = new float [6];
float sy [] = new float [6];

String currentInput = new String();
PFont myFont,detailText; 
String planetsMars = "mars";
String planetNames [] = {"sun","mars","venus","earth","mercury","jupiter","saturn","uranus","neptune"};

boolean stringCheck = false;

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

// Initialise a new object of type prompt
// a method within the class will be called to display the prompt 
Prompt newLine;

Text userText;

Details allDetails;


void setup (){

  //fullScreen(P3D);
  size(1000,1000,P3D);
  frameRate(60);
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
  currentInput = "";
  
  newLine = new Prompt();
  userText = new Text();
  
  
  allDetails = new Details();

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
  
  
  //newLine.test();
      //stroke(50,205,50);
    //strokeWeight(8);
  //line (width-10,height-60,width-35, height -5,100,100);

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
    
    cam = new PeasyCam(this,classPlanets[0].getX(),classPlanets[0].getY()-200,3000,0);

  }


}

void check(){

  for (int i = 0;i< numOfPlanets;i++){
    if(currentInput.equals(planetNames[i]) == true){
         background(0);
         planetIndex = i;
         classPlanets[planetIndex].shine();
         cam = new PeasyCam(this,classPlanets[planetIndex].getX(), classPlanets[planetIndex].getY(),classPlanets[planetIndex].getZ(),cameraDistance);
         displayDetails(width/2, height/2, 450, 5);
      }

  }



  //if (currentInput != "")
  //{
  //  stringCheck = true;
  //}
  
}
  
  //String [] planetDetails = {"Earth","Explored","Develop","8.6 Parsecs","7 Million"};
  
  String planetName = "Earth";
  String planetStatus = "Explored";
  String planetDiscription = "Developing liveform curretnly occupies the planet";
  String planetDistanceDetail = "8.6 parsecs";
  String planetInhabitants = "7 Million";

void displayDetails(float x, float y, float radius, int npoints){
    translate(0,0,-300);
    int count = 0;
    float shake = 0.001f;
    float b = 0;
    float angle = TWO_PI / npoints;
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