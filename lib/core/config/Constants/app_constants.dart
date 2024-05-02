import 'package:flutter/material.dart';

import '../../../doc_doc_app.dart';

class AppConstants {
  static var theme = Theme.of(navigatorKey.currentState!.context);
  static var mediaQuery = MediaQuery.of(navigatorKey.currentState!.context);
}

class HiveBoxKeys {
  static const String specialities = "specialities_box";
  static const String doctorSpeciality = "doctor_speciality_box";
  static const String allDoctors = "all_doctors_box";
}
