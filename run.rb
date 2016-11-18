require 'fileutils'
require 'colorize'

# Compilar el programa
# pro -> Nombre del Programa
def Compilar(pro)
  puts '*****Compilacion*****'.green
  system 'g++ ' + pro + '.cpp -o ' + pro
  resultadoDeCompilacion =  $?.success?
  puts '*****Fin Compilacion*****'.green
  return resultadoDeCompilacion
end

# Ejecutar el programa
# pro -> Nombre del Programa
def Ejecutar(pro)
  puts '*****Ejecucion*****'.green
  system './' + pro
  puts '*****Fin Ejecucion*****'.green
end

# Verificar si existe la carpeta de ejecutables, en caso afirmativo no hace
# nada, en caso contratio crea dicha carpeta
def CarpetaEjecutables()
  if !Dir.exist?('ejecutables')
    Dir.mkdir('ejecutables')
  end
end

# Mueve el ejecutable del programa a la carpeta de ejecutables
# dir -> Directorio actual
# program -> Nombre del ejecutable
def MoverEjecutable(dir, program)
  FileUtils.mv dir + '/' + program, dir + '/ejecutables/' + program
end

# Ejecuta segun la opcion desiada. Si se elige la opcion uno compila.
# Si se elige la opcion 2 ejcuta. Si se elige la opcion 3 se mueve el archivo
# ejecutable a la carpeta de ejecutables de dicho practico. Si la opcion
# no existe le informa al usuario.
# PRECONDICION: Si selecciona la opcion 2 se espera que ya este previamente
# compilado
# opcion -> Opcion para la ejecucion
# programa -> Nombre del programa
# practico -> Numero de practico
def Principal(opcion, programa, practico)
  Dir.chdir('Practico-' + practico) do
    case opcion
    when '1'
      Compilar(programa)
    when '2'
      Dir.chdir('ejecutables') do
        Ejecutar(programa)
      end
    when '3'
      CarpetaEjecutables()
      MoverEjecutable(Dir.pwd, programa)
    else
      puts 'Esta opcion no esta disponible, vuelva a seleccionar'.red
    end
  end
end

# Crea un menu con las opciones disponibles para el usuario
def Menu()
  puts '===== Menu ====='.light_cyan
  puts '(1)'.light_white + 'Para compilar'.blue
  puts '(2)'.light_white + 'Para ejecutar(Se espera que el ejecutable este dentro de la carpeta de ejecutables, sino es asi ejecute previamente la opcion 3)'.blue
  puts '(3)'.light_white + 'Para mover el ejecutable a la carpeta de ejecutables'.blue
  puts '(4)'.light_white + 'Cambiar de ejercicio'.blue
  puts '(5)'.light_white + 'Terminar'.blue
  print 'Opcion: '
  opcion = gets.chomp
  return opcion
end

# Leemos el numero de practico y el programa a compilar y ejecutar
def Definiciones()
  print 'Ingrese el numero de practico: '.blue
  practico = gets.chomp
  print 'Ingrese el nombre del programa: '.blue
  programa = gets.chomp
  return {'programa'=> programa, 'practico'=> practico}
end

# Preguntamos la opcion para ejecutar
definiciones = Definiciones()
# Guardamos la opcion a realizar
opcion = Menu()
while opcion != '5'
  # Si desea cambiar de archivo limpiamos la consola y esperamos a que nos diga
  # cual es el archivo esperado
  if opcion == '4'
    system 'clear'
    definiciones = Definiciones()
  else
    Principal(opcion, definiciones['programa'], definiciones['practico'])
  end
  opcion = Menu()
end
# Limiamos la consola al finalizar el programa
system 'clear'
