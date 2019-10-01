void main (){

}

bool esPrimer(int n)
{
  for (int d = 2; d * d <= n; d++){
    if(n % d == 0) return false;
  } 
  return n > 1;
}