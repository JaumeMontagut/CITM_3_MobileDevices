void main (){
  funcionExterna();
}

void funcionExterna() {
  int i = 0;
  funcionInterna()
  {
    return i + 1;
  }
  i = 5;
  print(funcionInterna());
}
