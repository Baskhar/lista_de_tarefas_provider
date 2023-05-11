import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:todo_list_provider/app/app_module.dart';
import 'package:todo_list_provider/app/core/database/sqlite_adm_connection.dart';
import 'package:todo_list_provider/app/core/navigator/todo_list_navigator.dart';
import 'package:todo_list_provider/app/core/ui/todo_list_ui_config.dart';
import 'package:todo_list_provider/app/modules/auth/auth_module.dart';
import 'package:todo_list_provider/app/modules/home/home_module.dart';
import 'package:todo_list_provider/app/modules/splash/splash.page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_list_provider/app/modules/tarefas/tarefas_module.dart';

class AppWidget extends StatefulWidget {
  //final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {



  final sqliteAdmConnection = SqliteAdmConnection();
  @override
  void initState() {
    //observa uma classe
    super.initState();
    //initializeFlutterFire();
    //FirebaseApp app = await Firebase.initializeApp();
    //FirebaseAuth auth = FirebaseAuth.instance;
    WidgetsBinding.instance?.addObserver(sqliteAdmConnection);

  }
  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(sqliteAdmConnection);
    super.dispose();
  }
  // Future<void> initializeFlutterFire() async {
  //   try {
  //     await Firebase.initializeApp();
  //     setState(() {
  //       _initialized = true;
  //     });
  //   } catch (e) {
  //     print('erro conexão firebase');
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo List Provider',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('pt', 'BR'),
      ],
      //initialRoute: '/login',
      theme: TodoListUiConfig.theme,
      //navegação sem precisar de contexto
      navigatorKey: TodoListNavigator.navigatorKey,
      routes: {
        ...AuthModlule().routers,
        ...HomeModule().routers,
        ...TarefasModule().routers,
      },
      home: SplashPage(),

    );
  }
}
