boolean mouseClick()
{
  boolean pressed = false;
  if(mousePressed && !pressed)
  {
    pressed = true;
    return true;
  }
  else if(!mousePressed)
    pressed = false;
  return false;
}

void setup()
{
  size(500,500);
}

void draw()
{
  new box(50, 50);
  new box(100,100);
  if(mouseClick())
  {
      
  }
}

class box {
  
  float x, y;
  
  box(int x, int y) {
    this.x = x;
    this.y = y;
    fill(0);
    rect(x,y, 100, 100);
  }
    
  void checkClick()
    {
    if(mouseClick() && mouseX >= x && mouseX <= x + 100 && mouseY >= y && mouseY <= y + 100)
      {
        print("box clicked");
      }
    }
}