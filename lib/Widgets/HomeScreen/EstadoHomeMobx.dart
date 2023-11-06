import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'EstadoHomeMobx.g.dart';

class EstadoHomeMobx = _EstadoHome with _$EstadoHomeMobx;

abstract class _EstadoHome with Store {
  static const String chaveLista = "listaTextos";

  @observable
  ObservableList<String> minhaLista = ObservableList<String>();

  @action
  void adicionarTexto(String texto) {
    minhaLista.add(texto);
    _salvarListaNoSharedPreference();
  }

  @action
  Future<void> carregarListaDoSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final listaSalva = prefs.getStringList(chaveLista);

    if (listaSalva != null) {
      minhaLista = ObservableList<String>.of(listaSalva);
    }
  }

  @action
  Future<void> editItemListaDoSharedPreferences(
      String novoTexto, int indexPosicao) async {
    final prefs = await SharedPreferences.getInstance();
    final listaSalva = prefs.getStringList(chaveLista);

    if (listaSalva != null) {
      listaSalva.removeAt(indexPosicao);
      listaSalva.insert(indexPosicao, novoTexto);
      minhaLista = ObservableList<String>.of(listaSalva);
      _salvarListaNoSharedPreference();
    }
  }

  @action
  Future<void> deletarItemListadoSharedPreferences(int index) async {
    final prefs = await SharedPreferences.getInstance();
    final listaSalva = prefs.getStringList(chaveLista);

    if (listaSalva != null) {
      listaSalva.removeAt(index);
      minhaLista = ObservableList<String>.of(listaSalva);
      _salvarListaNoSharedPreference();
    }
  }

  _salvarListaNoSharedPreference() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(chaveLista, minhaLista.toList());
  }
}
