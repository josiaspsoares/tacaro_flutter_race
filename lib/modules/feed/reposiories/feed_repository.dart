import 'package:tacaro_flutter_race/shared/models/shopping_model.dart';

abstract class FeedRepository {
  Future<bool> deleteShopping({required String id});
  Future<List<ShoppingModel>> getAll();
}
