
class OperacionesNumero {

  // Verificar si un numero es primo
  String calcularPrimo(int numero) {

    if (numero <= 1) {
      return 'El numero $numero no es primo';
    }

    for (int i = 2; i * i <= numero; i++) {
      if (numero % i == 0) {
        return 'El numero $numero no es primo';
      }
    }

    return 'El numero $numero es primo';
  }

  // Calcular factorial
  String calcularFactorial(int numero) {

    if (numero < 0) {
      return 'No existe factorial de numeros negativos';
    }

    if (numero == 0) {
      return '0! = 1';
    }

    int factorial = 1;
    String procedimiento = '';

    for (int i = numero; i >= 1; i--) {

      factorial = factorial * i;

      procedimiento = procedimiento + '$i';

      if (i > 1) {
        procedimiento = procedimiento + ' x ';
      }
    }

    return '$procedimiento = $factorial';
  }

  // Verificar si un numero es capicua
  String calcularCapicua(int numero) {

    if (numero < 0) {
      return 'El numero $numero no es capicua';
    }

    int original = numero;
    int invertido = 0;
    int auxiliar = numero;

    while (auxiliar > 0) {

      int digito = auxiliar % 10;

      invertido = invertido * 10 + digito;

      auxiliar = auxiliar ~/ 10;
    }

    if (original == invertido) {
      return 'El numero $numero es capicua';
    } else {
      return 'El numero $numero no es capicua';
    }
  }
}
