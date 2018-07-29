String s = " ";
char k;
boolean pressed = false;

void setup()
{
  size(500,500);
}

void draw()
{
  background(255);
  if(keyPressed && pressed == false)
  {
    k = key;
    s += k;
    pressed = true;
  }
  if(!keyPressed || key != k)
    pressed = false;
    
  textSize(36);
  fill(0);
  text(s, 0,50);
}