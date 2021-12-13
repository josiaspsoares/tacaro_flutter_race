import 'package:tacaro_flutter_race/shared/models/user_model.dart';
import 'package:tacaro_flutter_race/shared/services/app_database.dart';

import 'login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final AppDatabase database;

  LoginRepositoryImpl({
    required this.database,
  });

  @override
  Future<UserModel> createAccount({required String name, required String email, required String password}) async {
    final response = await database.createAccount(name: name, email: email, password: password);
    return response;
  }

  @override
  Future<UserModel> login({required String email, required String password}) async {
    final response = await database.login(email: email, password: password);
    return response;
  }

  @override
  Future<UserModel> getUser({required String id}) async {
    final response = await database.getUser(id: id);
    return response;
  }
}
