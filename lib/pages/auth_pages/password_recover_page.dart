import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_architecture/gen/fonts.gen.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';
import 'package:flutter_base_architecture/routes/app_routes.dart';
import 'package:flutter_base_architecture/widgets/buttons/custom_button_widget.dart';
import 'package:go_router/go_router.dart';

import '../../gen/assets.gen.dart';

class PasswordRecoverPage extends StatefulWidget {
  const PasswordRecoverPage({
    super.key,
    required this.onContinue,
    required this.onBack,
  });

  final VoidCallback onContinue;
  final VoidCallback onBack;

  @override
  State<PasswordRecoverPage> createState() => _PasswordRecoverPageState();
}

class _PasswordRecoverPageState extends State<PasswordRecoverPage> {
  static const int _codeLength = 5;
  static const double _otpSize = 50.0;
  static const double _otpRadius = 14.0;
  late final List<TextEditingController> _controllers;
  late final List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(_codeLength, (_) => TextEditingController());
    _focusNodes = List.generate(_codeLength, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onDigitChanged(int index, String value) {
    if (value.isEmpty) {
      if (index > 0) {
        _focusNodes[index - 1].requestFocus();
      }
      setState(() {});
      return;
    }

    if (value.length > 1) {
      final chars = value.replaceAll(RegExp(r'[^0-9]'), '').split('');
      for (int i = 0; i < chars.length && index + i < _codeLength; i++) {
        _controllers[index + i].text = chars[i];
      }
      final nextIndex = (index + chars.length).clamp(0, _codeLength - 1);
      _focusNodes[nextIndex].requestFocus();
      setState(() {});
      return;
    }

    if (index < _codeLength - 1) {
      _focusNodes[index + 1].requestFocus();
    } else {
      _focusNodes[index].unfocus();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(),
        Center(
          child: Text(
            'Password recover',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w800,
              fontFamily: FontFamily.poppins,
              color: AppColors.darkColor,
            ),
          ),
        ),
        const SizedBox(height: 14.0),
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < _codeLength; i++) ...[
                SizedBox(
                  width: _otpSize,
                  height: _otpSize,
                  child: TextField(
                    controller: _controllers[i],
                    focusNode: _focusNodes[i],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    textInputAction:
                        i == _codeLength - 1
                            ? TextInputAction.done
                            : TextInputAction.next,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: FontFamily.poppins,
                      color: AppColors.mainLightColor,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,

                      LengthLimitingTextInputFormatter(1),
                    ],
                    decoration: InputDecoration(
                      counterText: '',
                      contentPadding: EdgeInsets.zero,
                      filled: true,
                      fillColor: AppColors.secondColor,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(_otpRadius),
                        borderSide: BorderSide(
                          color: AppColors.mainDarkColor,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(_otpRadius),
                        borderSide: BorderSide(
                          color: AppColors.darkColor,
                          width: 2.0,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(_otpRadius),
                        borderSide: BorderSide(
                          color: AppColors.mainDarkColor,
                          width: 1.0,
                        ),
                      ),
                    ),
                    onChanged: (value) => _onDigitChanged(i, value),
                  ),
                ),
                if (i < _codeLength - 1) const SizedBox(width: 8.0),
              ],
            ],
          ),
        ),
        const SizedBox(height: 20.0),
        CustomButtonWidget(text: 'CONTINUE', onPressed: widget.onContinue),
        const SizedBox(height: 25.0),
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Didn`t receive the email?',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: FontFamily.poppins,
                  color: AppColors.mainDarkColor.withValues(alpha: 0.5),
                ),
              ),
              TextButton(
                onPressed: () {
                  context.pop();
                },
                style: TextButton.styleFrom(
                  minimumSize: const Size(48.0, 36.0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                ),
                child: Text(
                  ' Click to resend',
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
            ],
          ),
        ),
        const SizedBox(height: 30),
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
        const Spacer(),
      ],
    );
  }
}
