import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';

import '../../gen/fonts.gen.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({super.key, required this.hintText});

  final String hintText;

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(14.0)),
      borderSide: BorderSide(color: AppColors.mainDarkColor, width: 1),
    );

    return TextField(
      decoration: InputDecoration(
        fillColor: AppColors.secondColor,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColors.mainLightColor.withValues(alpha: 0.5),
          fontFamily: FontFamily.poppins,
          fontWeight: FontWeight.w700,
          fontSize: 16.0,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 13.0,
          horizontal: 20.0,
        ),
        border: inputBorder,
        enabledBorder: inputBorder,
        focusedBorder: inputBorder,
        disabledBorder: inputBorder,
      ),
    );
  }
}
