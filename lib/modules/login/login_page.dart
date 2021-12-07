import 'package:flutter/material.dart';
import 'package:tacaro_flutter_race/shared/theme/app_theme.dart';
import 'package:tacaro_flutter_race/shared/widgets/button/button.dart';
import 'package:tacaro_flutter_race/shared/widgets/input_text/input_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.1, vertical: size.height * 0.15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: size.width * 0.5,
            ),
            const InputText(
              label: 'Email',
              hint: 'Digite seu email',
            ),
            SizedBox(height: size.height * 0.02),
            const InputText(
              label: 'Senha',
              hint: 'Digite sua senha',
            ),
            SizedBox(height: size.height * 0.035),
            Button(label: 'Entrar', size: size),
            SizedBox(height: size.height * 0.06),
            Button(label: 'Criar Conta', type: ButtonType.outline, size: size),
          ],
        ),
      ),
    );
  }
}