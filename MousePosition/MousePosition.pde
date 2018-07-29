boolean newCircle = false;

void setup()
{
  size(400,400);
  fill(50);
  
}

//mouse draws from top left
void draw()
{
  println(String.format("x: %s, y: %s", mouseX, mouseY));
  
  if(mousePressed && newCircle == false)
    ellipse(mouseX, mouseY, 20, 20);
    
  if(mousePressed && newCircle == true)
  {
    fill(50);
     ellipse(mouseX, mouseY, 20, 20);
  }
}