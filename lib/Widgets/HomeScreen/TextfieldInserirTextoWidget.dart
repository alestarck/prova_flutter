import 'package:flutter/material.dart';
import 'package:prova_flutter/Widgets/HomeScreen/EstadoHomeMobx.dart';

class TextfieldInserirTextoWidget extends StatelessWidget {
  final EstadoHomeMobx estadoHomeMobxLista;
  final TextEditingController controller;
  TextfieldInserirTextoWidget(
      {super.key, required this.estadoHomeMobxLista, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: TextField(
        controller: controller,
        onEditingComplete: () {
          // VERIFICANDO SE O TEXTO ESTÁ VAZIO
          if (controller.text.trim() != "") {
            estadoHomeMobxLista.adicionarTexto(controller.text);
            FocusScope.of(context).unfocus();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Insira um Texto para salvar!")));
          }
        },
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            labelText: "Digite seu Texto",
            labelStyle: const TextStyle(color: Colors.black),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
