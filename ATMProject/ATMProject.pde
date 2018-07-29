//ATM program :)


class Account
{
  public String name;
  private float balance;
  
  public Account(String name)
  {
    
  }
  
  public void Deposit(float amount)
  {
    
  }
  
  public float Withdraw(float amount)
  {
    if(amount > balance)
    {
      println("Balance too low!");
      return 0f;
    }
    else
    {
      balance -= amount;
      return amount;
    }
  }
  
  public void Transfer(Account a, float amount)
  {
    
  }
}