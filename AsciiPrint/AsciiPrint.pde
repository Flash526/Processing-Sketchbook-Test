
///http://www.asciitable.com/
void setup()
{
  char c = 'a';
  int num = 65;
  //c++;
  println((int)c);
  println((char)num);
  
  for(int i = 0; i <= 127; i++)
  {
    println(String.format("Char: %s, Int: %s",(char)i, i));
  }
}