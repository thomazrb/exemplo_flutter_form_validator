import 'package:flutter/material.dart';

class MyForm extends StatelessWidget {
  MyForm({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(children: [
        TextFormField(
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
            }
          },
          child: const Text('Enviar'),
        )
      ]),
    );
  }
}
