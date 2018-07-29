void setup()
{
  size(1000,800);
  background(255);
  fill(0);
  
  ellipse(500, 400, 100, 100);
}
void draw()
{
  if(mousePressed)
  {
    fill(random(255), random(255), random(255));
    background(255);
    ellipse(mouseX,mouseY, 100, 100);
  }
}