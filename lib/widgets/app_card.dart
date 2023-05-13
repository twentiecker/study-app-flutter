import 'package:flutter/material.dart';
import '../configs/themes/ui_parameters.dart';

class AppCard extends StatelessWidget {
  final double height, width;
  final Widget child;

  const AppCard(
      {Key? key,
      required this.height,
      required this.width,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(1, 2),
              ),
            ],
            borderRadius: UIParameters.cardBorderRadius,
            color: Theme.of(context).cardColor),
        child: child);
  }
}
