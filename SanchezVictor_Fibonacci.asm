.data
    msg_cantidad:    .asciiz "Ingrese la cantidad de numeros de la serie Fibonacci a generar: "
    msg_serie:       .asciiz "Serie Fibonacci: "
    msg_suma:        .asciiz "\nLa suma de la serie es: "
    comma:           .asciiz ", "
    newline:         .asciiz "\n"

.text
.globl main                                 #Define el símbolo main como global, lo que indica el punto de entrada principal del programa.

main:
    # Pedir cantidad de números
    li $v0, 4                               #Se carga el código de syscall 4 (imprimir cadena) en el registro $v0.
    la $a0, msg_cantidad                    #La dirección de la cadena msg_cantidad se carga en $a0.
    syscall                                 #ejecuta la llamada al sistema, mostrando el mensaje que pide la cantidad de números de Fibonacci a generar.

    # Leer cantidad
    li $v0, 5                               #Se carga el código de syscall 5 (leer entero) en $v0.
    syscall
    move $s0, $v0  # $s0 = cantidad         #El valor de $v0 (la cantidad ingresada) se mueve a $s0, para ser usado como el número de elementos de Fibonacci que se generarán.

    # Inicializar variables. Se cargan los valores iniciales de las variables
    li $t0, 0      # n-2
    li $t1, 1      # n-1
    li $t2, 0      # temp para cálculo
    li $s1, 0      # suma total
    li $t3, 0      # contador

    # Imprimir mensaje de serie
    li $v0, 4                     #Código de syscall 4 para imprimir una cadena.
    la $a0, msg_serie             #Se carga la dirección de msg_serie en $a0 y se imprime el mensaje "Serie Fibonacci: ".
    syscall

fibonacci_loop:
    # Imprimir número actual
    li $v0, 1                     #Se carga el código de syscall 1 (imprimir entero).
    move $a0, $t0                 #El valor de $t0, que contiene el número actual de la secuencia de Fibonacci, se mueve a $a0.
    syscall                       #imprime el número actual.

    # Agregar a la suma total
    add $s1, $s1, $t0             #El valor de $t0 (el número actual) se suma al registro $s1, que acumula la suma total de los números.

    # Incrementar contador
    addi $t3, $t3, 1             #Se incrementa el contador $t3 en 1 para llevar la cuenta de cuántos números de Fibonacci se han generado.

    # Verificar si hemos terminado
    beq $t3, $s0, print_sum      #Se compara el contador $t3 con el valor en $s0 (la cantidad de números que el usuario solicitó).

    # Imprimir coma. Se imprime una coma (, ) después del número, a menos que se haya alcanzado el último número.
    li $v0, 4
    la $a0, comma
    syscall

    # Calcular siguiente número
    move $t2, $t1                #El valor actual de $t1 (último número de la secuencia) se mueve a $t2 (temporal).
    add $t1, $t1, $t0            #Luego, $t1 se actualiza sumando $t1 y $t0 para calcular el siguiente número de Fibonacci.
    move $t0, $t2                #Finalmente, $t0 toma el valor anterior de $t1 (almacenado en $t2), de manera que en la siguiente iteración, $t0 contendrá el nuevo penúltimo número.

    j fibonacci_loop             #El programa salta de vuelta al inicio de fibonacci_loop para calcular e imprimir el siguiente número de Fibonacci.

print_sum:
    # Imprimir mensaje de suma. Se imprime el mensaje que indica la suma total de la serie, usando el código de syscall 4 (imprimir cadena).
    li $v0, 4
    la $a0, msg_suma
    syscall

    # Imprimir suma total. Se utiliza el código de syscall 1 (imprimir entero) para mostrar la suma total almacenada en $s1.
    li $v0, 1
    move $a0, $s1
    syscall

    # Salir del programa. El código de syscall 10 finaliza la ejecución del programa.
    li $v0, 10
    syscall