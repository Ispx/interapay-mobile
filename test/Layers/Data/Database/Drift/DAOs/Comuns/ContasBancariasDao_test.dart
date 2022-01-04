import 'package:juntapay/Layers/Data/Database/Drift/DAOs/Comuns/ContasBancariasDao.dart';
import 'package:test/test.dart';

import 'package:juntapay/Layers/Dominio/Enums/Financas/TipoDePessoa.dart';
import 'package:juntapay/Layers/Data/Database/Drift/DAOs/Comuns/PessoasDao.dart';
import 'package:juntapay/Layers/Data/Database/Drift/DriftSqliteDatabase.dart';
import 'package:uuid/uuid.dart';

void main() {
  late DriftSqliteDatabase database;
  late ContasBancariasDao dao;

  ContaBancaria contaBancariaCriada = ContaBancaria(
    dataDeCriacao: DateTime.now(),
    id: 'ff9af76a-46e9-460a-9306-5eee4bf713ed',
    nome: 'Conta 1',
    idTitularDaConta: 'ff9af76a-46e9-460a-9306-5eee4bf713ed',
    agencia: 0,
    instituicaoBancaria: 0,
    numeroDaConta: 0,
    tipo: 0,
    observacao: 'obs'
  );

  setUpAll(() async {
    database = await DriftSqliteDatabase.init(inMemory: true);
    dao = database.contasBancariasDao;
    await database.batch((b) => b.insert(database.contasBancarias, contaBancariaCriada));
  });

  tearDownAll(() async => await database.close());

  test('Deve retornar uma lista de ContaBancariaEntity', () async {
    var result = await dao.obter();

    expect(result.length, 1);
    expect(result[0].nome, contaBancariaCriada.nome);
  });

  test('Deve retornar um ContaBancariaEntity caso exista na lista', () async {
    var result = await dao.obterPorId('');

    expect(result, null);

    result = await dao.obterPorId(contaBancariaCriada.id);

    expect(result, isNotNull);
  });

  test('Deve inserir ou alterar a conta bancaria no banco de dados', () async {
    final ContaBancaria _contaBancaria = ContaBancaria(
      id: Uuid().v4(),
      nome: 'Conta 2',
      agencia: 2,
      idTitularDaConta: Uuid().v4(),
      instituicaoBancaria: 2,
      numeroDaConta: 4,
      tipo: 0,
      observacao: 'obs 12',
      dataDeCriacao: DateTime.now(),
    );

    contaBancariaCriada = contaBancariaCriada.copyWith(nome: 'Nome alterado');

    await dao.inserirOuAlterar(_contaBancaria);
    await dao.inserirOuAlterar(contaBancariaCriada);

    var pessoas = await dao.obter();

    expect(pessoas.length, 2);
    expect(pessoas.where((e) => e.id == contaBancariaCriada.id).first.nome, 'Nome alterado');
  });

  test('Deve deletar a conta bancaria no banco de dados', () async {
    var deleteResult = await dao.deletarPorId(contaBancariaCriada.id);

    expect(deleteResult, true);

    var pessoas = await dao.obter();

    expect(pessoas.any((e) => e.id == contaBancariaCriada.id), false);
  });
}
