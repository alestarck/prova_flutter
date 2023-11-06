// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prova_flutter/Routes/Routes.dart';

abstract class ILogin {
  Future<int> getLogin(String usuario, String senha, BuildContext context);
}

class Login_repository implements ILogin {
  @override
  Future<int> getLogin(
      String usuario, String senha, BuildContext context) async {
    // COMO É UMA SIMULAÇÃO DE API, FAZ UMA CONSULTA NO MOCKAPI PARA A AUTENTICAÇÃO
    final url =
        "https://6547b7a3902874dff3acad68.mockapi.io/api/v1/login?user=$usuario";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var body = await jsonDecode(response.body);
      log(body.toString());
      // CONSULTA SE O USUARIO E A SENHA DIGITADAS É A MESMA RETORNADA DA API
      if (body.toString() != "[]") {
        if (body[0]["user"].toString() == usuario &&
            body[0]["senha"].toString() == senha &&
            usuario != "" &&
            senha != "") {
          simulatorTokenUser = body[0]["id"].toString();
          Navigator.of(context).pushReplacementNamed(Routes.home);
        } else if (usuario == "" && senha == "") {
          // VERIFICANDO SE USUARIO E SENHA ESTÃO COM CAMPOS VAZIOS
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Preencha os campos"),
            backgroundColor: Colors.green,
          ));
        } else if (senha.length < 3) {
          // VERIFICANDO SE O CAMPO SENHA É MAIOR QUE 3 CARACTERES
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Senha tem que ter no mínimo 3 digitos"),
            backgroundColor: Colors.green,
          ));
        } else if (!senha.contains(RegExp(r'[a,z]')) ||
            !senha.contains(RegExp(r'0,9'))) {
          // VERIFICANDO SE A SENHA TEM APENAS LETRAS E NUMEROS
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Senha não deve conter caracteres especiais"),
            backgroundColor: Colors.green,
          ));
        } else {
          // RETORNA UMA MENSAGEM QUE O USUARIO OU SENHA ESTÁ INCORRETO
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Usuário ou senha incorreta!"),
            backgroundColor: Colors.green,
          ));
        }
      }
      return response.statusCode;
    }

    return response.statusCode;
  }
}

String simulatorTokenUser = "0"; // SIMULA UM TOKEN DE USUARIO
