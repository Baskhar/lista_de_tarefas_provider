
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/core/modules/todo_list_module.dart';
import 'package:todo_list_provider/app/modules/tarefas/tarefas_create_controller.dart';
import 'package:todo_list_provider/app/modules/tarefas/tarefas_create_page.dart';
import 'package:todo_list_provider/app/repositories/tarefas/tarefas_repository.dart';
import 'package:todo_list_provider/app/repositories/tarefas/tarefas_repository_impl.dart';
import 'package:todo_list_provider/app/services/tarefas/tarefas_service.dart';
import 'package:todo_list_provider/app/services/tarefas/tarefas_service_impl.dart';

class TarefasModule extends TodoListModule {
  TarefasModule()
      : super(
          bindings: [
            Provider<TarefasRepository>(
              create: (context) => TarefasRepositoryImpl(
                sqliteConnectionFactory: context.read(),
              ),
            ),
            Provider<TarefasService>(
              create: (context) => TarefasServiceImpl(
                tarefasRepository: context.read(),
              ),
            ),
            ChangeNotifierProvider(
              create: (context) => TarefasCreateController(
                tarefasService: context.read(),
              ),
            )
          ],
          routers: {
            '/tarefas/create': (context) => TarefasCreatePage(
                  controller: context.read(),
                ),
          },
        );
}
