import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({super.key, required this.text, this.onPressed});

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.secondColor,
              blurRadius: 10.0,
              offset: const Offset(0, 0),
            ),
          ],
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.mainDarkColor,
            foregroundColor: AppColors.mainLightColor,
            elevation: 0,
            minimumSize: const Size(double.infinity, 52.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text.toUpperCase(),
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              color: AppColors.mainLightColor,
            ),
          ),
        ),
      ),
    );
  }
}
