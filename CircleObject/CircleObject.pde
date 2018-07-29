
class Circle {
  int x;
  int y;
  int color;
  
  void setup()
  {
    ellipse(x,y,50,50);
  }
}

void setup()
{
  Circle c = new Circle();
  c.x = 5;
  c.y = 10;
}