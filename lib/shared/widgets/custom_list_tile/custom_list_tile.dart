import 'package:flutter/material.dart';
import 'package:tacaro_flutter_race/shared/theme/app_theme.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Container(
          decoration: BoxDecoration(
            color: AppTheme.colors.cardBackground,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: AppTheme.colors.background,
              radius: 30,
              child: const Text(
                "12/12",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            title: const Text("Produto"),
            subtitle: const Text("Preço"),
            trailing: PopupMenuButton<String>(
              onSelected: (value) {
                print(value);
              },
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
