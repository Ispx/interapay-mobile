import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:get/get.dart' as getx;

import '../IDatabase.dart';
import 'DAOs/Comuns/ContasBancariasDao.dart';
import 'DAOs/Comuns/PessoasDao.dart';
import 'Tables/Tables.dart';

part 'DriftSqliteDatabase.g.dart';

Future<LazyDatabase> _openConnection([bool inMemory = false]) async {
  return LazyDatabase(() async {
    if (inMemory == true) return NativeDatabase.memory(logStatements: false);

    final Directory folder = await getApplicationDocumentsDirectory();
    final File file = File(p.join(folder.path, '${DriftSqliteDatabase.DATABASE_NAME}.sqlite'));

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
  daos: [
    PessoasDao,
    ContasBancariasDao,
  ],
)
class DriftSqliteDatabase extends _$DriftSqliteDatabase implements IDatabase {
  DriftSqliteDatabase._(LazyDatabase database) : super(database);

  static DriftSqliteDatabase? _instance;

  static const VERSION = 1;
  static const DATABASE_NAME = 'juntapay';

  static Future<DriftSqliteDatabase> init({bool inMemory = false}) async {
    var _connection = await _openConnection(inMemory);

    _instance ??= DriftSqliteDatabase._(_connection);

    return _instance!;
  }

  static Future<DriftSqliteDatabase> criarBancoDeDados() async {
    await init();
    // A função abaixo deve ser descomentada quando tiver o login pronto.
    // Ao efetuar login, chamar o criarBancoDeDados.
    // await _instance!.createMigrator().createAll();

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
