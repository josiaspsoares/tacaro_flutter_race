import 'package:flutter/material.dart';
import 'package:tacaro_flutter_race/shared/theme/app_colors.dart';
import 'package:tacaro_flutter_race/shared/theme/app_theme.dart';
import 'package:tacaro_flutter_race/shared/widgets/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:tacaro_flutter_race/shared/widgets/custom_list_tile/custom_list_tile.dart';
import 'package:tacaro_flutter_race/shared/widgets/product_card/product_card.dart';

class HomePage extends StatefulWidget {
  // final UserModel user;
  const HomePage({
    Key? key,
    // required this.user,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;

  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      body: Padding(
        padding:  EdgeInsets.only(right: size.width * 0.07, left: size.width * 0.07),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 126,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return const ProductCard();
                },
              ),
            ),
            const CustomListTile(),
            const CustomListTile(),
            const CustomListTile(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onChanged: changeIndex,
      ),
    );
  }
}
