import 'app_colors.dart';
import 'app_text_styles.dart';

export 'app_text.dart';

class AppTheme {

  static final AppTheme instance = AppTheme();

  // Singleton

  // static AppTheme? _instance;
  // static AppTheme get instance {
 
  //   if(_instance == null) {
  //     _instance = AppTheme();
  //   }

  //   return _instance!; 
  // }

  final _colors = AppColors();
  static AppColors get colors => instance._colors;

  final _textStyles = AppTextStyles();
  static AppTextStyles get textStyles => instance._textStyles;
}