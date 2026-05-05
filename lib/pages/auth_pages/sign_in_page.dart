import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/gen/fonts.gen.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';
import 'package:flutter_base_architecture/routes/app_routes.dart';
import 'package:flutter_base_architecture/widgets/buttons/custom_button_icons_widget.dart';
import 'package:flutter_base_architecture/widgets/buttons/custom_button_widget.dart';
import 'package:flutter_base_architecture/widgets/uncategorized/custom_text_field_widget.dart';
import 'package:go_router/go_router.dart';

import '../../gen/assets.gen.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.mainLightColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12.0),
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
                      const Spacer(),
                      Center(
                        child: Text(
                          'Sign In',
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
                        'Email',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: FontFamily.poppins,
                          color: AppColors.mainDarkColor,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      const CustomTextFieldWidget(
                        hintText: 'Enter your email',
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(height: 12.0),
                      Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: FontFamily.poppins,
                          color: AppColors.mainDarkColor,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      const CustomTextFieldWidget(
                        hintText: 'Enter your password',
                        obscureText: true,
                        textInputAction: TextInputAction.done,
                      ),
                      const SizedBox(height: 20.0),
                      CustomButtonWidget(text: 'Sign In', onPressed: () {}),
                      const SizedBox(height: 6.0),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            context.push(AppRoutes.forgotPassword);
                          },
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: FontFamily.poppins,
                              color: AppColors.mainDarkColor,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 40.0,
                        children: [
                          CustomButtonIconsWidget(
                            icon: Assets.images.iconGoogle.image(
                              height: 24.0,
                              width: 24.0,
                            ),
                            onTap: () {},
                          ),
                          CustomButtonIconsWidget(
                            icon: Assets.images.iconApple.image(
                              height: 24.0,
                              width: 24.0,
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                      const Spacer(),
                      const SizedBox(height: 12.0),
                      Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Don’t have an account?',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: FontFamily.poppins,
                                color: AppColors.mainDarkColor.withValues(
                                  alpha: 0.5,
                                ),
                              ),
                            ),
                            Wrap(
                              alignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 2.0,
                              children: [
                                Text(
                                  'Tap “',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: FontFamily.poppins,
                                    color: AppColors.mainDarkColor.withValues(
                                      alpha: 0.5,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    context.push(AppRoutes.signUp);
                                  },
                                  style: TextButton.styleFrom(
                                    minimumSize: const Size(48.0, 36.0),
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 2.0,
                                    ),
                                  ),
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: FontFamily.poppins,
                                      color: AppColors.mainDarkColor,
                                      decoration: TextDecoration.underline,
                                      decorationColor: AppColors.mainDarkColor,
                                    ),
                                  ),
                                ),
                                Text(
                                  '” to create one.',
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
                          ],
                        ),
                      ),
                      const SizedBox(height: 8.0),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
