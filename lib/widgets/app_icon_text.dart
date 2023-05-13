import 'package:flutter/cupertino.dart';

class AppIconText extends StatelessWidget {
  final Icon icon;
  final Widget text;
  final double width;

  const AppIconText(
      {Key? key, required this.icon, required this.text, this.width = 4})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        SizedBox(
          width: width,
        ),
        text
      ],
    );
  }
}
