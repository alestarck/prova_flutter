import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewPoliticaPrivacidadeScreen extends StatefulWidget {
  @override
  State<WebviewPoliticaPrivacidadeScreen> createState() =>
      _WebviewPoliticaPrivacidadeScreen();
}

class _WebviewPoliticaPrivacidadeScreen
    extends State<WebviewPoliticaPrivacidadeScreen> {
  WebViewController controller = WebViewController();

  @override
  void initState() {
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse("https://www.google.com.br/"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 34, 78, 36),
        title: Text("Política de privacidade"),
        centerTitle: true,
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
