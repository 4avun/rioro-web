import 'package:flutter/material.dart';

class OutcomeTile extends StatefulWidget {
  const OutcomeTile({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  _OutcomeTileState createState() => _OutcomeTileState();
}

class _OutcomeTileState extends State<OutcomeTile> {
  bool onHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => setState(() {
        onHover = true;
      }),
      onExit: (e) => setState(() {
        onHover = false;
      }),
      child: widget.child,
    );
  }
}

// Should have general info, hover property, settings button on hover