// To parse this JSON data, do
//
//     final mybookings = mybookingsFromJson(jsonString);

import 'dart:convert';

List<Mybookings> mybookingsFromJson(String str) => List<Mybookings>.from(json.decode(str).map((x) => Mybookings.fromJson(x)));

String mybookingsToJson(List<Mybookings> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Mybookings {
  String bookingId;
  String doctorName;
  String location;
  String appointmentDate;
  String appointmentTime;

  Mybookings({
    required this.bookingId,
    required this.doctorName,
    required this.location,
    required this.appointmentDate,
    required this.appointmentTime,
  });

  factory Mybookings.fromJson(Map<String, dynamic> json) => Mybookings(
    bookingId: json["booking_id"],
    doctorName: json["doctor_name"],
    location: json["location"],
    appointmentDate: json["appointment_date"],
    appointmentTime: json["appointment_time"],
  );

  Map<String, dynamic> toJson() => {
    "booking_id": bookingId,
    "doctor_name": doctorName,
    "location": location,
    "appointment_date": appointmentDate,
    "appointment_time": appointmentTime,
  };
}
