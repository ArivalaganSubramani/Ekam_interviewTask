import 'package:ekam_interviewtask/Screens/home_screen.dart';
import 'package:ekam_interviewtask/Screens/view_booking.dart';
import 'package:flutter/material.dart';

import 'Screens/booking_conformation.dart';
import 'Screens/review_booking.dart';
import 'Screens/select_package.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ekam',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}


