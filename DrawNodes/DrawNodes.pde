class Vector2
{
  float x,y;
  Vector2(float x, float y)
  {
    this.x = x;
    this.y = y;
  }
}

void setup()
{
  frameRate(6);
  size(500,500);
  background(155);
  pos1 = GetNewPos();
}
Vector2 pos1, pos2;
void draw()
{
   DrawNode(pos1);
   pos2 = GetNewPos();
   DrawLine(pos1,pos2);
   DrawNode(pos2);
   pos1 = pos2;
}

Vector2 GetNewPos()
{
  Vector2 pos = new Vector2(random(500), random(500));
  return pos;
}
void DrawNode(Vector2 pos)
{
  fill(5);
  stroke(0);
  ellipse(pos.x, pos.y, 20,20);
}
void DrawLine(Vector2 pos1, Vector2 pos2)
{
  fill(20);
  stroke(10);
  line(pos1.x, pos1.y, pos2.x, pos2.y);
}