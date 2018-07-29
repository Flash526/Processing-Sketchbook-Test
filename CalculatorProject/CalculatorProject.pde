/**
Calculator
cool cool
*/

enum Mode { add, subtract }
Mode currMode;

int ansBoxPosX = 10;
int ansBoxPosY = 10;
String queue = "";
float storedQueue = 0;
float answer = 150;

String display = queue;

boolean clicked = false;
boolean done = false;
boolean modeSet = false;

Button[] buttons = new Button[14];

class Button
{
  int xPos;
  int yPos;
  int xSize;
  int ySize;
  
  char keyButton;
  
  Button(int xPos, int yPos, int xSize, char keyButton)
  {
    this.xPos = xPos;
    this.yPos = yPos;
    this.xSize = xSize;
    this.ySize = xSize;
    this.keyButton = keyButton;
    
    DrawButton();
  }
  
  Button(int xPos, int yPos, int xSize, int ySize, char keyButton)
  {
    this.xPos = xPos;
    this.yPos = yPos;
    this.xSize = xSize;
    this.ySize = ySize;
    this.keyButton = keyButton;
    
    DrawButton();
  }
  
  void DrawButton()
  {
    fill(255);
    rect(xPos, yPos, xSize, ySize);
    fill(0);
    textSize(16);
    text(keyButton, xPos + (xSize/2), yPos + (ySize/2));
    println("New Button at " +xPos);
  }
  
  void CheckClick()
  {
    //println("clicked " + keyButton);
    if((mouseX >= xPos && mouseX <= xSize + xPos) && (mouseY >= yPos && mouseY <= ySize +yPos))
    {
      println("clicked " + keyButton);

      switch(keyButton)
      {
        case '+':
          SetAdd();
          modeSet = true;
          return;
        case '-':
          SetSubtract();
          modeSet = true;
          return;
        case 'c':
          Clear();
          return;
        case '=':
          GetAnswer();
          return;
      }
      if(modeSet)
      {
        if(done)
        {
          println("clearing done");
          Clear();
          done = false;
        }
        display += keyButton;
        storedQueue += float(queue);
        queue = "";
        modeSet = false;
      }
      queue += keyButton;
      println(queue);
      display = queue;

    }
   }
}

void SetAdd()
{
    currMode = Mode.add;
    display = "+";
    if(done)
    {
      answer = storedQueue;
      done = false;
    }
}

void SetSubtract()
{
    currMode = Mode.subtract;
    display = "-";
    if(done)
    {
      answer = storedQueue;
      done = false;
    }
  
}
void Clear()
{
    println("Clearing");
    storedQueue = 0;
    queue = "";
    display = "";
}

void GetAnswer()
{
  println(storedQueue);
  println(queue);
  if(currMode != null) {
    switch(currMode)
    {
      case add:
        answer = storedQueue + float(queue);
        break;
      case subtract:
        answer = storedQueue - float(queue);
        break;
    }
    display = str(answer);
    done = true;
    currMode = null;
  }
}

void setup()
{
  size(400,500);
  initButtons();
}

void draw()
{
  fill(255);
  rect(ansBoxPosX,ansBoxPosY,380,150);
  textSize(20);
  fill(0);
  text(display, ansBoxPosX + 10, ansBoxPosY + 25);
  
  if(mousePressed && !clicked)
  {
    clicked = true;
    for(int i = 0; i < buttons.length; i++)
    {
      buttons[i].CheckClick();  
    }
  }
    else if (!mousePressed)
      clicked = false;
  
  //println(String.format("Mouse X: %s, Y:%s", mouseX, mouseY));
}

void initButtons()
{
  int keyPadX = 25;
  int keyPadY = 175;
  int keySize = 80;
  buttons[0] =  new Button(keyPadX + (0 * keySize), keyPadY + (0 * keySize), keySize,'1');
  buttons[1] =  new Button(keyPadX + (1 * keySize), keyPadY + (0 * keySize), keySize,'2');
  buttons[2] =  new Button(keyPadX + (2 * keySize), keyPadY + (0 * keySize), keySize,'3');
  buttons[3] =  new Button(keyPadX + (0 * keySize), keyPadY + (1 * keySize), keySize,'4');
  buttons[4] =  new Button(keyPadX + (1 * keySize), keyPadY + (1 * keySize), keySize,'5');
  buttons[5] =  new Button(keyPadX + (2 * keySize), keyPadY + (1 * keySize), keySize,'6');
  buttons[6] =  new Button(keyPadX + (0 * keySize), keyPadY + (2 * keySize), keySize,'7');
  buttons[7] =  new Button(keyPadX + (1 * keySize), keyPadY + (2 * keySize), keySize,'8');
  buttons[8] =  new Button(keyPadX + (2 * keySize), keyPadY + (2 * keySize), keySize,'9');
  buttons[9] =  new Button(keyPadX + (0 * keySize), keyPadY + (3 * keySize), keySize * 3, keySize,'0');
  buttons[10] = new Button(keyPadX + (3 * keySize), keyPadY + (0 * keySize), keySize,'c');
  buttons[11] = new Button(keyPadX + (3 * keySize), keyPadY + (1 * keySize), keySize,'+');
  buttons[12] = new Button(keyPadX + (3 * keySize), keyPadY + (2 * keySize), keySize,'-');
  buttons[13] = new Button(keyPadX + (3 * keySize), keyPadY + (3 * keySize), keySize,'=');
}