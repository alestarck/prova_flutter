import 'package:flutter/material.dart';

class InputSenhaWidget extends StatefulWidget {
  final TextEditingController controllerSenha;
  InputSenhaWidget({super.key, required this.controllerSenha});

  @override
  State<InputSenhaWidget> createState() => _InputSenhaWidgetState();
}

class _InputSenhaWidgetState extends State<InputSenhaWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(left: 8, bottom: 8, top: 16),
          child: const Text(
            "Senha",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        // CAIXA DE ENTRADA PARA COLOCAR A SENHA PARA O LOGIN
        TextField(
          controller: widget.controllerSenha,
          obscureText: true,
          maxLength: 20,
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              prefixIcon: const Icon(
                Icons.lock,
                color: Colors.black87,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )),
        )
      ],
    );
  }
}
