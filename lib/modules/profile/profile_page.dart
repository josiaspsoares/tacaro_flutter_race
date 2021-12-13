import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:tacaro_flutter_race/shared/models/user_model.dart';
import 'package:tacaro_flutter_race/shared/theme/app_theme.dart';

class ProfilePage extends StatelessWidget {
  final UserModel user;

  const ProfilePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      padding: EdgeInsets.only(right: size.width * 0.07, left: size.width * 0.07, top: size.height * 0.08),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Perfil',
            style: AppTheme.textStyles.title.copyWith(fontSize: 36),
          ),
          SizedBox(height: size.height * 0.06),
          Container(
            decoration: BoxDecoration(
              color: AppTheme.colors.cardBackground,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: Icon(
                Icons.person,
                color: AppTheme.colors.primary,
                size: 35,
              ),
              title: Text(
                user.name,
                style: AppTheme.textStyles.titleListTile,
              ),
              subtitle: Text(
                user.email,
                style: AppTheme.textStyles.subtitleListTile,
              ),
            ),
          ),
          SizedBox(height: size.height * 0.02),
          Container(
            decoration: BoxDecoration(
              color: AppTheme.colors.cardBackground,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: AppTheme.colors.badColor,
                size: 35,
              ),
              title: Text(
                'Sair do aplicativo',
                style: AppTheme.textStyles.titleListTile,
              ),
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove('id');
                Navigator.of(context).pushReplacementNamed('/login');
              },
            ),
          ),
        ],
      ),
    );
  }
}
