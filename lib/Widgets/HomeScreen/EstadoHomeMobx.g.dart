// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EstadoHomeMobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EstadoHomeMobx on _EstadoHome, Store {
  late final _$minhaListaAtom =
      Atom(name: '_EstadoHome.minhaLista', context: context);

  @override
  ObservableList<String> get minhaLista {
    _$minhaListaAtom.reportRead();
    return super.minhaLista;
  }

  @override
  set minhaLista(ObservableList<String> value) {
    _$minhaListaAtom.reportWrite(value, super.minhaLista, () {
      super.minhaLista = value;
    });
  }

  late final _$carregarListaDoSharedPreferencesAsyncAction = AsyncAction(
      '_EstadoHome.carregarListaDoSharedPreferences',
      context: context);

  @override
  Future<void> carregarListaDoSharedPreferences() {
    return _$carregarListaDoSharedPreferencesAsyncAction
        .run(() => super.carregarListaDoSharedPreferences());
  }

  late final _$editItemListaDoSharedPreferencesAsyncAction = AsyncAction(
      '_EstadoHome.editItemListaDoSharedPreferences',
      context: context);

  @override
  Future<void> editItemListaDoSharedPreferences(
      String novoTexto, int indexPosicao) {
    return _$editItemListaDoSharedPreferencesAsyncAction.run(
        () => super.editItemListaDoSharedPreferences(novoTexto, indexPosicao));
  }

  late final _$deletarItemListadoSharedPreferencesAsyncAction = AsyncAction(
      '_EstadoHome.deletarItemListadoSharedPreferences',
      context: context);

  @override
  Future<void> deletarItemListadoSharedPreferences(int index) {
    return _$deletarItemListadoSharedPreferencesAsyncAction
        .run(() => super.deletarItemListadoSharedPreferences(index));
  }

  late final _$_EstadoHomeActionController =
      ActionController(name: '_EstadoHome', context: context);

  @override
  void adicionarTexto(String texto) {
    final _$actionInfo = _$_EstadoHomeActionController.startAction(
        name: '_EstadoHome.adicionarTexto');
    try {
      return super.adicionarTexto(texto);
    } finally {
      _$_EstadoHomeActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
minhaLista: ${minhaLista}
    ''';
  }
}
