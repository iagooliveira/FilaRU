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
          title: const Text('Início', style: TextStyle(color: Colors.white)),
          backgroundColor: const Color.fromRGBO(47, 74, 200, 1),
        ),
        body: Center(
            child: Column(
          children: [
            const LogosWidget(),
            CustomNavigatorButtonWidget(
              buttonText: 'ALUNO',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Detalhe(texto: 'Aluno'),
                  ),
                );
              },
              width: 180,
              height: 40,
            ),
            CustomNavigatorButtonWidget(
              buttonText: 'RESTAURANTE',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PageRestaurante(),
                  ),
                );
              },
              width: 180,
              height: 40,
            ),
            CustomPaint(
              size: const Size(double.infinity,
                  110), 
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

class LogosWidget extends StatelessWidget {
  const LogosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
          child: Image.asset('assets/images/ufba.jpg', width: 200, height: 100),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child:
              Image.asset('assets/images/rufila.jpeg', width: 200, height: 120),
        ),
      ],
    );
  }
}

class CustomNavigatorButtonWidget extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;
  final double width;
  final double height;

  const CustomNavigatorButtonWidget({
    super.key,
    required this.buttonText,
    this.onPressed,
    this.width = 180,
    this.height = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              const Color.fromRGBO(47, 74, 200, 1),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          child: Text(
            buttonText,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color.fromRGBO(47, 74, 200, 1)
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2,
        size.height); 
    final radiusX = size.width;
    const radiusY = 60.0; 

    canvas.drawOval(
        Rect.fromCenter(center: center, width: radiusX, height: radiusY),
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
