import 'package:ekam_interviewtask/Model/mybookings_model.dart';
import 'package:ekam_interviewtask/Network/apiConstant.dart';
import 'package:ekam_interviewtask/Network/apiService.dart';
import 'package:ekam_interviewtask/widget/myBooking_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewBooking extends StatefulWidget {
  const ViewBooking({Key? key}) : super(key: key);

  @override
  State<ViewBooking> createState() => _ViewBookingState();
}

class _ViewBookingState extends State<ViewBooking> {

  late List<Mybookings> bookingDetails= [];

  var BookingId = '';
  var DoctorName = '';
  var AppointmentDate = '';
  var AppointmentTime = '';
  var Location = '';


  @override
  initState() {
    getBookingDetails();
    super.initState();
  }


  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('My Bookings'),
      ),
      body: ListView.builder(
          itemCount: bookingDetails.length,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
                width: 100,
                height: 300,
                child: BookingWidget(mybookings: bookingDetails[index],));// title: Text("List item $index"));
          }),

    );
  }
  void getBookingDetails() async {
    var apiResponse = await ApiService().getApiData(ApiConstants.MyBookings);
    bookingDetails = mybookingsFromJson(apiResponse!);
    setState(() {


    });
  }
}
