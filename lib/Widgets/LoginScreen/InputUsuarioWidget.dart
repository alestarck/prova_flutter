import 'package:flutter/material.dart';

class InputUsuarioWidget extends StatefulWidget {
  final TextEditingController controllerUsuario;
  InputUsuarioWidget({super.key, required this.controllerUsuario});

  @override
  State<InputUsuarioWidget> createState() => _InputUsuarioWidget();
}

class _InputUsuarioWidget extends State<InputUsuarioWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.all(8),
          child: const Text(
            "Usuário",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        // CAIXA DE ENTRADA PARA COLOCAR O USUARIO PARA O LOGIN
        TextField(
          controller: widget.controllerUsuario,
          maxLength: 20,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            prefixIcon: const Icon(Icons.person_2_rounded, color: Colors.black87,),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )
          ),
        )
      ],
    );
  }
}
