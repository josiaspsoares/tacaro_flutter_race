import 'package:flutter/material.dart';
import 'package:tacaro_flutter_race/modules/login/repositories/login_repository_impl.dart';
import 'package:tacaro_flutter_race/shared/services/app_database.dart';
import 'package:tacaro_flutter_race/shared/theme/app_theme.dart';
import 'package:tacaro_flutter_race/shared/widgets/button/button.dart';
import 'package:tacaro_flutter_race/shared/widgets/input_text/input_text.dart';
import 'package:validators/validators.dart';

import 'create_account_controller.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  late final CreateAccountController _controller;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _controller = CreateAccountController(
      repository: LoginRepositoryImpl(database: AppDatabase.instance),
    );
    _controller.addListener(() {
      _controller.state.when(
        success: (value) => Navigator.pop(context),
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
      appBar: AppBar(
        backgroundColor: AppTheme.colors.background,
        elevation: 0,
        leading: BackButton(
          color: AppTheme.colors.backButton,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.1, vertical: size.height * 0.1),
        child: Form(
          key: _controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Criando uma conta',
                style: AppTheme.textStyles.title,
              ),
              SizedBox(height: size.height * 0.015),
              Text(
                'Mantenha seus gastos em dia',
                style: AppTheme.textStyles.subtitle,
              ),
              SizedBox(height: size.height * 0.035),
              InputText(
                label: 'Nome',
                hint: 'Digite seu nome completo',
                validator: (value) => value.length >= 3 ? null : 'Digite um nome válido',
                onChanged: (value) => _controller.onChange(name: value),
              ),
              SizedBox(height: size.height * 0.02),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircularProgressIndicator(),
                        ],
                      ),
                    ],
                  ),
                  orElse: () => Button(
                    label: 'Criar Conta',
                    onTap: () {
                      _controller.register();
                    },
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
