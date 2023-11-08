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
            const LogosWidget(),
            CustomNavigatorButtonWidget(
              buttonText: 'Divulgar Cardapio',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const Detalhe(texto: 'Divulgar Cardapio'),
                  ),
                );
              },
              width: 200,
              height: 40,
            ),
            CustomNavigatorButtonWidget(
              buttonText: 'Cadastrar nova refeição',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const Detalhe(texto: 'Cadastrar nova refeição'),
                  ),
                );
              },
              width: 200,
              height: 40,
            ),
            CustomNavigatorButtonWidget(
              buttonText: 'Vincular Prato a Cardapio',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const Detalhe(texto: 'Vincular Prato a Cardapio'),
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
