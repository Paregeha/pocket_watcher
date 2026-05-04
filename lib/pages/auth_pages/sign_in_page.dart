import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/gen/fonts.gen.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';
import 'package:flutter_base_architecture/widgets/buttons/custom_button_icons_widget.dart';
import 'package:flutter_base_architecture/widgets/buttons/custom_button_widget.dart';
import 'package:flutter_base_architecture/widgets/uncategorized/custom_text_field_widget.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainLightColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    'Good to see you',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: FontFamily.poppins,
                      color: AppColors.darkColor,
                    ),
                  ),
                  Text(
                    'Track, cook, plan — all in one place.',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: FontFamily.poppins,
                      color: AppColors.mainDarkColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 130.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w800,
                      fontFamily: FontFamily.poppins,
                      color: AppColors.darkColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Text(
                'Email',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: FontFamily.poppins,
                  color: AppColors.mainDarkColor,
                ),
              ),
              CustomTextFieldWidget(hintText: 'Enter your email'),
              SizedBox(height: 12.0),
              Text(
                'Password',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: FontFamily.poppins,
                  color: AppColors.mainDarkColor,
                ),
              ),
              CustomTextFieldWidget(hintText: 'Enter your password'),
              SizedBox(height: 24.0),
              CustomButtonWidget(text: 'Sign In'),
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: FontFamily.poppins,
                        color: AppColors.mainDarkColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 70),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 40.0,
                children: [
                  CustomButtonIconsWidget(),
                  CustomButtonIconsWidget(),
                ],
              ),
              SizedBox(height: 112.0),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Don’t have an account?',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: FontFamily.poppins,
                        color: AppColors.mainDarkColor.withValues(alpha: 0.5),
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'Tap “',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: FontFamily.poppins,
                          color: AppColors.mainDarkColor.withValues(alpha: 0.5),
                        ),

                        children: [
                          TextSpan(
                            text: 'Sign Up',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: FontFamily.poppins,
                              color: AppColors.mainDarkColor,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.mainDarkColor,
                            ),
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap = () {
                                    // navigate to sign up
                                  },
                          ),

                          TextSpan(
                            text: '” to create one.',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: FontFamily.poppins,
                              color: AppColors.mainDarkColor.withValues(
                                alpha: 0.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
