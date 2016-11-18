/*
Escriba un procedimiento que calcule e imprima en pantalla todos los números
primos entre dos enteros positivos A y B cualesquiera.
*/
#include <stdio.h>

/*
Calcula si un entero es un numero primo. En caso afirmativo devuelve true
en caso contrario devuelve false
int a -> Numero a comprobar si es primo
*/
bool EsPrimo(int a){
  bool esPrimo = false;
  int count = 0;
  for(int i = 1; i <= a; i++){
    if(a % i == 0) count++;
  }
  if(count == 2){
    esPrimo = true;
  }
  return esPrimo;
}
/*
Imprime todos los numeros primos entre el rango a..b
int a -> Primer valor del rango de numeros
int b -> Ultimo valor del rango de numeros
*/
void Primos(int a, int b){
  for(int i = a; i <= b; i++){
    if(EsPrimo(i)){
      printf("%d\n", i);
    }
  }
}

int main(){
  int numero1, numero2;
  printf("Ingrese el primer numero: ");
  scanf("%d", &numero1);
  printf("Ingrese el segundo numero: ");
  scanf("%d", &numero2);
  Primos(numero1, numero2);
  return 0;
}
