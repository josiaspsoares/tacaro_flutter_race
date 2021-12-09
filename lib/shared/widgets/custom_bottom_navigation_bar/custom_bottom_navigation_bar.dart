import 'package:flutter/material.dart';

import 'package:tacaro_flutter_race/shared/theme/app_theme.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onChanged;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 26, left: 26, bottom: 14),
      child: Container(
        height: 76,
        decoration: BoxDecoration(
          color: AppTheme.colors.bottomNavigationBar,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavigationIcon(
              icon: Icons.home,
              onTap: () => onChanged(0),
              enabled: currentIndex == 0,
            ),
            BottomNavigationIcon(
              icon: Icons.add,
              onTap: () => onChanged(1),
              enabled: currentIndex == 1,
            ),
            BottomNavigationIcon(
              icon: Icons.settings,
              onTap: () => onChanged(2),
              enabled: currentIndex == 2,
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavigationIcon extends StatelessWidget {
  const BottomNavigationIcon({
    Key? key,
    required this.icon,
    required this.enabled,
    required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final bool enabled;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: enabled ? AppTheme.colors.primary : AppTheme.colors.background,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          color: enabled ? AppTheme.colors.bottomNavigationBar : AppTheme.colors.iconInactive,
        ),
      ),
    );
  }
}
