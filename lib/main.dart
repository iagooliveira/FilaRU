import 'package:fila_ru/restaurante.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RuFila',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Início'),
        ),
        body: Center(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset('assets/images/ufba.jpg',
                  width: 200, height: 100),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset('assets/images/rufila.jpeg',
                  width: 200, height: 120),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: 180,
                height: 40,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const Detalhe(cor: 'Aluno')));
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(47, 74, 200, 1)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ))),
                    child: const Text('ALUNO',
                        style: TextStyle(color: Colors.white, fontSize: 12))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: 180,
                height: 40,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Restaurante()));
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(47, 74, 200, 1)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ))),
                    child: const Text('RESTAURANTE',
                        style: TextStyle(color: Colors.white, fontSize: 12))),
              ),
            ),
          ],
        )));
  }
}

class Detalhe extends StatelessWidget {
  const Detalhe({super.key, required this.cor});

  final String cor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detalhe'),
        ),
        body: Center(
          child: Text(cor.toString()),
        ));
  }
}
