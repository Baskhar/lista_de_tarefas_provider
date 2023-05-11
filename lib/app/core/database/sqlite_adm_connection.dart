import 'package:flutter/cupertino.dart';
import 'package:todo_list_provider/app/core/database/sqlite_connection_factory.dart';

//observa o app
class SqliteAdmConnection with WidgetsBindingObserver {
  //instancia da conexão
  final connection = SqliteConnectionFactory();
  @override
  //monita  o que o usuário fez
  void didChangeAppLifecycleState(AppLifecycleState state) {

    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
      //pausa a conexão
      //connection.closeConnection();
      case AppLifecycleState.paused:
      //connection.closeConnection();
      case AppLifecycleState.detached:
        connection.closeConnection();
        break;
    }
    super.didChangeAppLifecycleState(state);
  }
}
