import 'package:flutter/material.dart';
import 'package:tacaro_flutter_race/shared/theme/app_theme.dart';

class InputText extends StatelessWidget {
  final String label;
  final String hint;
  final bool obscure;
  final void Function(String)? onChanged;
  final String? Function(String)? validator;

  const InputText({
    Key? key,
    required this.label,
    required this.hint,
    this.obscure = false,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label).label,
        const SizedBox(height: 12),
        TextFormField(
          style: AppTheme.textStyles.input,
          obscureText: obscure,
          onChanged: onChanged,
          validator: (value){
            if(validator != null){
              return validator!(value ?? '');
            }
          },
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTheme.textStyles.hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppTheme.colors.border),
            ),
          ),
        ),
      ],
    );
  }
}
