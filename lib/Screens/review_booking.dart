import 'package:ekam_interviewtask/Model/doctor_model.dart';
import 'package:ekam_interviewtask/Screens/booking_conformation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReviewSummary extends StatefulWidget {
  const ReviewSummary({Key? key,required this.doctorDetails,required this.selectedKey,required this.selectedValues,required this.dropdownValue, required this.selectedPackage}) : super(key: key);

final Doctordetails? doctorDetails;
  final String selectedKey;
  final String selectedValues;
  final String dropdownValue;
  final String selectedPackage;


  @override
  State<ReviewSummary> createState() => _ReviewSummaryState();
}

class _ReviewSummaryState extends State<ReviewSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review Summary'),
      ),
      body: SingleChildScrollView(

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              SizedBox(
                  height: 150,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              ClipOval(child: Image.network(widget.doctorDetails!.image),
                              ),
                              Positioned(
                                  right: -5,
                                  bottom: 5,
                                  child: Icon(Icons.verified, color: Colors.blueAccent,size: 50,)),
                            ],
                          ),
                          SizedBox(width: 20),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(widget.doctorDetails!.doctorName),
                              Text(widget.doctorDetails!.speciality),
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
                    ),

                ),

              SizedBox(height: 20),
              Divider(),
              SizedBox(height: 15,),
              Row(
                children: [
                  SizedBox(width: 20),

                  Expanded(
                      flex: 1,
                      child: const Text("Date & Hours")),
                  SizedBox(width: 10),
                  Expanded(
                      flex: 3,
                      child: Text(widget.selectedValues + '  |  ' + widget.selectedKey,textAlign: TextAlign.end,)),
                  SizedBox(width: 20),

                ],
              ),
              Row(
                children: [
                  SizedBox(width: 20),

                  Expanded(
                      flex: 1,
                      child: const Text("Package")),
                  SizedBox(width: 10),
                  Expanded(
                      flex: 3,
                      child: Text(widget.selectedPackage,textAlign: TextAlign.end,)),
                  SizedBox(width: 20),

                ],
              ),
              Row(
                children: [
                  SizedBox(width: 20),

                  Expanded(
                      flex: 1,
                      child:  Text("Duration")),
                  SizedBox(width: 10),
                  Expanded(
                      flex: 3,
                      child: Text(widget.dropdownValue,textAlign: TextAlign.end,)),
                  SizedBox(width: 20),

                ],
              ),
              Row(
                children: [
                  SizedBox(width: 20),

                  Expanded(
                      flex: 1,
                      child: const Text("Booking For")),
                  SizedBox(width: 10),
                  Expanded(
                      flex: 3,
                      child: Text("Self", textAlign: TextAlign.end,)),
                  SizedBox(width: 20),
                ],
              ),
              SizedBox(height: 20),
              Divider(),
              SizedBox(height: 70),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    shadowColor: Colors.greenAccent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    minimumSize: Size(200, 50),
                  ),
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) =>const Conformation()));

                  },
                  child: Text('Confirm'),
                ),
              )

            ],

        ),
      ),
    );
  }
}
