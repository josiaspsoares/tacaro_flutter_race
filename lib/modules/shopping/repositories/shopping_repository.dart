abstract class ShoppingRepository {
  ShoppingRepository(da);

  Future<bool> create({required String name, required String price, required String date});
}
