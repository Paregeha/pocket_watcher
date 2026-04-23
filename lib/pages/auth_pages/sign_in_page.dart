import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';
import 'package:flutter_base_architecture/widgets/buttons/custom_button_widget.dart';
import 'package:flutter_base_architecture/widgets/uncategorized/custom_text_field_widget.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainLightColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text('Good to see you'),
                Text('Track, cook, plan — all in one place.'),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Sign In')],
            ),

            Text('Email'),
            CustomTextFieldWidget(),
            Text('Password'),
            CustomTextFieldWidget(),
            CustomButtonWidget(),
            TextButton(onPressed: () {}, child: Text('Forgot password?')),
            Text('Don’t have an account?'),
            Text('Tap “Sign Up” to create one.'),
          ],
        ),
      ),
    );
  }
}
