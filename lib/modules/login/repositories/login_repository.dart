import 'package:tacaro_flutter_race/shared/models/user_model.dart';

abstract class LoginRepository {
  Future<UserModel> login({required String email, required String password});
  Future<UserModel> createAccount({required String name, required String email, required String password});
}