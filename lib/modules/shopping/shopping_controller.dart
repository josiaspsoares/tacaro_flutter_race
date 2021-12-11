import 'package:flutter/material.dart';
import 'package:tacaro_flutter_race/modules/shopping/repositories/shopping_repository.dart';
import 'package:tacaro_flutter_race/shared/utils/state.dart';

class ShoppingController extends ChangeNotifier {
  final ShoppingRepository repository;

  AppState state = AppState.empty();

  final formKey = GlobalKey<FormState>();
  String _name = "";
  String _price = "";
  String _date = "";

  ShoppingController({required this.repository});

  void onChange({String? price, String? date, String? name}) {
    _name = name ?? _name;
    _price = price ?? _price;
    _date = date ?? _date;
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

  Future<void> create() async {
    if (validate()) {
      try {
        update(AppState.loading());
        final response = await repository.create(name: _name, price: _price, date: _date);
        update(AppState.success<bool>(response));
      } catch (e) {
        update(AppState.error(e.toString()));
      }
    }
  }
}
