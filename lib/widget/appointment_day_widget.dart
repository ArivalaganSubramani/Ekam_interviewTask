import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DayWidget extends StatefulWidget {
  const
  DayWidget({Key? key, required this.widgetSubTitle, required this.widgetTitle}) : super(key: key);

  final String widgetTitle;
  final String widgetSubTitle;

  @override
  State<DayWidget> createState() => _DayWidgetState();
}

class _DayWidgetState extends State<DayWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.widgetTitle),
            Text(widget.widgetSubTitle),
          ],
        ),
    );
  }
}
