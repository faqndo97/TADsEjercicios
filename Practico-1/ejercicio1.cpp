/*
Escribir una función llamada PromClase con cinco parámetros de entrada (las
calificaciones obtenidas) y un parámetro de salida (la calificación promedio),
que realice dicho cálculo
*/
#include <stdio.h>

int PromClase(int cal1, int cal2, int cal3, int cal4, int cal5){
  return (cal1 + cal2 + cal3 + cal4 + cal5) / 5;
};
int main(){
  int promClase = PromClase(12,10,8,7,3);
  printf("Resultado: %d \n", promClase);
  return 0;
}
