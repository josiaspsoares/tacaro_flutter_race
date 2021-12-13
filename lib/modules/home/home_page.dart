import 'package:flutter/material.dart';
import 'package:tacaro_flutter_race/modules/shopping/shopping_bottomsheet.dart';
import 'package:tacaro_flutter_race/shared/models/user_model.dart';
import 'package:tacaro_flutter_race/shared/theme/app_theme.dart';
import 'package:tacaro_flutter_race/shared/widgets/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  final UserModel user;
  final List<Widget> pages;

  const HomePage({
    Key? key,
    required this.pages,
    required this.user,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;
  late final List<Widget> pages = widget.pages;

  void changeIndex(int index) async {
    if (index == 3) {
      await showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        context: context,
        builder: (context) => Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: const ShoppingBottomsheet(),
        ),
      );
    } else {
      currentIndex = index;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      body: Container(
        key: UniqueKey(),
        child: List.from(pages)[currentIndex],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onChanged: changeIndex,
      ),
    );
  }
}
