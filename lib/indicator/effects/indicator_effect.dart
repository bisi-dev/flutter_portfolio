import 'package:flutter/material.dart';
import '../painters/indicator_painter.dart';

abstract class IndicatorEffect {
  // Singe dot width
  final double dotWidth;

  // Singe dot height
  final double dotHeight;

  // The horizontal space between dots
  final double spacing;

  // Single dot radius
  final double radius;

  // Inactive dots color or all dots in some effects
  final Color dotColor;

  // The active dot color
  final Color activeDotColor;

  // Inactive dots paint style (fill|stroke) defaults to fill.
  final PaintingStyle paintStyle;

  /// This is ignored if [paintStyle] is PaintStyle.fill
  final double strokeWidth;

  const IndicatorEffect({
    @required this.strokeWidth,
    @required this.dotWidth,
    @required this.dotHeight,
    @required this.spacing,
    @required this.radius,
    @required this.dotColor,
    @required this.paintStyle,
    @required this.activeDotColor,
  })  : assert(radius != null),
        assert(dotColor != null || paintStyle != null || strokeWidth != null),
        assert(activeDotColor != null),
        assert(dotWidth != null),
        assert(dotHeight != null),
        assert(spacing != null),
        assert(dotWidth >= 0 &&
            dotHeight >= 0 &&
            spacing >= 0 &&
            strokeWidth >= 0);

  // Builds a new painter every time the page offset changes
  IndicatorPainter buildPainter(int count, double offset, bool isRTL);

  // Calculates the size of canvas based on
  // dots count, size and spacing
  //
  // Other effects can override this function
  // to calculate their own size
  Size calculateSize(int count) {
    return Size(dotWidth * count + (spacing * (count - 1)), dotHeight);
  }
}
