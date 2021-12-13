import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tacaro_flutter_race/shared/models/product_model.dart';
import 'package:tacaro_flutter_race/shared/theme/app_theme.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
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
                  child: product.currentPrice < product.lastPrice || product.lastPrice == 0.0
                      ? const Icon(
                          FontAwesomeIcons.thumbsUp,
                        )
                      : Icon(
                          FontAwesomeIcons.thumbsDown,
                          color: AppTheme.colors.badColor,
                        ),
                ),
                title: Text(
                  product.name,
                  style: AppTheme.textStyles.titleListTile,
                ),
                subtitle: Text(
                  "Estava R\$ ${product.lastPrice.toStringAsFixed(2)}",
                  style: AppTheme.textStyles.subtitleListTile,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Text.rich(
                  TextSpan(text: "Agora\n", style: AppTheme.textStyles.subtitleListTile, children: [
                    TextSpan(text: "R\$ ${product.currentPrice.toStringAsFixed(2)}", style: AppTheme.textStyles.title),
                  ]),
                ),
              ),
            ],
          )),
    );
  }
}
