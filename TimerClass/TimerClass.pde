//Stopwatch

Stopwatch s;
class Stopwatch
{
  boolean running;
  boolean paused;
  int startTime;
  int pauseTime; //
  //float pausedStartTime; //Time when timer is paused in Millisecond
  
  public void Start()
  {
    if(!running && !paused)
    {
      println("Timer Started");
      startTime = millis();
      running = true;
    }
    else if(paused)
    {
      println("Timer is paused.");
    }
    else
    {
      println("Timer already started!");
    }
  }
  public void Reset()
  {
    println("Reset");
    startTime = 0;
    running = false;
    paused = false;
  }
  
  public void Pause()
  {
    println("Paused");
    pauseTime = millis();
    running = false;
    paused = true;
  }
  
  public void Resume()
  {
    if(paused)
    {
      float duration = millis() - pauseTime;
      println("Resumed after " + duration/1000);
      startTime += duration;
      pauseTime = 0;
      running = true;
      paused = false;
    }
  }
  
  public float getTime()
  {
    if(running)
    {
      float mSec = millis() - startTime;
      float sec = mSec / 1000;
      return sec;
    }
    else if(paused)
    {
      float startPauseTime = pauseTime - startTime;
      return startPauseTime/1000;
    }
    else
      return -1f;
  }
}

void setup()
{
  s = new Stopwatch();
}

void draw()
{}

//Debug controls: S to start, r to Reset, p to Pause, o to Resume, any other key to getTime.
void keyPressed()
{
  switch(key)
  {
    case 's':
        s.Start();
      break;
    case 'r':
      s.Reset();
      break;
    case 'p':
      s.Pause();
      break;
    case 'o':
      s.Resume();
      break;
    default:
    if(s.getTime() != -1)
      println(s.getTime());
    else
      println("Timer not started!");
  }
}