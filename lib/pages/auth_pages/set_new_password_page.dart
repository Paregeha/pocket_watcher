import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/gen/fonts.gen.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';
import 'package:flutter_base_architecture/routes/app_routes.dart';
import 'package:flutter_base_architecture/widgets/buttons/custom_button_widget.dart';
import 'package:go_router/go_router.dart';

import '../../gen/assets.gen.dart';
import '../../widgets/uncategorized/custom_text_field_widget.dart';

class SetNewPasswordPage extends StatelessWidget {
  const SetNewPasswordPage({
    super.key,
    required this.onSave,
    required this.onBack,
  });

  final VoidCallback onSave;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Spacer(),
        Center(
          child: Text(
            'Set new password',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w800,
              fontFamily: FontFamily.poppins,
              color: AppColors.darkColor,
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        Text(
          'New password',
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            fontFamily: FontFamily.poppins,
            color: AppColors.mainDarkColor,
          ),
        ),
        const SizedBox(height: 4.0),
        const CustomTextFieldWidget(
          hintText: 'Enter new password',
          obscureText: true,
          textInputAction: TextInputAction.next,
        ),
        const SizedBox(height: 12.0),
        Text(
          'Confirm password',
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            fontFamily: FontFamily.poppins,
            color: AppColors.mainDarkColor,
          ),
        ),
        const SizedBox(height: 4.0),
        const CustomTextFieldWidget(
          hintText: 'Repeat password',
          obscureText: true,
          textInputAction: TextInputAction.done,
        ),
        const SizedBox(height: 20.0),
        CustomButtonWidget(text: 'RESET PASSWORD', onPressed: onSave),
        const SizedBox(height: 70.0),

        Center(
          child: TextButton(
            onPressed: () {
              context.go(AppRoutes.signIn);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.icons.leftArrow.image(
                  width: 24.0,
                  height: 24.0,
                  color: AppColors.mainDarkColor,
                  colorBlendMode: BlendMode.srcIn,
                ),
                const SizedBox(width: 4.0),
                Text(
                  'Back to Sign In',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: FontFamily.poppins,
                    color: AppColors.mainDarkColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ),
        Spacer(),
      ],
    );
  }
}
