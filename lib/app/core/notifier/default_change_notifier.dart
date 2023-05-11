import 'package:flutter/cupertino.dart';

class DefaultChafeNotifier extends ChangeNotifier {
  //atributos
  bool _loading = false;
  String? _error;
  bool _success = false;

  //encapsulando os atributos
  bool get loading => _loading;

  String? get error => _error;

  bool get hasError => _error != null;

  bool get isSuccess => _success;

  //métodos
  void showLoading() => _loading = true;
  void hideLoading() => _loading = false;
  void sucess() => _success = true;
  void setError(String? error) => _error = error;
  void showLoadingAndResetState() {
    showLoading();
    resetState();
  }
  void resetState() {
    setError(null);
    _success = false;
  }
}
