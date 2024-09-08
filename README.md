# Generador de Serie Fibonacci en MIPS

## Descripción
Este programa en ensamblador MIPS genera la serie Fibonacci según la cantidad de números especificada por el usuario. Muestra la serie completa y calcula la suma total de los números generados. Está diseñado para ser ejecutado en el simulador MARS 4.5 (MIPS Assembler and Runtime Simulator).

## Características
- Solicita al usuario que ingrese la cantidad de números de la serie Fibonacci a generar.
- Genera y muestra la serie Fibonacci completa.
- Calcula y muestra la suma total de los números generados.
- Maneja la generación de la serie de manera eficiente utilizando solo tres variables temporales.

## Requisitos
- MARS 4.5 (MIPS Assembler and Runtime Simulator)

## Instalación
1. Descarga MARS 4.5 desde la [página oficial de MARS](http://courses.missouristate.edu/KenVollmar/MARS/).
2. Instala Java Runtime Environment (JRE) si aún no lo tienes instalado.

## Uso
1. Abre MARS 4.5.
2. Abre el archivo `ApellidoNombre_Fibonacci.asm` en MARS.
3. Haz clic en el botón "Assemble" (icono de llave inglesa) para ensamblar el código.
4. Haz clic en el botón "Run" (icono de play) para ejecutar el programa.
5. Sigue las instrucciones en la consola de MARS para ingresar la cantidad de números de la serie Fibonacci que deseas generar.

## Estructura del Código
El código está organizado en las siguientes secciones principales:
- `.data`: Contiene las cadenas de texto utilizadas en el programa.
- `.text`: Contiene el código ejecutable del programa.
- `main`: La función principal que controla el flujo del programa.
- `fibonacci_loop`: El bucle que genera y muestra la serie Fibonacci.
- `print_sum`: La sección que muestra la suma total de la serie.

## Explicación del Algoritmo
El programa utiliza tres variables temporales para generar la serie Fibonacci:
- `$t0`: Almacena el número actual de la serie (n).
- `$t1`: Almacena el siguiente número de la serie (n+1).
- `$t2`: Se usa como variable temporal para el cálculo.

En cada iteración, el programa:
1. Muestra el número actual (`$t0`).
2. Lo suma al total acumulado (`$s1`).
3. Calcula el siguiente número de la serie sumando `$t0` y `$t1`.
4. Actualiza las variables para la siguiente iteración.

## Contribuciones
Las contribuciones a este proyecto son bienvenidas. Por favor, asegúrate de probar tus cambios en MARS 4.5 antes de enviar una solicitud de pull.

## Licencia
Este proyecto está bajo la Licencia MIT. Consulta el archivo LICENSE para más detalles.

## Contacto
Si tienes preguntas o comentarios sobre este proyecto, por favor abre un issue en este repositorio.

