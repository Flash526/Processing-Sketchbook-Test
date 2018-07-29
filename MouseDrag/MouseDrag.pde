void setup()
{
  size(1000,800);
  background(255);
  fill(0);
  
  ellipse(500, 400, 100, 100);
}
void draw()
{
  if(true)
  {
    fill(255, 255, 255);
    
    fill(random(255), random(255), random(255));
    //background(255);
    ellipse(random(1000),random(800), 100, 100);
  }
}

void mousePressed()
{
  saveFrame("output-####.png");
}