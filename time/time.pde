int currTime;
int timeSet;

void setup()
{
  size(500,500);
}

void draw()
{
  background(255,0,0);
  
  currTime = millis();
  
  if(key == 'a')
  {
    timeSet = millis() + 5000;
  }
  
  if(currTime >= timeSet)
   {
     background(0,255,0);
   }
   else
     background(255,0,0);
     
  textSize(26);
  text(currTime + "  " + timeSet,100,100);
}