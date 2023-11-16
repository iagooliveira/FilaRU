import 'package:fila_ru/main.dart';
import 'package:flutter/material.dart';

class DivulgarCardapio extends StatelessWidget {
  const DivulgarCardapio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Divulgar Cardápio',
            style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromRGBO(47, 74, 200, 1),
      ),
      body: Center(child: FormDivulgarCardapio()),
    );
  }
}

const List<String> mockRestaurantes = <String>['Ondina', 'São Lázaro'];

class FormDivulgarCardapio extends StatelessWidget {
  final TextEditingController _controladorRestaurante = TextEditingController();
  final TextEditingController _controladorDataCardapio =
      TextEditingController();

  FormDivulgarCardapio({super.key});

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
                    child: DropdownRestaurantes()),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: TextFormField(
                    controller: _controladorDataCardapio,
                    decoration:
                        const InputDecoration(labelText: 'Data cardapio'),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Data não pode ser vazio";
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
                        final String restaurante = _controladorRestaurante.text;
                        final String dataCardapio =
                            _controladorDataCardapio.text;
                        final cardapio = Cardapio(
                          restaurante: restaurante,
                          dataCardapio: dataCardapio,
                        );

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Detalhe(
                              cardapio: cardapio,
                              texto: 'Cardapio divulgado:',
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
  final String restaurante;
  final String dataCardapio;

  Cardapio({
    required this.restaurante,
    required this.dataCardapio,
  });

  @override
  String toString() {
    return 'Restaurante: $restaurante, Data cardapio: $dataCardapio';
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
                  title: const Text('Restaurante'),
                  subtitle: Text(cardapio!.restaurante),
                ),
                ListTile(
                  title: const Text('Data do cardapio'),
                  subtitle: Text(cardapio!.dataCardapio),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class DropdownRestaurantes extends StatefulWidget {
  const DropdownRestaurantes({super.key});

  @override
  State<DropdownRestaurantes> createState() => _DropdownRestaurantesState();
}

class _DropdownRestaurantesState extends State<DropdownRestaurantes> {
  String dropdownValue = mockRestaurantes.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: mockRestaurantes.first,
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      items: mockRestaurantes.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(value: value, child: Text(value));
      }).toList(),
    );
  }
}
