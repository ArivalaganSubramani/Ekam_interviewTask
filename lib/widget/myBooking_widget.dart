import 'package:ekam_interviewtask/Model/mybookings_model.dart';
import 'package:ekam_interviewtask/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingWidget extends StatefulWidget {
  const BookingWidget({Key? key, required this.mybookings}) : super(key: key);

  final Mybookings mybookings;
  @override
  State<BookingWidget> createState() => _BookingWidgetState();
}

class _BookingWidgetState extends State<BookingWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(width: 1),
            borderRadius: BorderRadius.all(Radius.circular(10),),
          ),
          child: Column(
            children: [
              SizedBox(height: 15),
              Text(widget.mybookings.appointmentDate +'     '+ widget.mybookings.appointmentTime,style: TextStyle(fontWeight: FontWeight.bold)),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10),
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset('assets/${widget.mybookings.doctorName}.jpg', width: 65,height: 70,),
                  ),
                  Column(
                    children: [
                      SizedBox(width: 20),
                      Text(widget.mybookings.doctorName,style: TextStyle(fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          Icon(Icons.location_on,color: Colors.blue),
                          Text(widget.mybookings.location)
                        ],
                      ),
                      Text(widget.mybookings.bookingId,style: TextStyle(fontWeight: FontWeight.w300)),


                    ],
                  ),
                ],
              ),
              SizedBox(height: 30),
              Divider(),
              Row(
                children: [
                  SizedBox(width: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey,
                      onPrimary: Colors.white,
                      shadowColor: Colors.greenAccent,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      minimumSize: Size(50, 50),
                    ),
                    onPressed: () {},
                    child: Text('Cancel'),
                  ),
                  SizedBox(width: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.white,
                      shadowColor: Colors.greenAccent,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      minimumSize: Size(50, 50),
                    ),
                    onPressed: () {},
                    child: Text('Reschedule'),
                  ),
                ],
              )
            ],
          ),

          ),
      ),

    );
  }
}
