import 'package:flutter/material.dart';
import 'package:healthcare_app/pages/home_page.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'add_image/add_image.dart';
import 'add_image/doctor_visit.dart';
import 'add_image/lab_report.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      // home: HomePage(),
    );
  }
}
