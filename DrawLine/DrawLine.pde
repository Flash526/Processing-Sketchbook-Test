void setup()
{
  size(1000,1000);
  background(70, 20, 180);
  stroke(0);
}
void draw()
{
  if(mousePressed)
  {
    line(50, 50, mouseX, mouseY);
  }
}