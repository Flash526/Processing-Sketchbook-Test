void setup()
{
  size(500,500);
  background(255);
  stroke(0);
  fill(100);
  
  cube(100,100,25); // rect(100, 100, 25, 25);
  
  //cube(250,50,40);
  //cube(450,320,30);
  //cube(50, 330, 80);
}

void cube(float x, float y, float size)
{
  rect(x, y, size, size);
}