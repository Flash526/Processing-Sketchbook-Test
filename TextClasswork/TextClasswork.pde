//TEAM E

int ht = 32; //Height
float score = 5;
int maxScore = 100;

void setup()
{
  size(500,500);
  background(128,255,255);
  frameRate(2);
}

void draw()
{
  background(128,255,255);
  drawText();
  score++;
}

void drawText()
{
  fill(255);
  rect(0,0,400,ht);
  fill(20);
  textSize(ht); 
  
  if(score >= maxScore)
    text("You win!",0,ht);
  else
    text("Score: " + score, 0, ht);
}