import 'package:flutter/material.dart';
import 'package:rioro_dev/rioro/blocs/widgets/outcome_text.dart';
import 'package:rioro_dev/rioro/models/outcome_model.dart';

class OutcomeEntry extends StatelessWidget {
  const OutcomeEntry({Key? key, required this.onHover, required this.model})
      : super(key: key);
  final bool onHover;
  final OutcomeModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        OutcomeText(model.cost.toString()),
        OutcomeText(model.type),
        OutcomeText(model.description),
        const OutcomeText('...'),
      ],
    );
  }
}
