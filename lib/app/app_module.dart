import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/app_widget.dart';
import 'package:todo_list_provider/app/core/auth/auth_provider.dart';
import 'package:todo_list_provider/app/core/database/sqlite_connection_factory.dart';
import 'package:todo_list_provider/app/repositories/user/user_repository.dart';
import 'package:todo_list_provider/app/repositories/user/user_repository_impl.dart';
import 'package:todo_list_provider/app/services/user/user_service.dart';
import 'package:todo_list_provider/app/services/user/user_service_impl.dart';

//Classe destinada a gerenciar todas as classes compartilhadas por vários modos
class AppModule extends StatelessWidget {
  const AppModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => FirebaseAuth.instance),
        Provider(
          create: (_) => SqliteConnectionFactory(),
          //ao cair no método ele instancia a classe SqliteConnectionFactory
          lazy: false,
        ),
        //buscando a instancia do firebase auth através do context
        Provider<UserRepository>(
            create: (context) =>
                UserRepositoryImpl(firebaseAuth: context.read())),
        Provider<UserService>(
            create: (context) =>
                UserServiceImpl(userRepository: context.read())),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(
              firebaseAuth: context.read(), userService: context.read())
            ..loadListener(),
            //assim que carregar ele chama
            lazy: false,
        )
      ],
      child: AppWidget(),
    );
  }
}
