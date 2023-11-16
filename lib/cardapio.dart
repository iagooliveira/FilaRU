import 'package:fila_ru/divulgarCardapio.dart';
import 'package:fila_ru/main.dart';
import 'package:flutter/material.dart';

class PageCardapio extends StatelessWidget {
  const PageCardapio({super.key});

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
                  builder: (context) => const DivulgarCardapio(),
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
                  builder: (context) => FormCardapio(),
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

class FormCardapio extends StatelessWidget {
  final TextEditingController _controladorSalada = TextEditingController();
  final TextEditingController _controladorPratoPrincipal =
      TextEditingController();
  final TextEditingController _controladorGuarnicao = TextEditingController();
  final TextEditingController _controladorSobremesa = TextEditingController();
  final TextEditingController _controladorSuco = TextEditingController();

  FormCardapio({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro cardapio',
            style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromRGBO(47, 74, 200, 1),
      ),
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
                    controller: _controladorSalada,
                    decoration: const InputDecoration(labelText: 'Saladas'),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Salada não pode ser vazio";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: TextFormField(
                    controller: _controladorPratoPrincipal,
                    decoration:
                        const InputDecoration(labelText: 'Prato Principal'),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Prato Principal não pode ser vazio";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: TextFormField(
                    controller: _controladorGuarnicao,
                    decoration: const InputDecoration(labelText: 'Guarnição'),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Guarnicao não pode ser vazio";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: TextFormField(
                    controller: _controladorSobremesa,
                    decoration: const InputDecoration(labelText: 'Sobremesa'),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Sobremesa não pode ser vazio";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: TextFormField(
                    controller: _controladorSuco,
                    decoration: const InputDecoration(labelText: 'Suco'),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Suco não pode ser vazio";
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
                        final String salada = _controladorSalada.text;
                        final String pratoPrincipal =
                            _controladorPratoPrincipal.text;
                        final String guarnicao = _controladorGuarnicao.text;
                        final String sobremesa = _controladorSobremesa.text;
                        final String suco = _controladorSuco.text;

                        final cardapio = Cardapio(
                          salada: salada,
                          pratoPrincipal: pratoPrincipal,
                          guarnicao: guarnicao,
                          sobremesa: sobremesa,
                          suco: suco,
                        );

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Detalhe(
                              cardapio: cardapio,
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

class Cardapio {
  final String salada;
  final String pratoPrincipal;
  final String guarnicao;
  final String sobremesa;
  final String suco;

  Cardapio(
      {required this.salada,
      required this.pratoPrincipal,
      required this.guarnicao,
      required this.sobremesa,
      required this.suco});

  @override
  String toString() {
    return 'Salada: $salada, Prato Principal: $pratoPrincipal, Guarnicao: $guarnicao, Sobremesa: $sobremesa, Suco: $suco';
  }
}

class Detalhe extends StatelessWidget {
  const Detalhe({super.key, required this.texto, this.cardapio});

  final String texto;
  final Cardapio? cardapio;

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
              if (cardapio != null) ...[
                ListTile(
                  title: const Text('Salada'),
                  subtitle: Text(cardapio!.salada),
                ),
                ListTile(
                  title: const Text('Prato Principal'),
                  subtitle: Text(cardapio!.pratoPrincipal),
                ),
                ListTile(
                  title: const Text('Guarnição'),
                  subtitle: Text(cardapio!.guarnicao),
                ),
                ListTile(
                  title: const Text('Sobremesa'),
                  subtitle: Text(cardapio!.sobremesa),
                ),
                ListTile(
                  title: const Text('Suco'),
                  subtitle: Text(cardapio!.suco),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
