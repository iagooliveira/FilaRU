import 'package:fila_ru/cardapio.dart';
import 'package:fila_ru/main.dart';
import 'package:flutter/material.dart';

class Restaurante extends StatelessWidget {
  const Restaurante({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              const Text('Restaurante', style: TextStyle(color: Colors.white)),
          backgroundColor: const Color.fromRGBO(47, 74, 200, 1),
        ),
        body: Center(
            child: Column(
          children: [
            const LogosWidget(),
            CustomNavigatorButtonWidget(
              buttonText: 'Area Funcionario',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const Detalhe(texto: 'Area Funcionario'),
                  ),
                );
              },
              width: 200,
              height: 40,
            ),
            CustomNavigatorButtonWidget(
              buttonText: 'Area Restaurante',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const Detalhe(texto: 'Area Restaurante'),
                  ),
                );
              },
              width: 200,
              height: 40,
            ),
            CustomNavigatorButtonWidget(
              buttonText: 'Area Cardapio',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Cardapio(),
                  ),
                );
              },
              width: 200,
              height: 40,
            ),
            CustomPaint(
              size: const Size(double.infinity,
                  75), // Defina a largura como infinita e a altura desejada
              painter: MyPainter(),
            ),
          ],
        )));
  }
}

class Detalhe extends StatelessWidget {
  const Detalhe({super.key, required this.texto});

  final String texto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detalhe', style: TextStyle(color: Colors.white)),
          backgroundColor: const Color.fromRGBO(47, 74, 200, 1),
        ),
        body: Center(
          child: Text(texto.toString()),
        ));
  }
}
