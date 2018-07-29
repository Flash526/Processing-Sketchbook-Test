//ATM program
//Purpose: Simulate creating banking accounts, deposits, withdraws, and transfers.
//Dominick Monaco
//12/3/17
//
//The program initalizes with a premade account, 
//    Test1. The pin for this account is 1250.

class Account
{
  public String name;
  private int balance;
  private String pin;
  
  public Account(String name, String pin)
  {
    this.name = name;
    this.pin = pin;
  }
  
  public void Deposit(int amount)
  {
    balance += amount;
  }
  
  public void Withdraw(int amount)
  {
      balance -= amount;
  }
  
  public void Transfer(Account a, int amount)
  {
    a.Deposit(amount);
    Withdraw(amount);
  }
}

enum Screen {select, pin, account, deposit, withdraw, transfer1, transfer2, newAcc1, newAcc2}
Screen currScreen = Screen.select;
Account[] act = new Account[5];
Account currAccount = act[0];
Account transAccount;
String userPin = "";
boolean initPin = true;
int clicks;
int accNum = 0;
String amount = "";
boolean pressed;
String display = "";

void setup()
{
  size(450,450);
  textSize(18);
  InitPin();
  Account newAcc1ount = new Account("Test1", "1250");
  newAcc1ount.Deposit(5);
  act[0] = newAcc1ount;
}

