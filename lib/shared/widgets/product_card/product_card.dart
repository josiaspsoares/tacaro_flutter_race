import 'package:flutter/material.dart';
import 'package:tacaro_flutter_race/shared/theme/app_theme.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8, right: 14),
      child: Container(
          width: 232,
          decoration: BoxDecoration(
            color: AppTheme.colors.cardBackground,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppTheme.colors.background,
                  radius: 30,
                  child: const Icon(Icons.linked_camera),
                ),
                title: const Text("Produto"),
                subtitle: const Text("Preço"),
              ),
              const Text.rich(TextSpan(text: "Agora\n", children: [
                TextSpan(
                  text: "R\$ 67,50",
                ),
              ])),
            ],
          )),
    );
  }
}
