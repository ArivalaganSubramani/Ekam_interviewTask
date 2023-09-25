import 'package:ekam_interviewtask/Model/confirmation_model.dart';
import 'package:ekam_interviewtask/Network/apiConstant.dart';
import 'package:ekam_interviewtask/Network/apiService.dart';
import 'package:ekam_interviewtask/Screens/view_booking.dart';
import 'package:flutter/material.dart';

class Conformation extends StatefulWidget {
  const Conformation({Key? key}) : super(key: key);

  @override
  State<Conformation> createState() => _ConformationState();
}

class _ConformationState extends State<Conformation> {
  var confirmationDetails;


  var DoctorName = " ";
  var AppointmentDate =" ";
  var AppointmentTime = " ";
  var Location = " ";
  var AppointmentPackage = " ";



  @override
  initState() {
    getConfirmationDetails();
    super.initState();
  }



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conformation'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 60),
          Center(child: Image.asset('assets/verified.png',height: 150,width: 150,)),
          Center(child: Text("Appointment Conformed!")),
          SizedBox(height: 20),
          Center(child: Text("You have successfully booled appointment wit")),
          SizedBox(height: 10),
          Center(child: Text(DoctorName,style: TextStyle(fontWeight: FontWeight.bold))),
          Divider(),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.person),
                Text('Esther Howard'),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Icon(Icons.calendar_month),
                    Text(AppointmentDate),
                  ],
                ),
                SizedBox(width: 30),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Icon(Icons.timer),
                    Text(AppointmentTime),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
          Divider(),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
                child: Text(
                    "View Appointment".toUpperCase(),
                    style: TextStyle(fontSize: 14)
                ),
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.blue)
                        )
                    )
                ),
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) =>const ViewBooking()));

                },
            ),
          ),
          Center(
            child: TextButton(
                child: Text(
                    "Book Another".toUpperCase(),
                    style: TextStyle(fontSize: 14,color: Colors.blue)

                ),

                onPressed: () {
                  // Navigator.push(context,MaterialPageRoute(builder: (context) =>const AppointmentDetails()));

                },
            ),
          ),
        ],
      ),
    );
  }
  void getConfirmationDetails() async {
    var apiResponse = await ApiService().getApiData(ApiConstants.BookingConfirmation);
    confirmationDetails = confirmationFromJson(apiResponse!);
    setState(() {
      DoctorName = confirmationDetails.doctorName;
      AppointmentDate = confirmationDetails.appointmentDate.toString();
      AppointmentTime = confirmationDetails.appointmentTime.toString();
      Location = confirmationDetails.location;
      AppointmentPackage = confirmationDetails.appointmentPackage;
    });
  }
}
