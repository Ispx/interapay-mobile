import 'package:juntapay/Core/Services/LocalStorage/SharedPreferencesLocalStorageService.dart';
import 'package:test/test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:juntapay/Core/Services/LocalStorage/ILocalStorageService.dart';

class _StoragePath {
  static const CLIENTES = 'clientes';
  static const PERMITIR_EXCLUIR = 'permitir_excluir';
  static const NOME_USUARIO = 'nome_usuario';
  static const QUANTIDADE_CLIENTES = 'quantidade_clientes';
  static const QUANTIDADE = 'quantidade';
}

void main() {
  late SharedPreferences sharedPreferences;
  late ILocalStorageService localStorage;

  bool mock = true;

  final List<String> clientes = ['Bernardo', 'Gabriel'];
  final bool permitirExcluir = true;
  final String nomeUsuario = 'Bernardo';
  final double quantidadeClientes = 2;
  final double quantidade = 2.4;

  final Map<String, Object> storageMap = {
    _StoragePath.CLIENTES: clientes,
    _StoragePath.PERMITIR_EXCLUIR: permitirExcluir,
    _StoragePath.NOME_USUARIO: nomeUsuario,
    _StoragePath.QUANTIDADE_CLIENTES: quantidadeClientes,
    _StoragePath.QUANTIDADE: quantidade,
  };

  void mockValues(Map<String, Object> values) => SharedPreferences.setMockInitialValues(values);

  setUp(() async {
    if (mock == true) mockValues(storageMap);
    sharedPreferences = await SharedPreferences.getInstance();
    localStorage = SharedPreferencesLocalStorageService(sharedPreferences);
  });

  group('Read', () {
    test('Deve retornar um List<String> caso for sucesso', () {
      var result = localStorage.read(_StoragePath.CLIENTES);

      expect(result, clientes);

      result = localStorage.read(_StoragePath.NOME_USUARIO);

      expect(result, nomeUsuario);

      result = localStorage.read(_StoragePath.PERMITIR_EXCLUIR);

      expect(result, permitirExcluir);

      result = localStorage.read(_StoragePath.QUANTIDADE);

      expect(result, quantidade);

      result = localStorage.read(_StoragePath.QUANTIDADE_CLIENTES);

      expect(result, quantidadeClientes);
    });
  });

  group('Delete, DeleteKeys e DeleteAll', () {
    test('Deve retornar true caso remover com sucesso', () async {
      final result = await localStorage.delete(_StoragePath.CLIENTES);

      expect(result, true);
      expect(localStorage.read(_StoragePath.CLIENTES), null);
    });

    test('Deve retornar true caso remover os 2 registros com sucesso', () async {
      final result = await localStorage.deleteKeys([_StoragePath.CLIENTES, _StoragePath.QUANTIDADE_CLIENTES]);

      final _clientes = localStorage.read(_StoragePath.CLIENTES);
      final _quantidadeClientes = localStorage.read(_StoragePath.QUANTIDADE_CLIENTES);

      expect(result, true);
      expect(_clientes, null);
      expect(_quantidadeClientes, null);
    });

    test('Deve retornar true caso remover todos os registros com sucesso', () async {
      final result = await localStorage.deleteAll();
      final storage = localStorage.read(_StoragePath.CLIENTES);

      expect(result, true);
      expect(storage, null);
    });
  });

  group('Add', () {
    setUpAll(() => mock = false);
    test('Deve retornar true caso adicionar o registro', () async {
      final result = await localStorage.add(_StoragePath.CLIENTES, clientes);

      expect(result, true);
      expect(localStorage.read(_StoragePath.CLIENTES), clientes);
    });

    test('Deve retornar um erro ao tentar adicionar um objeto não compatível', () async {
      mockValues(storageMap);

      expect(() async => await localStorage.add('test', {'test': 'value'}), throwsA(isA<AssertionError>()));
    });
  });
}
