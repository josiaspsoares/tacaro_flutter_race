import 'package:flutter/material.dart';
import 'package:tacaro_flutter_race/modules/login/pages/create_account/create_account_page.dart';
import 'package:tacaro_flutter_race/shared/models/user_model.dart';
import 'modules/home/home_page.dart';
import 'modules/login/login_page.dart';
import 'modules/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tá Caro?',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/home',
      routes: {
        '/splash': (context) => const SplashPage(),
        '/login': (context) => const LoginPage(),
        '/login/create-account': (context) => const CreateAccountPage(),
        '/home': (context) => HomePage(
              // user: ModalRoute.of(context)!.settings.arguments as UserModel,
            ),
      },
    );
  }
}
