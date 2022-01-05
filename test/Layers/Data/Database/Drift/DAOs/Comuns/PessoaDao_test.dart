import 'package:test/test.dart';

import 'package:interapay/Layers/Dominio/Enums/Financas/TipoDePessoa.dart';
import 'package:interapay/Layers/Data/Database/Drift/DAOs/Comuns/PessoasDao.dart';
import 'package:interapay/Layers/Data/Database/Drift/DriftSqliteDatabase.dart';
import 'package:uuid/uuid.dart';

void main() {
  late DriftSqliteDatabase database;
  late PessoasDao dao;

  Pessoa pessoaCriada = Pessoa(
    cpfCnpj: '20054753783',
    dataDeCriacao: DateTime.now(),
    id: 'ff9af76a-46e9-460a-9306-5eee4bf713ed',
    nome: 'Bernardo Veras',
    tipoDePessoa: 0,
  );

  setUpAll(() async {
    database = await DriftSqliteDatabase.init(inMemory: true);
    dao = database.pessoasDao;
    await database.batch((b) => b.insert(database.pessoas, pessoaCriada));
  });

  tearDownAll(() async => await database.close());

  test('Deve retornar uma lista de PessoaEntity', () async {
    var result = await dao.obter();

    expect(result.length, 1);
    expect(result[0].nome, pessoaCriada.nome);
  });

  test('Deve retornar um PessoaEntity caso exista na lista', () async {
    var result = await dao.obterPorId('');

    expect(result, null);

    result = await dao.obterPorId(pessoaCriada.id);

    expect(result, isNotNull);
  });

  test('Deve inserir ou alterar a pessoa no banco de dados', () async {
    final Pessoa _pessoa = Pessoa(
      id: Uuid().v4(),
      nome: 'Vinicius Veras',
      email: 'vinicius@vvssistemas.com.br',
      cpfCnpj: '09034357724',
      telefone: '21983597649',
      tipoDePessoa: TipoDePessoa.Fisica.index,
      dataDeCriacao: DateTime.now(),
    );

    pessoaCriada = pessoaCriada.copyWith(email: 'alterado@test.com');

    await dao.inserirOuAlterar(_pessoa);
    await dao.inserirOuAlterar(pessoaCriada);

    var pessoas = await dao.obter();

    expect(pessoas.length, 2);
    expect(pessoas.where((e) => e.id == pessoaCriada.id).first.email, 'alterado@test.com');
  });

  test('Deve deletar a pessoa no banco de dados', () async {
    var deleteResult = await dao.deletarPorId(pessoaCriada.id);

    expect(deleteResult, true);

    var pessoas = await dao.obter();

    expect(pessoas.any((e) => e.id == pessoaCriada.id), false);
  });
}
