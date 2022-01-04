import 'package:drift/drift.dart';

// import '../../../ICrudBasicoDao.dart';
import '../../../ICrudBasicoDao.dart';
import '../../DriftSqliteDatabase.dart';

part 'CrudBasicoDriftDao.g.dart';

@DriftAccessor()
class CrudBasicoDriftDao<TEntidade extends DataClass> extends DatabaseAccessor<DriftSqliteDatabase>
    with _$CrudBasicoDriftDaoMixin
    implements ICrudBasicoDao<TEntidade> {
  CrudBasicoDriftDao(DriftSqliteDatabase db) : super(db);

  dynamic get _table {
    switch (TEntidade) {
      case Pessoa:
        return db.pessoas;
        case ContaBancaria:
        return db.contasBancarias;
    }

    throw AssertionError('Tabela não encontrada');
  }

  // @override
  Future<List<TEntidade>> obter() async => (await (select(_table)).get()).map((e) => e as TEntidade).toList();
  // @override
  Future<TEntidade?> obterPorId(String id) async {
    var where = CustomExpression<bool>("id = '$id'");

    var result = await (select(_table)..where((x) => where)).getSingleOrNull();

    if (result == null) return null;

    return result;
  }

  // @override
  Future<TEntidade> inserirOuAlterar(TEntidade pessoa) async {
    await into(_table).insertOnConflictUpdate(pessoa as Insertable);

    return pessoa;
  }

  // @override
  Future<bool> deletarPorId(String id) async {
    var where = CustomExpression<bool>("id = '$id'");

    final int rowsAffected = await (delete(_table)..where((x) => where)).go();

    return rowsAffected > 0;
  }
}
