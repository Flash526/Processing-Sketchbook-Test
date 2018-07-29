class Temp
{
  private float value;
  Temp(float v)
  {
    value = v;
  }
  
  void SetTempC(float c)
  {
    value = c;
  }
  
  void SetTempF(float f)
  {
    value = 5* (f - 32) /9;
  }
  
  float GetTempC()
  {
    return value;
  }
  
  float GetTempF()
  {
    return value * 9/5 + 32;
  }
}

void setup()
{
  Temp t = new Temp(20);
  
  println(t.GetTempF());
  t.SetTempF(100);
  println(t.GetTempF());
  
  //Can not change value via value = 5, as value is private
}