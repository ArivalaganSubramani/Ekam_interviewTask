import 'package:ekam_interviewtask/Model/doctor_model.dart';
import 'package:ekam_interviewtask/Network/apiConstant.dart';
import 'package:ekam_interviewtask/Network/apiService.dart';
import 'package:ekam_interviewtask/Screens/appointment_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Doctors extends StatefulWidget {
  const Doctors({Key? key}) : super(key: key);

  @override
  State<Doctors> createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {

  late List<Doctordetails> doctorDetails= [];



  var Name = '';
  var DImage = 'https://picsum.photos/seed/572/600';
  var Speciality = '';
  var Location = '';




  @override
  initState() {
    getDoctorDetails();
    super.initState();
  }
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Doctor List'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,

                  itemCount: doctorDetails.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context) => AppointmentDetails(doctorDetails: doctorDetails[index],)));

                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(width: 10),
                                  Stack(
                                    children: [
                                      ClipOval(child: Image.network(
                                        doctorDetails[index].image, height: 100, width: 100,),
                                      ),
                                      Positioned(
                                          right: -3,
                                          bottom: 5,
                                          child: Icon(Icons.verified,
                                            color: Colors.blueAccent,)),
                                    ],

                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(doctorDetails[index].doctorName, style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                      Text(doctorDetails[index].speciality, style: TextStyle(
                                          fontWeight: FontWeight.w300),
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.location_on,
                                              color: Colors.blue),
                                          Text(doctorDetails[index].location)
                                        ],
                                      )
                                    ],
                                  )

                                ],
                              ),

                            ]
                        ),
                      ),
                    );
                  } // title: Text("List item $index"));
              ),
            ),

          ],
        ),
      );
    }
    void getDoctorDetails() async {
      var apiResponse = await ApiService().getApiData(ApiConstants.Doctor);
       doctorDetails = doctordetailsFromJson(apiResponse!);
      setState(() {

      });
    }
}

