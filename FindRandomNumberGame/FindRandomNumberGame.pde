/*
  Find Random Number Game
  v1.0
  By Dominick Monaco
--------------------------------------------------------------------------

  Using the keys 1-9, Guess a number between 1 and 9. Program will randomly generate a number.
  If you guessed incorrectly, the program will tell you weather your guess was higher or lower than the correct number.
  If you guess incorrectly too many times, you will lose
  If you guess correctly, you win
  
  by pressing any key after you win/lose the game will reset.
*/

int chances = 3; //How many times the player can guess wrong before losing
int range = 9; //How high the random number goes
int startChances;
int num;
boolean pressed;
boolean gameOver = false; //Flag for if the game is over

void setup()
{
  size(500,500);
  startChances = chances;
  reset();
}

void draw()
{
  getInput();
  if(chances <= 0)
  {
    lose();
  }
}

//----------------------------------------------------------------------
// Display functions
//----------------------------------------------------------------------

void displayChances()
{
  background(255);
  textSize(20);
  fill(0);
  text("Current Chances: " + chances, 0,25);
}

//----------------------------------------------------------------------
// Calculation Functions
//----------------------------------------------------------------------

void getInput()
{
  if(keyPressed && !pressed && !gameOver)
  {
    pressed = true;
    int k = key;
    k -= 48; // -48 because of ascii
    checkNumber(k);
  }
  else if(keyPressed && !pressed && gameOver) {
    //Reset the game if gameOver = true
    reset(); 
  }
  
  if(!keyPressed)
    pressed = false;
}

void checkNumber(int k)
{
  textSize(30);
  fill(0);
  if(k < num)
  {
    chances--;
    displayChances();
    text("Number is Higher than " + k, 150,250);
  }
  else if (k > num)
  {
    chances--;
    displayChances();
    text("Number is Lower than " + k, 150, 250);
  }
  else if (k == num) {
    win();
  }  
  else {
    text("Something went wrong...", 250, 50); //Just in case something goes wrong when checking for a number
  }
}

//----------------------------------------------------------------------
//Post game functions
//----------------------------------------------------------------------
void win()
{
  background(0,255,0);
  fill(0);
  textSize(50);
  gameOver = true;
  text("You win!", 100,200);
  text("Number: " + num, 150, 250);
}

void lose()
{
  background(0);
  fill(255);
  textSize(50);
  gameOver = true;
  text("GameOver" , 80, 200);
  text("Number was: " + num, 100, 250);
}

void reset() //Remakes the game by reseting the chances, and generating a new number
{
  gameOver = false;
  background(255);
  chances = startChances;
  num = (int)random(range) + 1; // Added one because random() starts at 0
  displayChances();
  pressed = true; //So the game does not guess a number from the key they pressed to reset
  text("Guess a number!", 150,250);
}