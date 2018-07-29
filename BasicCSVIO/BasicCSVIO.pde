String[] data;

void setup()
{
  size(200,200);
  data = loadStrings("data.csv");
  data = split(data[0], ",");
  
}

void draw()
{
  background(255);
  stroke(0);
  for(int i = 0; i < data.length; i++)
  {
    rect(i*20, 200-int(data[i]), 20, int(data[i]));
  }
  noLoop();
}