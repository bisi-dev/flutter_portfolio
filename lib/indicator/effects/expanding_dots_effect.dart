import 'package:flutter/material.dart';
import '../painters/expanding_dots_painter.dart';
import '../painters/indicator_painter.dart';

import 'indicator_effect.dart';

class ExpandingDotsEffect extends IndicatorEffect {
  /// [expansionFactor] is multiplied by [dotWidth] to resolve
  /// the width of the expanded dot.
  final double expansionFactor;

  const ExpandingDotsEffect({
    this.expansionFactor = 3,
    double offset,
    double dotWidth = 16.0,
    double dotHeight = 16.0,
    double spacing = 8.0,
    double radius = 16.0,
    Color activeDotColor = Colors.indigo,
    Color dotColor = Colors.grey,
    double strokeWidth = 1.0,
    PaintingStyle paintStyle = PaintingStyle.fill,
  })  : assert(expansionFactor != null),
        assert(expansionFactor > 1),
        super(
            dotWidth: dotWidth,
            dotHeight: dotHeight,
            spacing: spacing,
            radius: radius,
            strokeWidth: strokeWidth,
            paintStyle: paintStyle,
            dotColor: dotColor,
            activeDotColor: activeDotColor);

  @override
  Size calculateSize(int count) {
    // Add the expanded dot width to our size calculation
    return Size(dotWidth,
        ((dotHeight + spacing) * (count - 1)) + (expansionFactor * dotHeight));
  }

  @override
  IndicatorPainter buildPainter(int count, double offset, bool isRTL) {
    return ExpandingDotsPainter(
        count: count, offset: offset, effect: this, isRTL: isRTL);
  }
}
