import 'package:drift/drift.dart';

import 'CrudBasicoDriftDao.dart';
import '../../Tables/PessoasTable.dart';
import '../../DriftSqliteDatabase.dart';

part 'PessoasDao.g.dart';

@DriftAccessor(tables: [Pessoas])
class PessoasDao extends CrudBasicoDriftDao<Pessoa> with _$PessoasDaoMixin {
  PessoasDao(DriftSqliteDatabase _db) : super(_db);
}
