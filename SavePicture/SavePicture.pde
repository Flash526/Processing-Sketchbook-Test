void setup()
{
  size(400,400);
  background(random(255), random(255), random(255));
  stroke(0);
}
void draw()
{
  
}

void mousePressed()
{
  saveFrame("output-####.png");
  println("saved png");
}