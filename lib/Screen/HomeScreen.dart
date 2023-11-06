import 'package:flutter/material.dart';
import 'package:prova_flutter/Widgets/HomeScreen/CardItemsWidget.dart';
import 'package:prova_flutter/Widgets/HomeScreen/EstadoHomeMobx.dart';
import 'package:prova_flutter/Widgets/HomeScreen/TextfieldInserirTextoWidget.dart';
import 'package:prova_flutter/Widgets/LoginScreen/WebviewPoliticaPrivacidadeWidget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  final estadoHomeMobxLista = EstadoHomeMobx();
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    estadoHomeMobxLista.carregarListaDoSharedPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 0, 72, 78),
            Color.fromARGB(255, 1, 174, 157)
          ])),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CardItemsWidget(estadoHomeMobxLista: estadoHomeMobxLista, controller: controller, context: context),
                  TextfieldInserirTextoWidget(estadoHomeMobxLista: estadoHomeMobxLista, controller: controller),
                  WebviewPoliticaPrivacidadeWidget()
                ]),
          ),
        ),
      ),
    );
  }

  
}
