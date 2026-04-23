import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/gen/assets.gen.dart';
import 'package:flutter_base_architecture/gen/fonts.gen.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';
import 'package:go_router/go_router.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    _goNext();
  }

  Future<void> _goNext() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;
    context.go('/onboarding1');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainLightColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Pocket',
              style: TextStyle(
                fontSize: 64,
                fontFamily: FontFamily.poppins,
                fontWeight: FontWeight.w800,
                color: AppColors.darkColor,
              ),
            ),
            Assets.images.logoImage.image(),
            Text(
              'Watcher',
              style: TextStyle(
                fontSize: 64,
                color: AppColors.darkColor,
                fontFamily: FontFamily.poppins,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
