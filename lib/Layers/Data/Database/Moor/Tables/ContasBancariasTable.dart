import 'package:drift/drift.dart';

import 'PessoasTable.dart';

@DataClassName("ContaBancaria")
class ContasBancarias extends Table {
  @override
  Set<Column> get primaryKey => {id};

  TextColumn get id => text()();
  TextColumn get idTitularDaConta => text().references(Pessoas, #id)();
  TextColumn get nome => text().withLength(max: 200)();
  IntColumn get agencia => integer()();
  IntColumn get numeroDaConta => integer()();
  TextColumn get observacao => text().nullable()();
  IntColumn get tipo => integer()();
  IntColumn get instituicaoBancaria => integer()();
  DateTimeColumn get dataDeCriacao => dateTime().clientDefault(() => DateTime.now())();
}
