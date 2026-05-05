import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/resources/app_colors.dart';

class CustomButtonIconsWidget extends StatelessWidget {
  const CustomButtonIconsWidget({
    super.key,
    required this.icon,
    this.onTap,
    this.size = 56.0,
  });

  final Widget icon;
  final VoidCallback? onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    final buttonSize = size < 48.0 ? 48.0 : size;

    return Container(
      width: buttonSize,
      height: buttonSize,
      decoration: BoxDecoration(
        color: AppColors.mainDarkColor,
        borderRadius: BorderRadius.circular(14.0),
        border: Border.all(color: AppColors.mainDarkColor, width: 1.0),
      ),
      child: CustomPaint(
        painter: InnerShadowPainter(
          color: AppColors.mainLightColor,
          radius: 14.0,
          blur: 10.0,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: onTap,
            child: Center(child: icon),
          ),
        ),
      ),
    );
  }
}

class InnerShadowPainter extends CustomPainter {
  InnerShadowPainter({
    required this.color,
    required this.radius,
    required this.blur,
  });
  final Color color;
  final double radius;
  final double blur;

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final RRect radiusRect = RRect.fromRectAndRadius(
      rect,
      Radius.circular(radius),
    );

    final Paint shadowPaint =
        Paint()
          ..color = color
          ..maskFilter = MaskFilter.blur(BlurStyle.inner, blur);

    canvas.save();
    canvas.clipRRect(radiusRect);
    canvas.drawRRect(radiusRect, shadowPaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
