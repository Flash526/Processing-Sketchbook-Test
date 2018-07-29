int grade = 3;
String[] supplies = new String[0];

void setup()
{
  size(300,300);
  background(255,255,160);
  switch(grade)
  {
    case 3:
      supplies = append(supplies, "Ballpoint Pen");
    
    case 2:
      supplies = append(supplies, "Sharpened pencils");
      supplies = append(supplies, "Eraser");
    
    case 1:
      supplies = append(supplies, "Crayons");
      supplies = append(supplies, "Notebook");
      break;
      
    default:
      supplies = append(supplies, "Cannot find supplies!");
  }
  
  fill(0);
  textSize(30);
  text("Supplies to get! \nGrade: " + grade, 25, 35);
  textSize(24);
  for(int i = 0; i < supplies.length; i++)
  {
    text(supplies[i], 25 , 150 + 30 * i);
  }
}