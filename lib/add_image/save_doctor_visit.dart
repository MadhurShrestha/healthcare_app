import 'package:flutter/material.dart';
import 'package:healthcare_app/add_image/single_doctor_visit.dart';

class SaveDoctorVisit extends StatefulWidget {
  const SaveDoctorVisit({Key? key}) : super(key: key);

  @override
  State<SaveDoctorVisit> createState() => _SaveDoctorVisitState();
}

class _SaveDoctorVisitState extends State<SaveDoctorVisit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple[100],
        appBar: AppBar(
          title: Text('My doctor visits'),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.all(10),
          height: 120,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.person, color: Theme.of(context).primaryColor),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      'Normal Checkup',
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(Icons.thumb_up_sharp,
                        color: Theme.of(context).primaryColor),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      'Date',
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(Icons.person),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      'Dr. Saurabh Khatiwada',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SingleDoctorVisit(),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_forward,
                            color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
