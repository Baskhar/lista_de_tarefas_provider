import 'package:todo_list_provider/app/core/database/sqlite_connection_factory.dart';
import 'package:todo_list_provider/app/repositories/tarefas/tarefas_repository.dart';

class TarefasRepositoryImpl implements TarefasRepository {
  final SqliteConnectionFactory _sqliteConnectionFactory;

  TarefasRepositoryImpl(
      {required SqliteConnectionFactory sqliteConnectionFactory})
      : _sqliteConnectionFactory = sqliteConnectionFactory;

  @override
  Future<void> save(DateTime date, String description) async{
   final conn = await _sqliteConnectionFactory.openConnection();
   await conn.insert('todo', {
     'id': null,
     'descricao': description,
     'data_hora':date.toIso8601String(),
     'finalizado': 0
   });
  }
}
