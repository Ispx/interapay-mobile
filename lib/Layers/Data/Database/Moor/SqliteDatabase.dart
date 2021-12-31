import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:get/get.dart' as getx;

import '../IDatabase.dart';
import 'Tables/Tables.dart';

part 'SqliteDatabase.g.dart';

Future<LazyDatabase> _openConnection() async {
  return LazyDatabase(() async {
    final Directory folder = await getApplicationDocumentsDirectory();
    final File file = File(p.join(folder.path, '${SqliteDatabase.DATABASE_NAME}.sqlite'));

    return NativeDatabase(file, logStatements: true);
  });
}

@DriftDatabase(
  tables: [
    Comprovantes,
    ContasBancarias,
    Despesas,
    ParticipantesDaDespesa,
    Pessoas,
  ],
)
class SqliteDatabase extends _$SqliteDatabase implements IDatabase {
  SqliteDatabase._(LazyDatabase database) : super(database);

  static SqliteDatabase? _instance;

  static const VERSION = 1;
  static const DATABASE_NAME = 'juntapay';

  static Future<SqliteDatabase> init() async {
    var _connection = await _openConnection();

    _instance ??= SqliteDatabase._(_connection);

    return _instance!;
  }

  static Future<SqliteDatabase> criarBancoDeDados() async {
    await init();

    await _instance!.createMigrator().createAll();

    return _instance!;
  }

  @override
  int get schemaVersion => VERSION;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();

        // await batch((b) => b.insert(
        //     pessoas,
        //     Pessoa(
        //       cpfCnpj: '20054753783',
        //       dataDeCriacao: DateTime.now(),
        //       id: 'ff9af76a-46e9-460a-9306-5eee4bf713ed',
        //       nome: 'Bernardo Veras',
        //       tipoDePessoa: 0,
        //     )));
      },
    );
  }
}

IDatabase get database => getx.Get.find<IDatabase>();
