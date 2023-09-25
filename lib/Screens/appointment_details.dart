import 'dart:convert';
import 'package:ekam_interviewtask/Model/doctor_model.dart';
import 'package:ekam_interviewtask/Network/apiConstant.dart';
import 'package:ekam_interviewtask/Network/apiService.dart';
import 'package:ekam_interviewtask/Screens/select_package.dart';
import 'package:ekam_interviewtask/utils/Constants.dart';
import 'package:ekam_interviewtask/widget/appointment_day_widget.dart';
import 'package:ekam_interviewtask/widget/appointment_time_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/doctor_widgets.dart';

class AppointmentDetails extends StatefulWidget {
  const AppointmentDetails({Key? key, this.doctorDetails}) : super(key: key);

  final Doctordetails? doctorDetails;



  @override
  State<AppointmentDetails> createState() => _AppointmentDetailsState();
}

class _AppointmentDetailsState extends State<AppointmentDetails> {

  String? selectedKey;
  List<String> selectedValues = [];

  String timeSelected = '';


  late List<bool> isSelected;


  void selectItem(int index) {
    setState(() {
      isSelected[index] = !isSelected[index];
    });
  }


  @override
  initState() {
    // getDoctorDetails();
    isSelected = List.generate(widget.doctorDetails!.availability.length, (index) => false);
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Appointment'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(width: 10),
                  Stack(
                    children: [
                      ClipOval(child: Image.network(widget.doctorDetails!.image,height: 100,width: 100,),
                        ),
                        Positioned(
                          right: -3,
                            bottom: 5,
                            child: Icon(Icons.verified, color: Colors.blueAccent,)),
                      ],

                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.doctorDetails!.doctorName,  style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(widget.doctorDetails!.speciality,  style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_on,color: Colors.blue),
                          Text(widget.doctorDetails!.location)
                        ],
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 20),
              Divider(),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 80,
                      height: 100,
                      child: DoctorWidget(widgetIcon: Icon(Icons.person, color: Constants.iconColor,),
                        widgetSubTitle: 'Patients', widgetTitle: widget.doctorDetails!.patientsServed.toString(),)),

                  SizedBox(
                    width: 80,
                      height: 100,
                      child: DoctorWidget(widgetIcon: Icon(Icons.card_travel, color: Constants.iconColor,),
                        widgetSubTitle: 'Year Exp', widgetTitle: widget.doctorDetails!.yearsOfExperience.toString(),)),
                  SizedBox(
                      width: 80,
                      height: 100,
                      child: DoctorWidget(widgetIcon: Icon(Icons.star, color: Constants.iconColor,),
                        widgetSubTitle: 'Rating', widgetTitle: widget.doctorDetails!.rating.toString(),)),
                  SizedBox(
                      width: 80,
                      height: 100,
                      child: DoctorWidget(widgetIcon: Icon(Icons.message, color: Constants.iconColor,),
                        widgetSubTitle: 'Review', widgetTitle: widget.doctorDetails!.numberOfReviews.toString(),)),


                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.fromLTRB(10,0,0,0),
                child: Text('Book Appointment',style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.fromLTRB(20,0,0,0),
                child: Text("Day",style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.fromLTRB(20,0,0,0),
                child: Container(
                  height: 60,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                      itemCount: widget.doctorDetails?.availability.length,

                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: (){
                            selectItem(index);
                            setState(() {
                              isSelected = List.generate(isSelected.length, (i) => false);
                              isSelected[index] = true;

                              selectedKey = widget.doctorDetails!.availability.keys.elementAt(index);
                              selectedValues = List.from(widget.doctorDetails?.availability[widget.doctorDetails!.availability.keys.elementAt(index)] ?? []);// Toggle selection on tap

                            });

                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Container(
                              width: 150,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: isSelected[index] ? Colors.blue : Colors.transparent,

                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(widget.doctorDetails!.availability.keys.elementAt(index)),
                                  ],
                                ),

                              ),
                            ),
                          ),
                        );



                      }// title: Text("List item $index"));
                  ),
                ),
              ),

              SizedBox(height: 20),

              Padding(
                padding: EdgeInsets.fromLTRB(20,0,0,0),
                child: Text("Time",style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.fromLTRB(20,0,0,0),
                child: Container(
                  height: 70,
                  child: selectedValues.length <=0 ? SizedBox.shrink() : ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: selectedValues.length,

                      itemBuilder: (BuildContext context, int index) {
                        String value = selectedValues[index];

                        return GestureDetector(
                          onTap: (){
                            selectItem(index);
                            // Toggle selection on tap
                            timeSelected = value;
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Container(
                              width:200,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                // color: isSelected[index] ? Colors.blue : Colors.transparent,

                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(value),
                                  ],
                                ),

                              ),
                            ),
                          ),
                        );



                      }// title: Text("List item $index"));
                  ),
                ),
              ),







              SizedBox(height: 30),
              Divider(),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    shadowColor: Colors.greenAccent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    minimumSize: Size(250, 50),
                  ),
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => Package(doctorDetails: widget.doctorDetails, selectedKey:selectedKey!, selectedValues: timeSelected)));


                  },
                  child: Text('Make Appointment'),
                )

              ),






            ],
          ),
        ),
      ),
    );
  }
}

