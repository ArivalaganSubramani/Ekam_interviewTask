import 'package:ekam_interviewtask/Screens/doctors_list.dart';
import 'package:ekam_interviewtask/Screens/view_booking.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),

      ),
      body:  SingleChildScrollView(
        child: Column(
          children:[ ListTile(
            leading: Icon(Icons.airplane_ticket_outlined),
            title: Text(
              'Make Booking',
              textScaleFactor: 1.5,
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            subtitle: Text('Book appointment to consult doctor'),
            selected: true,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Doctors(),
                ),
              );
            },
          ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.airplane_ticket),
              title: Text(
                'My Booking',
                textScaleFactor: 1.5,
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              subtitle: Text('View your Bookings'),
              selected: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewBooking(),
                  ),
                );
              },
            ),
         ],
        ),
      ),
    );
  }
}
