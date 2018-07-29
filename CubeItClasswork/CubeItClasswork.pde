int value = 5;

void setup()
{
  size(300,150);
  background(0);
  textSize(36);
  
  text("Base Value: " + value, 0, 30);
  int temp = value; //Store base value temporarly
  
  value = cubeIt1(value);
  text("CubeIt1: " + value, 0, 65);
  
  value = temp; //Reset back to base value
  
  value = cubeIt2(value);
  text("CubeIt2: " + value, 0, 100);
}

int cubeIt1(int x)
{
  int result;
  result = x*x*x;
  return result;
}

int cubeIt2(int x)
{
  int result;
  result = x;
  result = x * result;
  result = x * result;
  return result;
}