import 'package:drift/drift.dart';

@DataClassName("Pessoa")
class Pessoas extends Table {
  @override
  Set<Column> get primaryKey => {id};

  TextColumn get id => text()();
  TextColumn get nome => text().withLength(max: 200)();
  TextColumn get email => text().nullable()();
  TextColumn get telefone => text().nullable()();
  TextColumn get cpfCnpj => text()();
  TextColumn get observacao => text().nullable()();
  IntColumn get tipoDePessoa => integer()();
  DateTimeColumn get dataDeCriacao => dateTime().clientDefault(() => DateTime.now())();
}
