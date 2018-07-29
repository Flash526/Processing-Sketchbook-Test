 //HW ADD HORIZONTAL BOUNCE
//text()
float xSpeed = 5.5; //The speed the ball moves across the screen horizontally
float ySpeed = .01; //The speed the ball moves across the screen vertically
float bounceHeight = 420; //How high the ball bounces

boolean flip;
float x, T, H;

void setup()
{
  size(500,500);
}
void draw()
{
  T += ySpeed;
  H = 475-abs(sin(T*2*PI) * bounceHeight);
  
  if(x <= 10)
    flip = false;
  else if(x >= 490)
    flip = true;
  
  if(flip)
    x -= xSpeed;
  else
    x += xSpeed;
    
  background(200);
  fill(0);
  ellipse(x,H,50,50);
  println(x);
}