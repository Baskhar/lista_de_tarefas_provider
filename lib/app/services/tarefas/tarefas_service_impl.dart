import 'package:todo_list_provider/app/repositories/tarefas/tarefas_repository.dart';

import 'package:todo_list_provider/app/services/tarefas/tarefas_service.dart';

class TarefasServiceImpl implements TarefasService {
  final TarefasRepository _tarefasRepository;

  TarefasServiceImpl({required TarefasRepository tarefasRepository})
      : _tarefasRepository = tarefasRepository;

  @override
  Future<void> save(DateTime date, String description) =>
      _tarefasRepository.save(date, description);
}
