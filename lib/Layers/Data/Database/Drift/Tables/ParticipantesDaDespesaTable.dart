import 'package:drift/drift.dart';

import 'PessoasTable.dart';

@DataClassName("ParticipanteDaDespesa")
class ParticipantesDaDespesa extends Table {
  TextColumn get idPessoa => text().references(Pessoas, #id)();
  RealColumn get valorASerPago => real()();
  DateTimeColumn get dataDeCriacao => dateTime().clientDefault(() => DateTime.now())();
}
