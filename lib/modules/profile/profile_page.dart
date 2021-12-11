import 'package:flutter/material.dart';
import 'package:tacaro_flutter_race/shared/theme/app_theme.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
          SizedBox(height: size.height * 0.08),
          Container(
            decoration: BoxDecoration(
              color: AppTheme.colors.cardBackground,
             
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              title: Text(
                'Sair do aplicativo',
                style: AppTheme.textStyles.titleListTile,
              ),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/login');
              },
            ),
          ),
        ],
      ),
    );
  }
}
