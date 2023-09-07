import 'package:flutter/material.dart';

class MyForm extends StatelessWidget {
  MyForm({super.key});
  final formKey = GlobalKey<FormState>();
  final textController = TextEditingController();
  final cpfController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(children: [
        TextFormField(
          controller: textController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Digite algum texto!';
            }
            if (value.length < 3) {
              return 'Digite um texto maior pô!';
            } else {
              return null;
            }
          },
        ),
        TextFormField(
          controller: cpfController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'É necessário um CPF';
            } else if (value.length != 11) {
              return 'CPF Inválido!';
            } else {
              return null;
            }
          },
        ),
        ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              // Faz o que tá aqui quando tá valido!
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Processando o Formulário!')),
              );
              debugPrint(textController.text);
              debugPrint(cpfController.text);
            }
          },
          child: const Text('Enviar'),
        )
      ]),
    );
  }
}
