import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final String doctorImagePath;
  final String doctorName;
  final String doctorProfession;

  DoctorCard(
      {required this.doctorImagePath,
      required this.doctorName,
      required this.doctorProfession});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.deepPurple[100],
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child:
//picture of doctor
                    Image.asset(
                  doctorImagePath,
                  height: 80,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
//doctor name
            Text(
              doctorName,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
//doctor title
            Text(doctorProfession),
          ],
        ),
      ),
    );
  }
}
