import 'package:flutter/material.dart';

class CustomRoundedRectangleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CustomRoundedRectangleTabIndicator(
      {@required Color color, @required double weight, @required double width})
      : _painter = _CustomRectanglePainterColor(color, weight, width);

  @override
  BoxPainter createBoxPainter([onChanged]) => _painter;
}

class _CustomRectanglePainterColor extends BoxPainter {
  final Paint _paint;
  final double weight;
  final double width;

  _CustomRectanglePainterColor(Color color, this.weight, this.width)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    // Custom Position
    final Offset customOffset = offset +
        Offset(cfg.size.width / 2 - (width * 0.5), cfg.size.height - weight);

    //Custom Rectangle
    Rect myRect = customOffset & Size(width, weight);

    // Custom Rounded Rectangle
    RRect myRRect = RRect.fromRectXY(myRect, weight, weight);

    // Finally we have to draw
    canvas.drawRRect(myRRect, _paint);
  }
}
