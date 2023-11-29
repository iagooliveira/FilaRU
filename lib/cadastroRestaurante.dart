import 'package:fila_ru/divulgarCardapio.dart';
import 'package:fila_ru/main.dart';
import 'package:flutter/material.dart';

class CadastroRestaurante extends StatelessWidget {
  const CadastroRestaurante({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro Restaurante',
            style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromRGBO(47, 74, 200, 1),
      ),
      body: Center(child: FormCadastroRestaurante()),
      bottomSheet: CustomPaint(
        size: const Size(
            double.infinity, 20), // Largura 100% da tela, altura desejada
        painter: HalfEllipsePainter(),
      ),
    );
  }
}

class FormCadastroRestaurante extends StatelessWidget {
  final TextEditingController _controladorCadastroRestaurante =
      TextEditingController();

  FormCadastroRestaurante({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 2.0, left: 25.0, right: 25.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image.asset('assets/images/rufila.jpeg',
                      width: 200, height: 120),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: TextFormField(
                    controller: _controladorCadastroRestaurante,
                    decoration:
                        const InputDecoration(labelText: 'Nome Restaurante'),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "O nome do restaurante não pode ser vazio";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(47, 74, 200, 1)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        final String nomeRestaurante =
                            _controladorCadastroRestaurante.text;

                        final nomeRestauranteA = NomeRestaurante(
                          nomeRestaurante: nomeRestaurante,
                        );

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Detalhe(
                              nomeRestaurante: nomeRestauranteA,
                              texto: 'Cardapio criado:',
                            ),
                          ),
                        );
                      }
                    },
                    child: const Text('Cadastrar',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NomeRestaurante {
  final String nomeRestaurante;

  NomeRestaurante({
    required this.nomeRestaurante,
  });

  @override
  String toString() {
    return 'Restaurante: $nomeRestaurante';
  }
}

class Detalhe extends StatelessWidget {
  const Detalhe({super.key, required this.texto, this.nomeRestaurante});

  final String texto;
  final NomeRestaurante? nomeRestaurante;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhe', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromRGBO(47, 74, 200, 1),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Text(texto),
              if (nomeRestaurante != null) ...[
                ListTile(
                  title: const Text('Salada'),
                  subtitle: Text(nomeRestaurante!.nomeRestaurante),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
