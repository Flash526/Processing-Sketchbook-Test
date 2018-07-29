//typing demo

String typing = "";
String saved = "";

void setup()
{
  size(400,400);
}

void draw()
{
  background(255);
  textSize(20);
  fill(0);
  noStroke();
  text(typing, 50, 50);
  text(saved, 50, 150);
}

void keyPressed()
{
  if(key == '\n')
  {
    saved = typing;
    typing = "";
  }
  else
    typing += key;
}
  