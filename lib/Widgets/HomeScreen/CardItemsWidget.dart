import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prova_flutter/Widgets/HomeScreen/EstadoHomeMobx.dart';

class CardItemsWidget extends StatelessWidget {
  final EstadoHomeMobx estadoHomeMobxLista;
  final TextEditingController controller;
  final BuildContext context;
  CardItemsWidget(
      {super.key,
      required this.estadoHomeMobxLista,
      required this.controller,
      required this.context});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.6,
      margin: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Observer(builder: (context) {
        return ListView.builder(
          itemCount: estadoHomeMobxLista.minhaLista.length,
          itemBuilder: (context, index) {
            return ListTile(
              titleAlignment: ListTileTitleAlignment.threeLine,
              subtitle: Text(
                estadoHomeMobxLista.minhaLista[index],
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              trailing: SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Row(children: [
                  IconButton(
                      onPressed: () {
                        controller.text = estadoHomeMobxLista.minhaLista[index];
                        alertDialog(controller.text, index);
                      },
                      icon: const Icon(Icons.edit)),
                  IconButton(
                      onPressed: () {
                        estadoHomeMobxLista
                            .deletarItemListadoSharedPreferences(index)
                            .whenComplete(() => ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("Texto excluído com sucesso!"),
                                  backgroundColor: Colors.green,
                                )));
                      },
                      icon: const Icon(Icons.delete))
                ]),
              ),
            );
          },
        );
      }),
    );
  }

  alertDialog(String novoTexto, int index) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: const Text("Digite seu novo texto"),
            content: TextField(
              controller: controller,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    "Cancelar",
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  )),
              TextButton(
                  onPressed: () async {
                    // VERIFICANDO SE O TEXTO ESTÁ VAZIO
                    if (controller.text.trim() != "") {
                      estadoHomeMobxLista.adicionarTexto(controller.text);
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Insira um Texto para salvar!")));
                    }
                  },
                  child: Text(
                    "Enviar",
                    style: TextStyle(color: Colors.green, fontSize: 20),
                  ))
            ],
          );
        });
  }
}
