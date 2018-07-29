void setup()
{
  house(20,20);
  house(60,20);
}

void house(int x, int y)
{
  pushMatrix(); //Grabs current corr. system
  translate(x, y); //Moves base to pos x,y
  triangle(15, 0, 0, 15, 30, 15); //Draws the house
  rect(0, 15, 30, 30);
  rect(12, 30, 10, 15);
  popMatrix(); //End movement of new corr. system
}