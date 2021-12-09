import 'package:flutter/material.dart';
import 'package:tacaro_flutter_race/modules/login/repositories/login_repository_impl.dart';
import 'package:tacaro_flutter_race/shared/services/app_database.dart';
import 'package:tacaro_flutter_race/shared/theme/app_theme.dart';
import 'package:tacaro_flutter_race/shared/widgets/button/button.dart';
import 'package:tacaro_flutter_race/shared/widgets/input_text/input_text.dart';
import 'package:validators/validators.dart';

import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginController _controller;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _controller = LoginController(
      repository: LoginRepositoryImpl(database: AppDatabase.instance),
    );
    _controller.addListener(() {
      _controller.state.when(
        success: (value) => Navigator.pushNamed(context, '/home', arguments: value),
        error: (message, _) => _scaffoldKey.currentState!.showBottomSheet(
          (context) => BottomSheet(
            onClosing: () {},
            builder: (context) => Center(
              child: Text(message),
            ),
          ),
        ),
        orElse: () {},
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppTheme.colors.background,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.1, vertical: size.height * 0.15),
        child: Form(
          key: _controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: size.width * 0.5,
              ),
              InputText(
                label: 'Email',
                hint: 'Digite seu email',
                validator: (value) => isEmail(value) ? null : 'Digite um email válido',
                onChanged: (value) => _controller.onChange(email: value),
              ),
              SizedBox(height: size.height * 0.02),
              InputText(
                label: 'Senha',
                hint: 'Digite sua senha',
                obscure: true,
                validator: (value) => value.length >= 6 ? null : 'Digite uma senha mais forte',
                onChanged: (value) => _controller.onChange(password: value),
              ),
              SizedBox(height: size.height * 0.035),
              AnimatedBuilder(
                animation: _controller,
                builder: (_, __) => _controller.state.when(
                  loading: () => Column(
                    children: [
                      SizedBox(height: size.height * 0.06),
                      const CircularProgressIndicator(),
                    ],
                  ),
                  orElse: () => Column(
                    children: [
                      Button(
                        label: 'Entrar',
                        onTap: () {
                          _controller.login();
                        },
                      ),
                      SizedBox(height: size.height * 0.06),
                      Button(
                        label: 'Criar Conta',
                        type: ButtonType.outline,
                        onTap: () {
                          Navigator.pushNamed(context, '/login/create-account');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
