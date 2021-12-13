import 'package:tacaro_flutter_race/shared/models/shopping_model.dart';
import 'package:tacaro_flutter_race/shared/services/app_database.dart';

import 'feed_repository.dart';

class FeedRepositoryImpl implements FeedRepository {
  final AppDatabase database;

  FeedRepositoryImpl({required this.database});

  @override
  Future<List<ShoppingModel>> getAll() async {
    final response = await database.getAll(table: 'shopping');
    return response.map((e) => ShoppingModel.fromMap(e)).toList();
  }

  @override
  Future<bool> deleteShopping({required String id}) async {
    final response = await database.delete(table: 'shopping', id: id);
    return response;
  }
}
