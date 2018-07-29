float G = 9.81; //Gravity
float A = 0; //Acceleration
float V = 0; //Velocity
float H = 0; //Height
float dT = .03; //Time step

void setup()
{
  size(500,500);
}
void draw()
{
  if(A < 2400)
  {
  A += G;
  V += dT * A;
  H += dT * V;
  if(H >= 490)
    {
      V = -V;
    }
  }

  if(A >= 2400)
  {
    H = 490;
  }
  //if(H <= 500)
  //  H = 500;
  
  background(255);
  ellipse(240, H, 20, 20);
  printValues();
}

void printValues()
{
  println("------");
  println("A: " + A);
  println("V: " + V);
  println("H: " + H);
}