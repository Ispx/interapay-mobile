import 'package:drift/drift.dart';

import 'ComprovantesTable.dart';
import 'ContasBancariasTable.dart';


@DataClassName("Despesa")
class Despesas extends Table {
  @override
  Set<Column> get primaryKey => {id};

  TextColumn get id => text()();
  TextColumn get idContaBancaria => text().nullable().references(ContasBancarias, #id)();
  TextColumn get idComprovante => text().nullable().references(Comprovantes, #id)();
  TextColumn get nome => text().withLength(max: 200)();
  RealColumn get valorTotal => real()();
  IntColumn get formaDePagamento => integer()();
  TextColumn get chavePix => text()();
  IntColumn get obrigarComprovante => integer()();
  TextColumn get observacoes => text().nullable()();
  DateTimeColumn get dataDeCriacao => dateTime().clientDefault(() => DateTime.now())();
}
