class Credits{

float angC = 0.0;
PFont font;
float yC = height;
float zC = -200;
float xC = width/2;


  void roll(){
  
    textMode(MODEL);
    rotateX(PI/4);
  
    stroke(0);
    strokeWeight(5);
    directionalLight(250, 207, 63, 0, -200, -200);
  
    textAlign(CENTER);
  
    text("Solar System Model", xC, yC, zC);
    text("Programmer: Ciarán O'Brien", xC, yC+100, zC);
    text("Student Number: C15765215", xC, yC+150, zC);
    text("Lecturer: Brian Duggan", xC, yC+200, zC);
  
    yC--;
  
  }




}