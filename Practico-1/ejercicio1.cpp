/*
Ejercicio 1
Suponga que a los estudiantes de programación 2 se les dice que su calificación
final será el promedio de las cuatro calificaciones más altas de entre las
cinco que hayan obtenido en el curso.

(a) Escribir una función llamada PromClase con cinco parámetros de entrada
(las calificaciones obtenidas) y un parámetro de salida (la calificación
promedio), que realice dicho cálculo.

(b) Escribir un programa principal (main()) que permita ejecutar la función
PromClase. Dicho programa deberá leer de la entrada estándar (teclado) 5
calificaciones, invocar al procedimiento PromClase con dichos parámetros, y
finalmente mostrar en la salida estándar (pantalla) el resultado.
*/
#include <stdio.h>

int PromClase(int cal1, int cal2, int cal3, int cal4, int cal5){
  return (cal1 + cal2 + cal3 + cal4 + cal5) / 5;
};
int main(){
  int calificaciones[5];
  for(int i = 0; i < 5; i++){
    printf("Ingrese calificacion numero %d: ", i+1);
    scanf("%d", &calificaciones[i]);
  }
  int promClase = PromClase(calificaciones[0], calificaciones[1], calificaciones[2], calificaciones[3], calificaciones[4]);
  printf("Promedio de la clase: %d \n", promClase);
  return 0;
}
