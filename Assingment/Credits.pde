class Credits{

float angC = 0.0;
PFont font;
float yC = height + 900;
float zC = -200;
float xC = width/2;


  void roll(){
    textSize(80);
    textMode(MODEL);
    rotateX(PI/4);
  
    stroke(0);
    strokeWeight(5);
    directionalLight(250, 207, 63, 0, -200, -200);
  
    textAlign(CENTER);
  
    text("Solar System Model", xC, yC, zC);
    text("Programmer: Ciarán O'Brien", xC, yC+100, zC);
    text("Student Number: C15765215", xC, yC+250, zC);
    text("Lecturer: Brian Duggan", xC, yC+400, zC);
  
    yC-=15;
  
  }




}