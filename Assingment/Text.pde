class Text{
  int textPadding = 890;
  String ask = "Please start typing the name of the planet";


  void display()
  {
    
    myFont = createFont("FFScala", 32);
    textFont(myFont);
    textAlign(CENTER);
    fill(255);
    textSize(100);
    fill(255, 0, 0);
    text(currentInput, width/2, height+textPadding);
  }

  void askUser()
  {

      fill(255);
      textSize(100);
      fill(255, 0, 0);
      text(ask, width/2, height+textPadding);
  }
    

    
    
}