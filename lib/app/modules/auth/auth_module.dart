import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/core/modules/todo_list_module.dart';
import 'package:todo_list_provider/app/modules/auth/login/login_controller.dart';
import 'package:todo_list_provider/app/modules/auth/login/login_page.dart';
import 'package:todo_list_provider/app/modules/auth/register/register_controller.dart';
import 'package:todo_list_provider/app/modules/auth/register/register_page.dart';

class AuthModlule extends TodoListModule {
  AuthModlule()
      : super(
          bindings: [
            ChangeNotifierProvider(
                create: (context) =>
                    LoginController(userService: context.read())),
            ChangeNotifierProvider(
                create: (context) =>
                    RegisterController(userService: context.read())),
          ],
          routers: {
            '/login': (_) => LoginPage(),
            '/register': (_) => RegisterPage(),
          },
        );
}
