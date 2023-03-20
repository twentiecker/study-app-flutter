import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/common/background_decoration.dart';

class QuestionsScreen extends StatelessWidget {
  // questionsscreen
  static const String routeName = "/questions";

  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundDecoration(
        child: Center(
            child: Text(
          'I\'m here in questions page',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
