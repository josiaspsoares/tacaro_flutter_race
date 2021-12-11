import 'package:tacaro_flutter_race/shared/models/shopping_model.dart';

abstract class FeedRepository {
  Future<List<ShoppingModel>> getAll();
}