import "dart:math";

import "package:flutter/cupertino.dart";

import "clip_painter.dart";

class BezierContainer extends StatelessWidget {
  final num divisorPi;
  final num divisorHeight;

  const BezierContainer({
    Key? key,
    required this.divisorPi,
    required this.divisorHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / divisorPi,
      child: ClipPath(
        clipper: ClipPainter(),
        child: Container(
          height: MediaQuery.of(context).size.height * divisorHeight,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color(0x1A4661E4),
                Color(0x1A4661E4),
              ])),
        ),
      ),
    );
  }
}
