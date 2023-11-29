import 'package:fila_ru/cadastroRestaurante.dart';
import 'package:fila_ru/cardapio.dart';
import 'package:fila_ru/main.dart';
import 'package:flutter/material.dart';

class AreaRestaurante extends StatelessWidget {
  const AreaRestaurante({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurante', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromRGBO(47, 74, 200, 1),
      ),
      body: Center(
          child: Column(
        children: [
          const LogosWidget(),
          CustomNavigatorButtonWidget(
            buttonText: 'Cadastrar Restaurante',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CadastroRestaurante(),
                ),
              );
            },
            width: 200,
            height: 40,
          ),
        ],
      )),
      bottomSheet: CustomPaint(
        size: const Size(
            double.infinity, 20), // Largura 100% da tela, altura desejada
        painter: HalfEllipsePainter(),
      ),
    );
  }
}
