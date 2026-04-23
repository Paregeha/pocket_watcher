import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/gen/assets.gen.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';
import 'package:flutter_base_architecture/widgets/buttons/on_boarding_button_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../gen/fonts.gen.dart';

class OnBoardingPageData {
  const OnBoardingPageData({
    required this.image,
    required this.title,
    required this.description,
  });

  final ImageProvider image;
  final String title;
  final String description;
}

class OnBoarding1Page extends StatefulWidget {
  const OnBoarding1Page({super.key});

  @override
  State<OnBoarding1Page> createState() => _OnBoarding1PageState();
}

class _OnBoarding1PageState extends State<OnBoarding1Page> {
  late final PageController _pageController;

  final List<OnBoardingPageData> _pages = [
    OnBoardingPageData(
      image: Assets.images.onBoarding1.provider(),
      title: 'Track Your Products',
      description:
          'Keep all your items organized —\n'
          'add your products, track\n'
          'quantities, and always know\n'
          'what you have at home.',
    ),
    OnBoardingPageData(
      image: Assets.images.onBoarding2.provider(),
      title: 'Expiration Control',
      description:
          'Stay ahead of expiration dates\n— keep track of what’s expiring\nsoon and reduce waste\neffortlessly.',
    ),
    OnBoardingPageData(
      image: Assets.images.onBoarding3.provider(),
      title: 'Smart Recipes',
      description:
          'Discover personalized recipes\nbased on what you already\nhave — cook smarter, save\ntime, and see which ingredients\nyou’re missing.',
    ),
    OnBoardingPageData(
      image: Assets.images.onBoarding4.provider(),
      title: 'Finance Overview',
      description:
          'Discover personalized recipes\nbased on what you already\nhave — cook smarter, save\ntime, and see which ingredients\nyou’re missing.',
    ),
  ];

  int _currentIndex = 0;

  bool get _isFirstPage => _currentIndex == 0;
  bool get _isLastPage => _currentIndex == _pages.length - 1;

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

  void _goNext() {
    if (_isLastPage) {
      context.go('/sign_in');
      return;
    }

    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _goBack() {
    if (_isFirstPage) return;

    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainLightColor,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 50.0),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _pages.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final page = _pages[index];

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(image: page.image),
                        const SizedBox(height: 60),
                        Text(
                          page.title,
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: FontFamily.poppins,
                            fontWeight: FontWeight.w700,
                            color: AppColors.darkColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 30),
                        Text(
                          page.description,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: FontFamily.poppins,
                            fontWeight: FontWeight.w700,
                            color: AppColors.mainDarkColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _isFirstPage
                      ? const SizedBox(width: 90, height: 90)
                      : OnBoardingButtonWidget(
                        title: 'Back',
                        fillColor: AppColors.mainLightColor,
                        borderColor: AppColors.mainDarkColor,
                        textColor: AppColors.mainDarkColor,
                        shadowColor: AppColors.mainDarkColor,
                        isMirrored: true,
                        onTap: _goBack,
                      ),
                  AnimatedSmoothIndicator(
                    activeIndex: _currentIndex,
                    count: _pages.length,
                    onDotClicked: (index) {
                      _pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    effect: CustomizableEffect(
                      spacing: 8,
                      dotDecoration: DotDecoration(
                        width: 10,
                        height: 10,
                        color: AppColors.secondColor,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      activeDotDecoration: DotDecoration(
                        width: 25,
                        height: 10,
                        color: AppColors.mainDarkColor,
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ),
                  ),
                  OnBoardingButtonWidget(
                    title: _isLastPage ? 'Start' : 'Next',
                    fillColor: AppColors.mainDarkColor,
                    borderColor: AppColors.mainLightColor,
                    textColor: AppColors.mainLightColor,
                    shadowColor: AppColors.mainDarkColor,
                    onTap: _goNext,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
