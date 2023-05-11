import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/core/notifier/default_change_notifier.dart';
import 'package:todo_list_provider/app/exception/auth_exceptions.dart';
import 'package:todo_list_provider/app/services/user/user_service.dart';

class RegisterController extends DefaultChafeNotifier {
  final UserService _userService;

  RegisterController({required UserService userService})
      : _userService = userService;

  void registerUser(String email, String password) async {
    try {
      //start do register
      showLoadingAndResetState();
      //notifica quem está escutando
      notifyListeners();
      final user = await _userService.register(email, password);

      if (user != null) {
        //sucesso
        sucess();
      } else {
        //erro
        setError('Error ao Registrar o suário');
      }
    } on AuthException catch (e) {
      setError(e.message);
    } finally {
      hideLoading();
      notifyListeners();
    }
  }
}
