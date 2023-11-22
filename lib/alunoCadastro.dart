import 'package:fila_ru/main.dart';
import 'package:flutter/material.dart';

class AlunoInicio extends StatelessWidget {
  const AlunoInicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aluno', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromRGBO(47, 74, 200, 1),
      ),
      body: Center(
        child: AlunoLogin(),
      ),
    );
  }
}

class AlunoLogin extends StatelessWidget {
  final TextEditingController _controladorMatricula = TextEditingController();
  final formKey = GlobalKey<FormState>();

  AlunoLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Padding(
      padding: const EdgeInsets.only(top: 5, left: 25, right: 25),
      child: Form(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Image.asset('assets/images/rufila.jpeg',
                  width: 200, height: 120),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 20, left: 50, right: 50),
              child: TextFormField(
                controller: _controladorMatricula,
                decoration: const InputDecoration(labelText: 'Matricula'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Matricula não pode ser vazia";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: ElevatedButton(
                  onPressed: () {
                    final String matricula = _controladorMatricula.text;

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Detalhe(texto: 'Aluno Logado $matricula'),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(47, 74, 200, 1)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.only(
                            top: 18, bottom: 18, left: 70, right: 70)),
                  ),
                  child: const Text('Entrar',
                      style: TextStyle(color: Colors.white))),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: CustomNavigatorButtonWidget(
                buttonText: 'Não tenho cadastro',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const Detalhe(texto: 'Aluno Cadastro'),
                    ),
                  );
                },
                width: 180,
                height: 40,
              ),
            ),
          ],
        ),
      ),
    )));
  }
}
