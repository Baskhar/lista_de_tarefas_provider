import 'package:todo_list_provider/app/core/notifier/default_change_notifier.dart';
import 'package:todo_list_provider/app/services/tarefas/tarefas_service.dart';

class TarefasCreateController extends DefaultChafeNotifier {
  final TarefasService _tarefasService;
  DateTime? _selectedDate;

  TarefasCreateController({required TarefasService tarefasService})
      : _tarefasService = tarefasService;

  set selectedDate(DateTime? selectedDate) {
    resetState();
    _selectedDate = selectedDate;
    notifyListeners();
  }

  DateTime? get selectedDate => _selectedDate;

  void save(String description) async {
    try {
      showLoadingAndResetState();
      notifyListeners();
      if (_selectedDate != null) {
        await _tarefasService.save(_selectedDate!, description);
        sucess();
      } else {
        setError('Data da tarefa não selecionada');
      }
    } catch (e, s) {
      print(e);
      print(s);
      setError('Erro ao cadastrar tarefa');
    } finally {
      hideLoading();
      notifyListeners();
    }
  }
}
