class Prompt{
int i,j=0;
boolean line = false;


void end(){
  pushMatrix();
  translate(570,300);
  stroke(50,205,50);
  strokeWeight(8);
  line (width-10,height-10,width-35, height-80,1100,1000);
  popMatrix();
}
void activate()
  {

    
    
    pushMatrix();
    beginShape();
    stroke(50,205,50);
    strokeWeight(8);
    translate(0,-150,2000);
    line(25,height-60,5,height-5);
    translate(0,height-5);
    line(0,0,i,0);
    translate(25,-55);
    line(0,0,j,0);
     if (line == true)
     {
       //line (width-10,height-60,width-35, height -5);
     }
     if (i<width-10 && j < width - 45){i += 50; j += 50;}
     else{line = true;}
     endShape();
     popMatrix();

      
  }


}