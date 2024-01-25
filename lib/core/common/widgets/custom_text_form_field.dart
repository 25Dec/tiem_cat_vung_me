import 'package:flutter/material.dart';
import 'package:tiem_cat_vung_me/core/res/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final IconData? prefixIcon;
  final String hintText;
  final String? Function(String?) validator;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.prefixIcon,
    required this.hintText,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        hintText: 'Mật khẩu',
        hintStyle: const TextStyle(color: AppColors.white3),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.white3,
          ),
        ),
      ),
      validator: validator,
    );
  }
}
