import 'package:flutter/material.dart';
import 'package:learning_app/configs/themes/app_colors.dart';

class BackgroundDecoration extends StatelessWidget {
  final Widget child;
  final bool showGradient;

  const BackgroundDecoration(
      {Key? key, required this.child, this.showGradient = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /* fill is used to get all of screen display screen */
        Positioned.fill(
            child: Container(
          decoration: BoxDecoration(
              color: showGradient ? null : Theme.of(context).primaryColor,
              gradient: showGradient ? mainGradient() : null),
          child: CustomPaint(
            painter: BackgroundPainter(),
          ),
        )),
        Positioned(child: child)
      ],
    );
  }
}

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.white.withOpacity(0.1);
    /* double dot before color has meaning like this: *
    *  Paint paint = Paint();                         *
    *  paint.color = Colors.white.withOpacity(0.1);   */
    final path = Path();
    /* set starting point */
    path.moveTo(0, 0);
    /* set point for x */
    path.lineTo(size.width * 0.2, 0);
    /* set point for y */
    path.lineTo(0, size.height * 0.4);
    /* close the line */
    path.close();
    /* draw based on the path that defined before */
    canvas.drawPath(path, paint);

    final pathRight = Path();
    pathRight.moveTo(size.width, 0);
    pathRight.lineTo(size.width*0.8, 0);
    pathRight.lineTo(size.width*0.2, size.height);
    pathRight.lineTo(size.width, size.height);
    pathRight.close();
    canvas.drawPath(pathRight, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
