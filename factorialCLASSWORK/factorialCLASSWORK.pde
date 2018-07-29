int size;
int amount;

void setup()
{
  int n = 6;
  println(n, fact1(n), fact2(n));
}

int fact1(int n)
{
  int result = 1;
  for(int c=2;c<=n;c++)
    result *= c;
  return result;
}

int fact2(int n)
{
  int result = 1;
  int c = 2;
  while(c<=n)
  {
    result *= c;
    c++;
  }
  return result;
}

//These functions are "functionaly eqivalent"