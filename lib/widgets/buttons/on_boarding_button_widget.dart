import 'package:flutter/material.dart';

class OnBoardingButtonWidget extends StatelessWidget {
  const OnBoardingButtonWidget({
    super.key,
    this.onTap,
    required this.title,
    required this.fillColor,
    required this.borderColor,
    required this.textColor,
    this.shadowColor,
    this.isMirrored = false,
    this.width = 90,
    this.height = 90,
  });

  final VoidCallback? onTap;
  final String title;
  final Color fillColor;
  final Color borderColor;
  final Color textColor;
  final Color? shadowColor;
  final bool isMirrored;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final shape = _OnBoardingButtonShape(isMirrored: isMirrored);

    return SizedBox(
      width: width,
      height: height,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          customBorder: shape,
          child: CustomPaint(
            painter: _OnBoardingButtonPainter(
              fillColor: fillColor,
              borderColor: borderColor,
              shadowColor: shadowColor ?? fillColor,
              isMirrored: isMirrored,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 2),
                child: Text(
                  title,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    height: 1,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _OnBoardingButtonPainter extends CustomPainter {
  const _OnBoardingButtonPainter({
    required this.fillColor,
    required this.borderColor,
    required this.shadowColor,
    required this.isMirrored,
  });

  final Color fillColor;
  final Color borderColor;
  final Color shadowColor;
  final bool isMirrored;

  @override
  void paint(Canvas canvas, Size size) {
    final path = _buildPath(size, isMirrored: isMirrored);

    final shadowPaint =
        Paint()
          ..color = shadowColor
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10)
          ..isAntiAlias = true;

    canvas.save();
    canvas.translate(0, 4);
    canvas.drawPath(path, shadowPaint);
    canvas.restore();

    final fillPaint =
        Paint()
          ..color = fillColor
          ..style = PaintingStyle.fill
          ..isAntiAlias = true;

    final strokePaint =
        Paint()
          ..color = borderColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2
          ..isAntiAlias = true;

    canvas.drawPath(path, fillPaint);
    canvas.drawPath(path, strokePaint);
  }

  static Path _buildPath(Size size, {required bool isMirrored}) {
    final w = size.width;
    final h = size.height;

    const sideHeight = 50.0;
    const sideRadius = 12.0;

    final topInset = (h - sideHeight) / 2;
    final bottomInset = h - topInset;

    Path path =
        Path()
          ..moveTo(sideRadius, topInset)
          ..lineTo(w, 0)
          ..lineTo(w, h)
          ..lineTo(sideRadius, bottomInset)
          ..quadraticBezierTo(0, bottomInset, 0, bottomInset - sideRadius)
          ..lineTo(0, topInset + sideRadius)
          ..quadraticBezierTo(0, topInset, sideRadius, topInset)
          ..close();

    if (isMirrored) {
      final matrix =
          Matrix4.identity()
            ..translate(w)
            ..scale(-1.0, 1.0);

      path = path.transform(matrix.storage);
    }

    return path;
  }

  @override
  bool shouldRepaint(covariant _OnBoardingButtonPainter oldDelegate) {
    return oldDelegate.fillColor != fillColor ||
        oldDelegate.borderColor != borderColor ||
        oldDelegate.shadowColor != shadowColor ||
        oldDelegate.isMirrored != isMirrored;
  }
}

class _OnBoardingButtonShape extends ShapeBorder {
  const _OnBoardingButtonShape({required this.isMirrored});

  final bool isMirrored;

  Path _buildPath(Rect rect) {
    final w = rect.width;
    final h = rect.height;

    const sideHeight = 50.0;
    const sideRadius = 12.0;

    final topInset = (h - sideHeight) / 2;
    final bottomInset = h - topInset;

    Path path =
        Path()
          ..moveTo(rect.left + sideRadius, rect.top + topInset)
          ..lineTo(rect.left + w, rect.top)
          ..lineTo(rect.left + w, rect.top + h)
          ..lineTo(rect.left + sideRadius, rect.top + bottomInset)
          ..quadraticBezierTo(
            rect.left,
            rect.top + bottomInset,
            rect.left,
            rect.top + bottomInset - sideRadius,
          )
          ..lineTo(rect.left, rect.top + topInset + sideRadius)
          ..quadraticBezierTo(
            rect.left,
            rect.top + topInset,
            rect.left + sideRadius,
            rect.top + topInset,
          )
          ..close();

    if (isMirrored) {
      final matrix =
          Matrix4.identity()
            ..translate(rect.left * 2 + w)
            ..scale(-1.0, 1.0);

      path = path.transform(matrix.storage);
    }

    return path;
  }

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) =>
      _buildPath(rect);

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) =>
      _buildPath(rect);

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => _OnBoardingButtonShape(isMirrored: isMirrored);
}
