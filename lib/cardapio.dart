import 'package:fila_ru/main.dart';
import 'package:flutter/material.dart';

class Cardapio extends StatelessWidget {
  const Cardapio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cardápio', style: TextStyle(color: Colors.white)),
          backgroundColor: const Color.fromRGBO(47, 74, 200, 1),
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
                      Navigator.of(context).pop();
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(47, 74, 200, 1)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ))),
                    child: const Text('Voltar',
                        style: TextStyle(color: Colors.white, fontSize: 12))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: 200,
                height: 40,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const Detalhe(cor: 'Divulgar Cardapio')));
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(47, 74, 200, 1)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ))),
                    child: const Text('Divulgar Cardapio',
                        style: TextStyle(color: Colors.white, fontSize: 12))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: 200,
                height: 40,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Detalhe(
                                  cor: 'Cadastrar Nova Refeição')));
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(47, 74, 200, 1)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ))),
                    child: const Text('Cadastrar Nova Refeição',
                        style: TextStyle(color: Colors.white, fontSize: 12))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: 200,
                height: 40,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Detalhe(
                                  cor: 'Vincular Prato a Cardapio')));
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(47, 74, 200, 1)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ))),
                    child: const Text('Vincular Prato a Cardapio',
                        style: TextStyle(color: Colors.white, fontSize: 12))),
              ),
            ),
            CustomPaint(
              size: const Size(double.infinity,
                  45), // Defina a largura como infinita e a altura desejada
              painter: MyPainter(),
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
          title: const Text('Detalhe', style: TextStyle(color: Colors.white)),
          backgroundColor: const Color.fromRGBO(47, 74, 200, 1),
        ),
        body: Center(
          child: Text(cor.toString()),
        ));
  }
}
