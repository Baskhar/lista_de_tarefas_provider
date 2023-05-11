//classe de conexões
//padrão singleton, uam instância

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:synchronized/synchronized.dart';
import 'package:todo_list_provider/app/core/database/sqlite_migration_factory.dart';

class SqliteConnectionFactory {
  static SqliteConnectionFactory? _instance;

  static const _VERSION = 1;
  static const _DATABASE_NAME = 'LISTA_TAREFA_PROVIDER';

  //controla o banco de dados
  Database? _db;
  final _lock = Lock();

  //construtor privado
  SqliteConnectionFactory._();



  factory SqliteConnectionFactory() {
    if (_instance == null) {
      _instance = SqliteConnectionFactory._();
    }
    return _instance!;
  }

  //inicia coneção com o banco
  Future<Database> openConnection() async {
    var databasePath = await getDatabasesPath();
    var databasePathFinal = join(databasePath, _DATABASE_NAME);
    if (_db == null) {
      //controla o número de conexões com o banco
      await _lock.synchronized(() async {
        //impede de abrir uma nova conexão do 0
        if (_db == null) {
          _db = await openDatabase(
            databasePathFinal,
            version: _VERSION,
            onConfigure: _onConfigure,
            onCreate: _onCreate,
            onUpgrade: _onUpgrade,
            onDowngrade: _onDowngrade,
          );
        }
      });
    }

    return _db!;
  }

  //método que fecha a conexão
  void closeConnection() {
    _db?.close();
    _db = null;
  }

  //métodos de conexão
  Future<void> _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }
  Future<void> _onCreate(Database db,int version) async {
    final batch = db.batch();

    final migrations = SqliteMigrationFactory().getCreateMigration();
    //pega todas as migrations e executa cada uma delas
    for (var migration in migrations){
      migration.create(batch);
    }

    batch.commit();
  }
  Future<void> _onUpgrade(Database db, int version, int oldVersion) async {
    final batch = db.batch();

    final migrations = SqliteMigrationFactory().getUpgradeMigration(oldVersion);
    //pega todas as migrations e executa cada uma delas
    for (var migration in migrations){
      migration.update(batch);
    }

    batch.commit();
  }
  Future<void> _onDowngrade(Database db, int version, int oldVersion) async {}
}
