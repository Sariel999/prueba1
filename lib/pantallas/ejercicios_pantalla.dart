
import 'package:flutter/material.dart';
import 'package:res_problemas/logica/operaciones_logica.dart';

class EjerciciosPantalla extends StatefulWidget {
  const EjerciciosPantalla({super.key});

  @override
  State<EjerciciosPantalla> createState() =>
      _EjerciciosPantallaState();
}

class _EjerciciosPantallaState
    extends State<EjerciciosPantalla> {

  // Controlador
  final numeroController = TextEditingController();

  // Logica
  OperacionesNumero operaciones = OperacionesNumero();

  String resultadoPrimo = '';
  String resultadoFactorial = '';
  String resultadoCapicua = '';
  String mensaje = '';

  // Obtener numero
  int? obtenerNumero() {

    int? numero = int.tryParse(numeroController.text);

    if (numero == null) {
      setState(() {
        mensaje = 'Ingrese un numero entero valido';
      });
    }

    return numero;
  }

  // Calcular primo
  void calcularPrimo() {

    int? numero = obtenerNumero();

    if (numero == null) {
      return;
    }

    setState(() {
      resultadoPrimo = operaciones.calcularPrimo(numero);
      mensaje = '';
    });
  }

  // Calcular factorial
  void calcularFactorial() {

    int? numero = obtenerNumero();

    if (numero == null) {
      return;
    }

    setState(() {
      resultadoFactorial =
          operaciones.calcularFactorial(numero);
      mensaje = '';
    });
  }

  // Calcular capicua
  void calcularCapicua() {

    int? numero = obtenerNumero();

    if (numero == null) {
      return;
    }

    setState(() {
      resultadoCapicua = operaciones.calcularCapicua(numero);
      mensaje = '';
    });
  }

  // Limpiar
  void limpiar() {
    setState(() {
      numeroController.clear();
      resultadoPrimo = '';
      resultadoFactorial = '';
      resultadoCapicua = '';
      mensaje = '';
    });
  }

  @override
  void dispose() {
    numeroController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FB),

      appBar: AppBar(
        title: const Text('Ejercicios'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            const Text(
              'OPrueba 1',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 15),

            const Text(
              'Ingrese un numero entero '
              'las diferentes operaciones.',
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 25),

            // Ingresar numero
            TextField(
              controller: numeroController,
              keyboardType: TextInputType.numberWithOptions(
                signed: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Ingrese un numero entero',
                border: OutlineInputBorder(),
              ),

              onChanged: (valor) {
                setState(() {
                  resultadoPrimo = '';
                  resultadoFactorial = '';
                  resultadoCapicua = '';
                  mensaje = '';
                });
              },
            ),

            const SizedBox(height: 20),

            // Boton primo
            ElevatedButton(
              onPressed: calcularPrimo,
              child: const Text('Numero Primo'),
            ),

            const SizedBox(height: 10),

            // Boton factorial
            ElevatedButton(
              onPressed: calcularFactorial,
              child: const Text('Factorial'),
            ),

            const SizedBox(height: 10),

            // Boton capicua
            ElevatedButton(
              onPressed: calcularCapicua,
              child: const Text('Numero Capicua'),
            ),

            const SizedBox(height: 15),

            Text(
              mensaje,
              style: const TextStyle(color: Colors.red),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            const Text(
              'Resultados',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Divider(),

            if (resultadoPrimo.isNotEmpty) ...[
              const Text(
                'Numero Primo:',
                style: TextStyle(fontSize: 18),
              ),

              const SizedBox(height: 5),

              Text(resultadoPrimo),

              const SizedBox(height: 20),
            ],

            if (resultadoFactorial.isNotEmpty) ...[
              const Text(
                'Factorial:',
                style: TextStyle(fontSize: 18),
              ),

              const SizedBox(height: 5),

              Text(resultadoFactorial),

              const SizedBox(height: 20),
            ],

            if (resultadoCapicua.isNotEmpty) ...[
              const Text(
                'Numero Capicua:',
                style: TextStyle(fontSize: 18),
              ),

              const SizedBox(height: 5),

              Text(resultadoCapicua),

              const SizedBox(height: 20),
            ],

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: limpiar,
              child: const Text('Limpiar'),
            ),
          ],
        ),
      ),
    );
  }
}
