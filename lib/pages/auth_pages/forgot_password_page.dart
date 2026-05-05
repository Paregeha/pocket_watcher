import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/gen/fonts.gen.dart';
import 'package:flutter_base_architecture/pages/auth_pages/password_recover_page.dart';
import 'package:flutter_base_architecture/pages/auth_pages/set_new_password_page.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';
import 'package:flutter_base_architecture/routes/app_routes.dart';
import 'package:flutter_base_architecture/widgets/buttons/custom_button_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../gen/assets.gen.dart';
import '../../widgets/uncategorized/custom_text_field_widget.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextStep() {
    if (_currentPage >= 2) {
      return;
    }
    _pageController.nextPage(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
  }

  void _back() {
    if (_currentPage == 0) {
      context.pop();
      return;
    }
    _pageController.previousPage(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
  }

  String get _headline {
    switch (_currentPage) {
      case 1:
        return 'No worries';
      case 2:
        return '';
      default:
        return 'No worries';
    }
  }

  String get _subtitle {
    switch (_currentPage) {
      case 1:
        return 'We sent a code to your email.';
      case 2:
        return '';
      default:
        return 'We`ll send you reset instructions.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.mainLightColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12.0),
              Text(
                _headline,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: FontFamily.poppins,
                  color: AppColors.darkColor,
                ),
              ),
              Text(
                _subtitle,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: FontFamily.poppins,
                  color: AppColors.mainDarkColor,
                ),
              ),
              const SizedBox(height: 24.0),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: [
                    _ForgotEmailStep(
                      onContinue: _nextStep,
                      back: () {
                        context.pop();
                      },
                    ),
                    PasswordRecoverPage(onContinue: _nextStep, onBack: _back),
                    SetNewPasswordPage(
                      onSave: () {
                        context.go(AppRoutes.signIn);
                      },
                      onBack: _back,
                    ),
                  ],
                ),
              ),
              Center(
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: WormEffect(
                    activeDotColor: AppColors.mainDarkColor,
                    dotColor: AppColors.secondColor,
                    dotHeight: 5.0,
                    dotWidth: 84.0,
                    spacing: 10.0,
                  ),
                ),
              ),
              const SizedBox(height: 12.0),
            ],
          ),
        ),
      ),
    );
  }
}

class _ForgotEmailStep extends StatelessWidget {
  const _ForgotEmailStep({required this.onContinue, required this.back});

  final VoidCallback onContinue;
  final VoidCallback back;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(),
        Center(
          child: Text(
            'Forgot password?',
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
          textInputAction: TextInputAction.done,
        ),
        const SizedBox(height: 20.0),
        CustomButtonWidget(text: 'RESET PASSWORD', onPressed: onContinue),
        const SizedBox(height: 70.0),
        Center(
          child: TextButton(
            onPressed: back,
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
        const Spacer(),
      ],
    );
  }
}
