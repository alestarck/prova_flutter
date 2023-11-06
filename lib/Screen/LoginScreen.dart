import 'package:flutter/material.dart';
import 'package:prova_flutter/Widgets/LoginScreen/ButtonEntrarWidget.dart';
import 'package:prova_flutter/Widgets/LoginScreen/InputSenhaWidget.dart';
import 'package:prova_flutter/Widgets/LoginScreen/InputUsuarioWidget.dart';
import 'package:prova_flutter/Widgets/LoginScreen/WebviewPoliticaPrivacidadeWidget.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  TextEditingController controllerUsuario = TextEditingController();
  TextEditingController controllerSenha = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 0, 72, 78),
        Color.fromARGB(255, 1, 174, 157)
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InputUsuarioWidget(controllerUsuario: controllerUsuario,),
            InputSenhaWidget(controllerSenha: controllerSenha,),
            ButtonEntrarWidget(usuario: controllerUsuario, senha: controllerSenha,),
            WebviewPoliticaPrivacidadeWidget()
          ],
        ),
      ),
    ));
  }
}
