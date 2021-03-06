import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tacaro_flutter_race/modules/login/repositories/login_repository.dart';
import 'package:tacaro_flutter_race/shared/models/user_model.dart';
import 'package:tacaro_flutter_race/shared/utils/state.dart';

class LoginController extends ChangeNotifier {
  final LoginRepository repository;

  AppState state = AppState.empty();

  final formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";

  LoginController({required this.repository});

  void onChange({String? email, String? password}) {
    _email = email ?? _email;
    _password = password ?? _password;
  }

  bool validate() {
    final form = formKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    }

    return false;
  }

  void update(AppState state) {
    this.state = state;
    notifyListeners();
  }

  Future<void> login() async {
    if (validate()) {
      try {
        update(AppState.loading());
        final response = await repository.login(email: _email, password: _password);

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('id', response.id);

        update(AppState.success<UserModel>(response));
      } catch (e) {
        update(
          AppState.error(
            e.toString(),
          ),
        );
      }
    }
  }

  Future<UserModel?> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final id = prefs.getString('id');

    if (id != null) {
      try {
        final response = await repository.getUser(id: id);
        return response;
      } catch (e) {
        update(
          AppState.error(
            e.toString(),
          ),
        );
      }
    }
  }
}
