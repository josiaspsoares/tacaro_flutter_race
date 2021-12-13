import 'package:flutter/material.dart';
import 'package:tacaro_flutter_race/modules/feed/reposiories/feed_repository.dart';
import 'package:tacaro_flutter_race/shared/models/product_model.dart';
import 'package:tacaro_flutter_race/shared/models/shopping_model.dart';
import 'package:tacaro_flutter_race/shared/utils/state.dart';

class FeedController extends ChangeNotifier {
  final FeedRepository repository;
  AppState state = AppState.empty();

  FeedController({required this.repository});

  void update(AppState state) {
    this.state = state;
    notifyListeners();
  }

  List<ShoppingModel> get shoppingList => state.when(
        success: (value) => value,
        orElse: () => [],
      );

  double get sumTotal {
    var sum = 0.0;

    for (var shopping in shoppingList) {
      sum += shopping.price;
    }

    return sum;
  }

  List<ProductModel> get productsList {
    final products = <ProductModel>[];
    for (var shopping in shoppingList) {
      final product = ProductModel(
        name: shopping.name,
        lastPrice: 0.0,
        currentPrice: shopping.price,
      );

      final index = products.indexWhere((element) => element.name == product.name);

      if (index != -1) {
        final currentProduct = products[index];
        products[index] = currentProduct.copyWith(
          lastPrice: shopping.price,
        );
      } else {
        products.add(product);
      }
    }

    return products;
  }

  double calcChart(List<ProductModel> products) {
    var up = 0.0;
    var down = 0.0;

    for (var product in products) {
      if (product.currentPrice > product.lastPrice && product.lastPrice != 0.0) {
        up += 1.0;
      } else {
        down += 1.0;
      }
    }

    final result = up / (down + up);
    return result;
  }

  Future<void> getData() async {
    try {
      update(AppState.loading());
      final response = await repository.getAll();
      update(AppState.success<List<ShoppingModel>>(response));
    } catch (e) {
      update(AppState.error(e.toString()));
    }
  }

  Future<void> deleteShopping({required String id}) async {
    try {
      await repository.deleteShopping(id: id);
      getData();
    } catch (e) {
      update(AppState.error(e.toString()));
    }
  }
}
