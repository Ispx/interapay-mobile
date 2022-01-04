import 'package:drift/drift.dart';

import '../Tables/PessoasTable.dart';
import '../../../../Dominio/Entidades/Comuns/Pessoa.dart';
import '../../../../Dominio/Mappers/Comuns/PessoaMapper.dart';
import '../DriftSqliteDatabase.dart';

part 'PessoasDao.g.dart';

@DriftAccessor(tables: [Pessoas])
class PessoasDao extends DatabaseAccessor<DriftSqliteDatabase> with _$PessoasDaoMixin {
  PessoasDao(DriftSqliteDatabase db) : super(db);

  Future<List<PessoaEntity>> obter() async {
    final List<Pessoa> result = await (select(pessoas)).get();

    return result.map((e) => PessoaMapper.fromTable(e)).toList();
  }

  Future<PessoaEntity?> obterPorId(String id) async {
    final Pessoa? result = await (select(pessoas)..where((x) => x.id.equals(id))).getSingleOrNull();

    if (result == null) return null;

    return PessoaMapper.fromTable(result);
  }

  Future<PessoaEntity> inserirOuAlterar(PessoaEntity pessoa) async {
    await into(pessoas).insertOnConflictUpdate(PessoaMapper.toTable(pessoa));

    return pessoa;
  }

  Future<bool> deletarPorId(String id) async {
    final int rowsAffected = await (delete(pessoas)..where((x) => x.id.equals(id))).go();

    return rowsAffected > 0;
  }
}
