import 'package:flutter/material.dart';
import 'package:tiem_cat_vung_me/core/res/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final IconData? prefixIcon;
  final String hintText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.prefixIcon,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        hintText: hintText,
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
