import 'package:flutter/material.dart';
import 'package:rioro_dev/rioro/home_temp.dart';

class Rioro extends StatelessWidget {
  const Rioro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeTemp(),
    );
  }
}
