
size(200,200);
background(255,255,200);
fill(0);

println("\"wow\" he said");

String[] lines = loadStrings("file.txt");
//Excel format: data.csv //

for(int i = 0; i < lines.length; i++)
{
  text(lines[i], 10, 10 * i + 20);
}

//printArray(lines);