.data
    msg_cantidad:    .asciiz "Ingrese la cantidad de numeros de la serie Fibonacci a generar: "
    msg_serie:       .asciiz "Serie Fibonacci: "
    msg_suma:        .asciiz "\nLa suma de la serie es: "
    comma:           .asciiz ", "
    newline:         .asciiz "\n"

.text
.globl main                                 #Define el s�mbolo main como global, lo que indica el punto de entrada principal del programa.

main:
    # Pedir cantidad de n�meros
    li $v0, 4                               #Se carga el c�digo de syscall 4 (imprimir cadena) en el registro $v0.
    la $a0, msg_cantidad                    #La direcci�n de la cadena msg_cantidad se carga en $a0.
    syscall                                 #ejecuta la llamada al sistema, mostrando el mensaje que pide la cantidad de n�meros de Fibonacci a generar.

    # Leer cantidad
    li $v0, 5                               #Se carga el c�digo de syscall 5 (leer entero) en $v0.
    syscall
    move $s0, $v0  # $s0 = cantidad         #El valor de $v0 (la cantidad ingresada) se mueve a $s0, para ser usado como el n�mero de elementos de Fibonacci que se generar�n.

    # Inicializar variables. Se cargan los valores iniciales de las variables
    li $t0, 0      # n-2
    li $t1, 1      # n-1
    li $t2, 0      # temp para c�lculo
    li $s1, 0      # suma total
    li $t3, 0      # contador

    # Imprimir mensaje de serie
    li $v0, 4                     #C�digo de syscall 4 para imprimir una cadena.
    la $a0, msg_serie             #Se carga la direcci�n de msg_serie en $a0 y se imprime el mensaje "Serie Fibonacci: ".
    syscall

fibonacci_loop:
    # Imprimir n�mero actual
    li $v0, 1                     #Se carga el c�digo de syscall 1 (imprimir entero).
    move $a0, $t0                 #El valor de $t0, que contiene el n�mero actual de la secuencia de Fibonacci, se mueve a $a0.
    syscall                       #imprime el n�mero actual.

    # Agregar a la suma total
    add $s1, $s1, $t0             #El valor de $t0 (el n�mero actual) se suma al registro $s1, que acumula la suma total de los n�meros.

    # Incrementar contador
    addi $t3, $t3, 1             #Se incrementa el contador $t3 en 1 para llevar la cuenta de cu�ntos n�meros de Fibonacci se han generado.

    # Verificar si hemos terminado
    beq $t3, $s0, print_sum      #Se compara el contador $t3 con el valor en $s0 (la cantidad de n�meros que el usuario solicit�).

    # Imprimir coma. Se imprime una coma (, ) despu�s del n�mero, a menos que se haya alcanzado el �ltimo n�mero.
    li $v0, 4
    la $a0, comma
    syscall

    # Calcular siguiente n�mero
    move $t2, $t1                #El valor actual de $t1 (�ltimo n�mero de la secuencia) se mueve a $t2 (temporal).
    add $t1, $t1, $t0            #Luego, $t1 se actualiza sumando $t1 y $t0 para calcular el siguiente n�mero de Fibonacci.
    move $t0, $t2                #Finalmente, $t0 toma el valor anterior de $t1 (almacenado en $t2), de manera que en la siguiente iteraci�n, $t0 contendr� el nuevo pen�ltimo n�mero.

    j fibonacci_loop             #El programa salta de vuelta al inicio de fibonacci_loop para calcular e imprimir el siguiente n�mero de Fibonacci.

print_sum:
    # Imprimir mensaje de suma. Se imprime el mensaje que indica la suma total de la serie, usando el c�digo de syscall 4 (imprimir cadena).
    li $v0, 4
    la $a0, msg_suma
    syscall

    # Imprimir suma total. Se utiliza el c�digo de syscall 1 (imprimir entero) para mostrar la suma total almacenada en $s1.
    li $v0, 1
    move $a0, $s1
    syscall

    # Salir del programa. El c�digo de syscall 10 finaliza la ejecuci�n del programa.
    li $v0, 10
    syscall