import 'package:flutter/material.dart';

import 'package:tacaro_flutter_race/shared/models/shopping_model.dart';
import 'package:tacaro_flutter_race/shared/theme/app_theme.dart';

class CustomListTile extends StatelessWidget {
  final ShoppingModel shopping;

  const CustomListTile({
    Key? key,
    required this.shopping,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
          decoration: BoxDecoration(
            color: AppTheme.colors.cardBackground,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: AppTheme.colors.background,
              radius: 30,
              child: Text(
                shopping.date.split("-").sublist(1).reversed.join("/"),
                style: AppTheme.textStyles.label,
              ),
            ),
            title: Text(
              shopping.name,
              style: AppTheme.textStyles.titleListTile,
            ),
            subtitle: Text(
              "R\$ ${shopping.price.toStringAsFixed(2)}",
              style: AppTheme.textStyles.subtitleListTile,
            ),
            trailing: PopupMenuButton<String>(
              onSelected: (value) {},
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: "Editar",
                  child: Text("Editar"),
                ),
                const PopupMenuItem(
                  value: "Excluir",
                  child: Text("Excluir"),
                ),
              ],
            ),
          )),
    );
  }
}
