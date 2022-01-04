import 'package:drift/drift.dart';

@DataClassName("Comprovante")
class Comprovantes extends Table {
  @override
  Set<Column> get primaryKey => {id};

  TextColumn get id => text()();
  BlobColumn get imagem => blob()();
}