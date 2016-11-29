# Assignment

   Objected Oriented Programming assignment

## Outline
+ Brief
+ Sample Planets


### Brief
[Brian's Github Assignment](https://github.com/skooter500/OOP-2016-2017/blob/master/docs/assignments.md)
Outlined in the brief are the requirements for the assignment.

I took the brief and went with a solar system planet UI, where the user may enter their selected planet name, and they will see the planet's details and then have the option to ,click to go.

Below are som sample codes of what I found either difficult, and/or, interesting to code.

### Sample Code

```java
void create(){
     pushMatrix();
     float t = millis()/planetOrbitSpeed;
     planetPosX = (cx+rotationRadius*cos(t));
     planetPosY = (cy+rotationRadius*sin(t));
     planetPosZ = (cz+rotationRadius*sin(t));  
     translate(planetPosX,cy,planetPosZ);
     rotateY(rotation);
     rotation = rotation + planetRotation;
     shape(planet);
     popMatrix();
     }
     
```

Here I am moving the position of the planets bsaed ona  cos and sin ratio. I understand that planets do actually move on an eeliptical path, but chose to stick with a circular path for eas of view.

```java

  for (int i = 0; i < numOfPlanets;i ++){
    // Load the images of the planets to an array
    planetSurface[i] = loadImage("/images/planet" + i + ".jpg");
    // create an array of sphere shapes
    planets [i] = createShape(SPHERE,50);
    // set each planet image as a texture to the planet.
    planets [i].setTexture(planetSurface[i]);
  }
```

This for loop is where all the planets are created and I do so from matching arrays. Each index of the array matches to a specific planet. This is commen across each of the arrays.

```java
void keyPressed(){

  if(key == ENTER){
    currentInput = "";
    cam = new PeasyCam(this,width/2,height/2-200,3000,0);
    for (int i =0;i < numOfPlanets; i++){
     planets[i].setVisible(true);
    }
  }
  else if(key == BACKSPACE && currentInput.length() > 0){
    currentInput = currentInput.substring(0, currentInput.length() - 1);
    cam = new PeasyCam(this,width/2,height/2-200,3000,0); 
}
  else if (keyCode >= 65 && keyCode <=90){
    currentInput = currentInput + key;
    cam = new PeasyCam(this,width/2,height/2-200,3000,0);
  }

}
```

As with keyPressed() in Processing, it is always checking for a character input. This was awkward to use, as I am asking a user to enter in a string value. My work around this was to store each new character keyCode in a string array and use that as the uer's input.


```java
void displayDetails(float x, float y, float radius, int npoints){
   translate(0,0,-300);
   float angle = TWO_PI / npoints;
   int count = 0;
   for (float a = 0; a < TWO_PI; a += angle) {
     sx[count] = x + cos(a) * radius;
     sy[count] = y + sin(a) * radius;
     detailText = createFont("ARCADE",40);
     textFont(detailText); 

```

The displayDetails() method is essentially the star method we built in lab1. I used this for ease of coding, and as a way to space out the plane details text. However, the switch method I use (not shown), isn't the most memory effective.

### Youtube Video Demo

[![Demo Video](http://img.youtube.com/vi/H5DXonF7M40/0.jpg)](https://youtu.be/H5DXonF7M40 "Demo Video")

### Sources
[Planet deatails](https://www.msnucleus.org/membership/html/k-6/uc/solar_system/2/ucss2_1a.html)
