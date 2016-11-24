class Text {
  int textPadding = 890;
  void display()
  {
    fill(255);
    textSize(100);
    //text(lastInput,width/2,height/2);
    fill(255, 0, 0);
    text(currentInput, width/2, height+textPadding);
  }
}