String letters = "abcdefghi";
String searchFor = "g";

int index = letters.indexOf(searchFor);
String sub = letters.substring(3,6);

if(index != -1)
  println(index);
else
  println("index not found");

println(letters);
println(sub);