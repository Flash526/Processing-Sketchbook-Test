//TODO make bounce wink wink
int x[] = {30,170,400,80,350};
int y[] = {210,90,300,100,10};
double dX[] = {1,1,-1,-1,1};
double dY[] = {1,1,-1,1,-1};

int speed = 10;
void setup()
{
  size(500,500);
}

void draw()
{
  background(100);
  for(int i = 0; i < 5; i++) {
    ellipse(x[i], y[i], 50,50);
    
   //Normal bounce
    //if(x[i] < 25)
    //  dX[i] = 1;
    //else if(x[i] > 475)
    //  dX[i] = -1;
    //if(y[i] < 25)
    //  dY[i] = 1;
    //else if(y[i] > 475)
    //  dY[i] = -1;
      
     //vvvv spicy bounce
    if(x[i] < 25)
      dX[i] = random(.3, 1.7);
    else if(x[i] > 475)
      dX[i] = random(-.3, -1.7);
    if(y[i] < 25)
      dY[i] = random(.3,1.7);
    else if(y[i] > 475)
      dY[i] = random(-.3,-1.7);  
      
    x[i] += dX[i] * speed;
    y[i] += dY[i] * speed;
  }
}