void draw()
{
  background(255);
   if(!keyPressed)
      pressed = false;
  
  switch(currScreen)
  {
    case select:
      text("Press key number next to account to select", 25, 25);
      for(int i = 0; i < act.length; i++){
        fill(0);
        if(act[i] != null)
          text(i+1 + ": " + act[i].name, 50, 150 + 25 * i);
        else
          text(i+1 + ": No Account", 50, 150 + 25 * i);
      }
      
      if(keyPressed && key > 48 && key <= act.length + 48 && !pressed){
        if(act[key - 49] != null) {
          pressed = true;
          currAccount = act[key - 49];
          currScreen = Screen.pin;
          initPin = true;
        }
        else {
          accNum = key - 49;
          pressed = true;
          currScreen = Screen.newAcc1;
        }
      }
      break;
      
    case pin:
      fill(0);
      text("Please enter pin. Press z to exit.", 25, 25);
      text(display, 100, 50);
      if(initPin)
        InitPin();
      
      //Get Input
      if(clicks < 4)
      {
        if(keyPressed && !pressed)
        {
          pressed = true;
          if(key == 'z')
          {
            InitPin();
            currScreen = Screen.select;
            display = "";
          }
          else
            userPin += key;
            
          display = userPin;
          clicks++;
        }
      }
      //Check to see if pin is right
      else
      {   
        String a = userPin;
        String b = currAccount.pin;
        for(int i = 0; i < 4; i++)
          if(a.equals(b))
          {
            //Correct Pin
            InitPin();
            display = "";
            currScreen = Screen.account;

          }
          else
          {
            //Incorrect pin
            //Reset
            InitPin();
            display = "Incorrect!";
          }
        }
      break;
    case account:
      text("Current balance: " + currAccount.balance, 25, 50);
      text("Options: \n 1: Deposit \n 2: Withdraw \n 3: Transfer \n 4: Exit", 50, 100);
      if(keyPressed && !pressed)
      {
        switch(key)
        {
          case '1':
            currScreen = Screen.deposit;
            pressed = true;
            break;
          case '2':
            currScreen = Screen.withdraw;
            pressed = true;
            break;
          case '3':
            currScreen = Screen.transfer1;
            pressed = true;
            break;
          case '4':
            currAccount = null;
            currScreen = Screen.select;
            pressed = true;
            break;
        }
      }
      break;
    case deposit:
      text("How much would you like to deposit? \nPress enter to deposit, Press z to exit", 25, 50);
      text(amount, 50, 150);
      if(keyPressed && !pressed && key >= 48 && key <= 57){
        amount += key;
        pressed = true;
        }
      else if(keyPressed && !pressed && key == '\n')
        {
          if(amount != "")
            currAccount.Deposit(Integer.parseInt(amount));
          amount = "";
          currScreen = Screen.account;
        }
        else if(keyPressed && !pressed && key == 'z')
        {
          amount = "";
          currScreen = Screen.account;
        }
      break;
      
      case withdraw:
        text("How much would you like to withdraw? \nPress enter to withdraw, Press z to exit", 50, 50);
        text(amount, 25, 150);
        text(display, 25, 200);
        if(keyPressed && !pressed && key >= 48 && key <= 57){
          amount += key;
          pressed = true;
          }
         else if(keyPressed && !pressed && key == '\n')
          {
            if(amount != "" && currAccount.balance >= Integer.parseInt(amount)) {
              currAccount.Withdraw(Integer.parseInt(amount));
              amount = "";
              display = "";
              currScreen = Screen.account;
            }
            else{
              display = "Not enough!";
              amount = "";
            }
              
          }
          else if(keyPressed && !pressed && key == 'z')
          {
            amount = "";
            display = "";
            currScreen = Screen.account;
          }
      break;
      case transfer1:
        //if(key == '\n')
        text("Press key number next to account \nto select, then hit enter.", 25, 25);
        if(transAccount != null) {
          text("Transfer Account: " + transAccount.name, 25, 125);
          if(keyPressed && !pressed && key == '\n')
          {
            pressed = true;
            currScreen = Screen.transfer2;
          }
        } 
          
        for(int i = 0; i < act.length; i++){ //Display
          fill(0);
          if(act[i] != null)
            text(i+1 + ": Account " + i + " " + act[i].name, 50, 200 + 25 * i);
          else
            text(i+1 + ": Account " + i + " No Account", 50, 200 + 25 * i);
          }
        if(keyPressed && key > 48 && key <= act.length + 48 && !pressed){
          pressed = true;
          transAccount = act[key - 49];
        }
        if(keyPressed && !pressed && key == 'z')
          {
            transAccount = null;
            currScreen = Screen.account;
          }
        break;
      case transfer2:
        text("How much would you like to transfer? \nPress enter to transfer, Press z to exit", 25, 50);
        text(amount, 50, 150);
        text(display, 50, 200);
        if(keyPressed && !pressed && key >= 48 && key <= 57){
          amount += key;
          pressed = true;
          }
         else if(keyPressed && !pressed && key == '\n')
          {
            if(amount != "" && currAccount.balance >= Integer.parseInt(amount)) {
              currAccount.Transfer(transAccount, Integer.parseInt(amount));
              amount = "";
              display = "";
              transAccount = null;
              currScreen = Screen.account;
            }
            else{
              display = "Not enough!";
              amount = "";
            }
          }
          else if(keyPressed && !pressed && key == 'z')
          {
            amount = "";
            currScreen = Screen.account;
          }
        break;
      case newAcc1:
      text("Enter name of account, then press enter.", 25, 100);
      text(display, 25, 200);
        if(keyPressed && !pressed && key != '\n')
        {
          pressed = true;
          display += key;
        }
        else if(keyPressed && !pressed && key == '\n')
        {
          pressed = true;
          InitPin();
          currScreen = Screen.newAcc2;
          
        }
         break;
      case newAcc2:
        text("Enter a pin for the account, then press enter. \nPress z to exit. \nPress r to reset pin", 25, 100);
        text(userPin, 25,200);
      if(clicks < 4)
      {
        if(keyPressed && !pressed)
        {
          pressed = true;
          userPin += key;
          clicks++;
        }
      }
      if(clicks >= 4 && keyPressed && !pressed && key =='\n')
      {
        act[accNum] = new Account(display, userPin);
        userPin = "";
        display = "";
        currScreen = Screen.select;
      }
      if(keyPressed && !pressed && key == 'r')
      {
        pressed = true;
        InitPin();
      }
      
        if(keyPressed && !pressed && key == 'z')
        {
          pressed = true;
          display = "";
          currScreen = Screen.select;
        }
        break;
    default:
      break;
  }
}

void InitPin()
{
  //Reset
  clicks = 0;
  userPin = "";
  initPin = false;
}