import 'package:flutter/material.dart';
import 'themes.dart';

class CustomTabIndicator extends Decoration {
  @override
  _CustomPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomPainter(this, onChanged);
  }
}

class _CustomPainter extends BoxPainter {
  final CustomTabIndicator decoration;

  _CustomPainter(this.decoration, VoidCallback? onChanged) : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Rect rect = offset & configuration.size!;
    final Paint paint = Paint();

    paint.color = primaryColor; // Set the color of the indicator
    paint.style = PaintingStyle.fill;

    final double indicatorWidth = rect.width * 0.5; // 50% of the tab width
    final double indicatorHeight = 2.0; // Adjust the indicator height as needed
    final double indicatorOffset =
        (rect.width - indicatorWidth) / 2; // Center horizontally

    final Rect indicatorRect = Rect.fromPoints(
      Offset(rect.left + indicatorOffset, rect.bottom - indicatorHeight),
      Offset(rect.left + indicatorOffset + indicatorWidth, rect.bottom),
    );

    canvas.drawRect(indicatorRect, paint);
  }
}
