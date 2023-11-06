import 'package:flutter/material.dart';
import 'package:prova_flutter/Routes/Routes.dart';

class WebviewPoliticaPrivacidadeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 56),
      child: TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed(Routes.webviewPoliticaPrivacidade);
          },
          child: const Text("Política de privacidade", style: TextStyle(color: Colors.white),)),
    );
  }
}
