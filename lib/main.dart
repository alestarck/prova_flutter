import 'package:flutter/material.dart';
import 'package:prova_flutter/Screen/HomeScreen.dart';
import 'package:prova_flutter/Screen/LoginScreen.dart';
import 'package:prova_flutter/Screen/WebviewPoliticaPrivacidadeScreen.dart';
import 'package:prova_flutter/Routes/Routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.login,
      routes: {
        Routes.login: (context) => LoginScreen(),
        Routes.home: (context) => HomeScreen(),
        Routes.webviewPoliticaPrivacidade: (context) =>
            WebviewPoliticaPrivacidadeScreen()
      },
    );
  }
}
