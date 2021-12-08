import 'package:flutter/material.dart';
import 'package:tacaro_flutter_race/shared/utils/state.dart';

class CreateAccountController extends ChangeNotifier {
  AppState state = AppState.empty();
  final formKey = GlobalKey<FormState>();
  String _name = "";
  String _email = "";
  String _password = "";

  void onChange({String? email, String? password, String? name}) {
    _name = name ?? _name;
    _email = email ?? _email;
    _password = password ?? _password;
  }

  void update(AppState state) {
    this.state = state;
    notifyListeners();
  }

  bool validate() {
    final form = formKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    }

    return false;
  }

  Future<void> register() async {
    if (validate()) {
      try {
        update(AppState.loading());
        await Future.delayed(const Duration(seconds: 4));
        update(AppState.success<String>("Conta criada com sucesso!"));
      } catch (e) {
        update(AppState.error("Não foi possível criar conta!"));
      }
    }
  }
}
