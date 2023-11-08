import 'package:fila_ru/cardapio.dart';
import 'package:flutter/material.dart';

class Restaurante extends StatelessWidget {
  const Restaurante({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Restaurante'),
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
                                  const Detalhe(cor: 'Area Funcionario')));
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(47, 74, 200, 1)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ))),
                    child: const Text('Area Funcionario',
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
                              builder: (context) =>
                                  const Detalhe(cor: 'Area Restaurante')));
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(47, 74, 200, 1)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ))),
                    child: const Text('Area Restaurante',
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
                              builder: (context) =>
                                  const Cardapio()));
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(47, 74, 200, 1)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ))),
                    child: const Text('Area Cardapio',
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
