import 'package:drift/drift.dart';

import 'CrudBasicoDriftDao.dart';
import '../../Tables/ContasBancariasTable.dart';
import '../../DriftSqliteDatabase.dart';

part 'ContasBancariasDao.g.dart';

@DriftAccessor(tables: [ContasBancarias])
class ContasBancariasDao extends CrudBasicoDriftDao<ContaBancaria> with _$ContasBancariasDaoMixin {
  ContasBancariasDao(DriftSqliteDatabase _db) : super(_db);
}
