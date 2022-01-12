import 'package:flutter/material.dart';

class OutcomeText extends StatelessWidget {
  const OutcomeText(this.text, {Key? key}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 30),
    );
  }
}
