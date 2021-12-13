import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tacaro_flutter_race/modules/feed/feed_controller.dart';
import 'package:tacaro_flutter_race/modules/feed/reposiories/feed_repository_impl.dart';
import 'package:tacaro_flutter_race/shared/models/product_model.dart';
import 'package:tacaro_flutter_race/shared/models/shopping_model.dart';
import 'package:tacaro_flutter_race/shared/services/app_database.dart';
import 'package:tacaro_flutter_race/shared/theme/app_text.dart';
import 'package:tacaro_flutter_race/shared/widgets/chart_card/chart_card.dart';
import 'package:tacaro_flutter_race/shared/widgets/custom_list_tile/custom_list_tile.dart';
import 'package:tacaro_flutter_race/shared/widgets/product_card/product_card.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  late final FeedController _controller;

  @override
  void initState() {
    _controller = FeedController(
      repository: FeedRepositoryImpl(database: AppDatabase.instance),
    );
    _controller.getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      padding: EdgeInsets.only(right: size.width * 0.07, left: size.width * 0.07, top: size.height * 0.08),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) => _controller.state.when(
          loading: () {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: const ChartCard(
                    value: 0.0,
                    percent: 0.0,
                  ),
                ),
                const SizedBox(
                  height: 27,
                ),
                const Text("Preço dos produtos").label,
                const SizedBox(
                  height: 14,
                ),
                SizedBox(
                  height: 126,
                  width: MediaQuery.of(context).size.width,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return ProductCard(
                          product: ProductModel(name: "", lastPrice: 0.0, currentPrice: 0.0),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                const Text("Suas últimas compras").label,
                const SizedBox(
                  height: 14,
                ),
                for (int i = 0; i < 6; i++)
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: CustomListTile(
                      shopping: ShoppingModel(
                        id: "",
                        name: "",
                        price: 0.0,
                        date: "",
                      ),
                      delete: () {},
                    ),
                  ),
              ],
            );
          },
          success: (value) {
            final shoppingList = value as List<ShoppingModel>;
            final productsList = _controller.productsList;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ChartCard(
                  value: _controller.sumTotal,
                  percent: _controller.calcChart(productsList),
                ),
                const SizedBox(
                  height: 27,
                ),
                const Text("Preço dos produtos").label,
                const SizedBox(
                  height: 14,
                ),
                SizedBox(
                  height: 126,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: productsList.length,
                    itemBuilder: (context, index) {
                      return ProductCard(
                        product: productsList[index],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 18),
                const Text("Suas últimas compras").label,
                const SizedBox(
                  height: 14,
                ),
                for (var shopping in shoppingList)
                  CustomListTile(
                    shopping: shopping,
                    delete: () {
                      _controller.deleteShopping(id: shopping.id);
                      setState(() {});
                    },
                  ),
              ],
            );
          },
          orElse: () => Container(),
        ),
      ),
    );
  }
}
