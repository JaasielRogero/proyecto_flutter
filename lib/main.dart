import 'package:flutter/material.dart';
import 'package:protecto/paginas/principal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/paginas/principal': (context) => const Principal(),
      },
      home: Builder(builder: (context) => MyHomePage(context: context)),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final BuildContext context;

  MyHomePage({required this.context});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 202, 202, 202),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(70.0),
            child: SizedBox(
              height: 200.0,
              child: Image.asset('assets/hies1.jpg'),
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 241, 235, 235),
                borderRadius: BorderRadius.circular(8.0),
              ),
              width: 300.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Iniciar Sesión',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Usuario',
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Contraseña',
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 10.0),
                  TextButton(
                    onPressed: () {},
                    child: const Text('¿Olvidaste la contraseña?'),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 202, 202, 202),
                      ),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                    ),
                    child: const Text('Ingresar'),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/paginas/principal');
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
