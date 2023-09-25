import 'package:ekam_interviewtask/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorWidget extends StatefulWidget {
  const DoctorWidget({Key? key, required this.widgetIcon, required this.widgetSubTitle, required this.widgetTitle}) : super(key: key);
  final Icon widgetIcon;
  final String widgetTitle;
  final String widgetSubTitle;
  @override
  State<DoctorWidget> createState() => _DoctorWidgetState();
}

class _DoctorWidgetState extends State<DoctorWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
      ClipOval(child: Material(
        color: Constants.backgroundColor,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: widget.widgetIcon,
          ))),
          SizedBox(height: 10),
          Text(widget.widgetTitle, style: TextStyle(color: Constants.iconColor, fontWeight: FontWeight.bold),),
          Text(widget.widgetSubTitle),

        ],
      ),
    );
  }
}
