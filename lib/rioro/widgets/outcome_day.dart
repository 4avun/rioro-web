import 'package:flutter/material.dart';
import 'package:rioro_dev/rioro/blocs/widgets/outcome_tile.dart';

class OutcomeDay extends StatefulWidget {
  const OutcomeDay({Key? key}) : super(key: key);

  @override
  _OutcomeDayState createState() => _OutcomeDayState();
}

class _OutcomeDayState extends State<OutcomeDay> {
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          child: OutcomeTile(child: ,),
        )
      ],
    );
  }
}

class _OutcomeDayTile extends StatelessWidget {
  const _OutcomeDayTile({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'one day, will change it soon'
    );
  }
}

class _OutcomeDayAvg extends StatelessWidget {
  const _OutcomeDayAvg({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'one day, will change it soon'
    );
  }
}