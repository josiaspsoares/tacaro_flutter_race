import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:tacaro_flutter_race/modules/shopping/repositories/shopping_repository_impl.dart';
import 'package:tacaro_flutter_race/modules/shopping/shopping_controller.dart';
import 'package:tacaro_flutter_race/shared/services/app_database.dart';
import 'package:tacaro_flutter_race/shared/widgets/button/button.dart';
import 'package:tacaro_flutter_race/shared/widgets/input_text/input_text.dart';

class ShoppingBottomsheet extends StatefulWidget {
  const ShoppingBottomsheet({Key? key}) : super(key: key);

  @override
  State<ShoppingBottomsheet> createState() => _ShoppingBottomsheetState();
}

class _ShoppingBottomsheetState extends State<ShoppingBottomsheet> {
  late final ShoppingController _controller;

  @override
  void initState() {
    _controller = ShoppingController(
      repository: ShoppingRepositoryImpl(database: AppDatabase.instance),
    );
    _controller.addListener(() {
      _controller.state.when(
        success: (_) => Navigator.of(context).pop(),
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 16),
      child: Form(
        key: _controller.formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 32,
              ),
              InputText(
                label: "Produto",
                hint: "Digite um nome",
                onChanged: (value) => _controller.onChange(name: value),
                validator: (value) => value.isEmpty ? "Favor digitar um nome" : null,
              ),
              const SizedBox(
                height: 8,
              ),
              InputText(
                label: "Preço",
                hint: "Digite o valor",
                onChanged: (value) => _controller.onChange(price: value),
                validator: (value) => value.isEmpty ? "Favor digitar um valor" : null,
                inputFormatters: [
                  MoneyInputFormatter(
                    leadingSymbol: "R\$ ",
                    thousandSeparator: ThousandSeparator.None,
                  ),
                ],
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 8,
              ),
              InputText(
                label: "Data da compra",
                hint: "Digite dd/mm/aaaa",
                onChanged: (value) => _controller.onChange(date: value),
                validator: (value) => value.isEmpty ? "Favor digitar uma data" : null,
                inputFormatters: [
                  MaskedInputFormatter('00/00/0000'),
                ],
                keyboardType: TextInputType.datetime,
              ),
              const SizedBox(
                height: 28,
              ),
              AnimatedBuilder(
                animation: _controller,
                builder: (_, __) => _controller.state.when(
                  loading: () => Column(
                    children: const [
                      CircularProgressIndicator(),
                    ],
                  ),
                  error: (message, _) => Column(
                    children: [
                      Text(
                        message,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                  orElse: () => Button(
                      label: "Adicionar",
                      onTap: () {
                        _controller.create();
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
