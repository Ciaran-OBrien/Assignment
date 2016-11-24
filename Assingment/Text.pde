class Text {
  int textPadding = 890;
  boolean check;
  String ask = "Please start typing the name of the planet";

  Text(boolean c)
  {
    check = c;
  }

  void display()
  {
    fill(255);
    textSize(100);
    //text(lastInput,width/2,height/2);
    fill(255, 0, 0);
    text(currentInput, width/2, height+textPadding);
  }

  void askUser()
  {
    if (check == false)
    {
      fill(255);
      textSize(100);
      fill(255, 0, 0);
      text(ask, width/2, height+textPadding);
    }

  }
}