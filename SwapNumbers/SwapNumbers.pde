int var1, var2;

void setup()
{
  var1 = 5;
  var2 = 8;
  
  println(String.format("Before: Var1: %s, Var2: %s", var1,var2));
  
  int tmp = var1;
  var1 = var2;
  var2 = tmp;
  
  println(String.format("After:  Var1: %s, Var2: %s", var1,var2));
  
}