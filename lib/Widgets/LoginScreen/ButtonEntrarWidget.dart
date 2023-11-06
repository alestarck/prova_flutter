import 'package:flutter/material.dart';
import 'package:prova_flutter/Data/Repositories/Login_repository.dart';

// ignore: must_be_immutable
class ButtonEntrarWidget extends StatelessWidget {
  final TextEditingController usuario;
  final TextEditingController senha;
  ButtonEntrarWidget({super.key, required this.usuario, required this.senha});

  ValueNotifier<bool> isLoading = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 26),
      child: ElevatedButton(
          onPressed: () async {
            isLoading.value = !isLoading.value;
            await Login_repository()
                .getLogin(usuario.text.toString().trim(), senha.text.toString().trim(), context);
            isLoading.value = !isLoading.value;
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 56, vertical: 12)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)))),
          child: AnimatedBuilder(
            animation: isLoading,
            builder: (context, child) {
              return isLoading.value
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ))
                  : const Text("Entrar");
            },
          )),
    );
  }
}
