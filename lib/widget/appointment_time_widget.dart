import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimeWidget extends StatefulWidget {
  const TimeWidget({Key? key, required this.widgetSubTitle, required this.widgetTitle}) : super(key: key);

  final String widgetTitle;
  final String widgetSubTitle;

  @override
  State<TimeWidget> createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(color: Colors.blue, spreadRadius: 3),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(widget.widgetTitle),
              Text(widget.widgetSubTitle),
            ],
          ),
        ),
      ),
    );
  }
}
