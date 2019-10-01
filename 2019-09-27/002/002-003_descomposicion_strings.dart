void main () {
  String string = 'hola';
  Separate(string);
  print(string);
}

void Separate(String string)
{
  String newString;
  for(int i = 0; i < string.length; ++i)
  {
    newString += string[i];
    newString += ' ';
  }
  string = newString;
}