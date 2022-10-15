import 'package:flutter/material.dart';
import 'package:healthcare_app/add_image/save_doctor_visit.dart';
import 'package:healthcare_app/add_image/view_lab_reports.dart';
import 'package:healthcare_app/util/doctor_card.dart';
import 'package:lottie/lottie.dart';

import '../add_image/doctor_visit.dart';
import '../add_image/lab_report.dart';
import '../util/category_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            //appbar
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //name
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Hello,',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Aayush Shrestha',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),

                    //profilepicture
                    Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple[100],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.person)),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.pink[100],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Container(
                          height: 100,
                          width: 100,
                          child: Lottie.network(
                              'https://assets6.lottiefiles.com/packages/lf20_iivslabn.json',
                              height: 200,
                              width: 200)),
                      const SizedBox(
                        width: 25,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'How do you feel?',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Column(children: [
                              ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.deepPurpleAccent)),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DoctorVisit()));
                                  },
                                  child: const Text('Add doctor visits')),
                              ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.deepPurpleAccent)),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => SaveDoctorVisit()));
                                },
                                child: Text('View doctor visits'),
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.deepPurpleAccent)),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => LabReport()));
                                },
                                child: Text('Add lab reports'),
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.deepPurpleAccent)),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ViewLabReports()));
                                },
                                child: Text('View lab reports'),
                              ),
                            ]),
                          ],
                        ),
                      )
                    ],
                    //animation or picture

                    //how do you feel + get started button
                  )),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.deepPurple[100],
                      borderRadius: BorderRadius.circular(12)),
                  child: const TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      hintText: 'How can we help you?',
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  (CategoryCard(
                    categoryName: 'Dentist',
                    iconImagePath: 'lib/icons/clean.png',
                  )),
                  CategoryCard(
                    categoryName: 'Surgeon',
                    iconImagePath: 'lib/icons/surgeon.png',
                  ),
                  CategoryCard(
                    categoryName: 'Pharmacist',
                    iconImagePath: 'lib/icons/pills.png',
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Doctor List',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.grey[600]),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),

            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  DoctorCard(
                    doctorImagePath: 'lib/images/doc1.jpg',
                    doctorName: 'Dr. Blake Buggins',
                    doctorProfession: 'Therapist',
                  ),
                  DoctorCard(
                    doctorImagePath: 'lib/images/doc2.jpg',
                    doctorName: 'Amelia Kahneman',
                    doctorProfession: 'Surgeon',
                  ),
                  DoctorCard(
                    doctorImagePath: 'lib/images/doc3.jpg',
                    doctorName: 'Dr. Hemlen Shulz',
                    doctorProfession: 'Pharmacist',
                  ),
                  DoctorCard(
                    doctorImagePath: 'lib/images/doc3.jpg',
                    doctorName: 'Dr. Hemlen Shulz',
                    doctorProfession: 'Pharmacist',
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),

            //card -> how do you feel

            //horizontal listview -> categories: dentist, surgeon etc.

            //doctor list
          ],
        ),
      ),
    );
  }
}
