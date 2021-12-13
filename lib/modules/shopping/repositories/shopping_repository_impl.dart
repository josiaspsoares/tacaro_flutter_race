import 'package:intl/intl.dart';
import 'package:tacaro_flutter_race/modules/shopping/repositories/shopping_repository.dart';
import 'package:tacaro_flutter_race/shared/services/app_database.dart';

class ShoppingRepositoryImpl implements ShoppingRepository {
  final AppDatabase database;

  ShoppingRepositoryImpl({required this.database});

  @override
  Future<bool> create({required String name, required String price, required String date}) async {
    var inputFormat = DateFormat('dd/MM/yyyy');
    var inputDate = inputFormat.parse(date);
    var outputFormat = DateFormat('MM/dd/yyyy');

    final dateSanitized = outputFormat.format(inputDate);
    final priceSanitized = double.parse(price.replaceAll('R\$', ''));

    final response = await database.create(table: "shopping", data: {"name": name, "price": priceSanitized, "date": dateSanitized});
    return response;
  }
}
