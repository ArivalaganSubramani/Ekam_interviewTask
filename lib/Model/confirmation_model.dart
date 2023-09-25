
import 'dart:convert';

Confirmation confirmationFromJson(String str) => Confirmation.fromJson(json.decode(str));

String confirmationToJson(Confirmation data) => json.encode(data.toJson());

class Confirmation {
  String doctorName;
  String appointmentDate;
  String appointmentTime;
  String location;
  String appointmentPackage;

  Confirmation({
    required this.doctorName,
    required this.appointmentDate,
    required this.appointmentTime,
    required this.location,
    required this.appointmentPackage,
  });

  factory Confirmation.fromJson(Map<String, dynamic> json) => Confirmation(
    doctorName: json["doctor_name"],
    appointmentDate: json["appointment_date"],
    appointmentTime: json["appointment_time"],
    location: json["location"],
    appointmentPackage: json["appointment_package"],
  );

  Map<String, dynamic> toJson() => {
    "doctor_name": doctorName,
    "appointment_date": appointmentDate,
    "appointment_time": appointmentTime,
    "location": location,
    "appointment_package": appointmentPackage,
  };
}
