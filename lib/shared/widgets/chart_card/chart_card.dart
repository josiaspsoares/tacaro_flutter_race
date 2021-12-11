import 'package:flutter/material.dart';
import 'package:tacaro_flutter_race/shared/theme/app_theme.dart';
import 'package:tacaro_flutter_race/shared/widgets/horizontal_chart/horizontal_chart.dart';

class ChartCard extends StatelessWidget {
  final double value;
  final double percent;

  const ChartCard({Key? key, required this.value, required this.percent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 240,
      decoration: BoxDecoration(
        color: AppTheme.colors.cardBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Gasto mensal",
              style: AppTheme.textStyles.label,
            ),
            const SizedBox(
              height: 18,
            ),
            Text.rich(TextSpan(text: "R\$ ", style: AppTheme.textStyles.label, children: [
              TextSpan(
                text: value.toStringAsFixed(2).replaceAll(".", ","),
                style: AppTheme.textStyles.title.copyWith(fontSize: 36),
              )
            ])),
            const SizedBox(
              height: 10,
            ),
            HorizontalChart(percent: percent),
          ],
        ),
      ),
    );
  }
}
