import 'package:flutter/material.dart';

class SingleDoctorVisit extends StatefulWidget {
  const SingleDoctorVisit({Key? key}) : super(key: key);

  @override
  State<SingleDoctorVisit> createState() => _SingleDoctorVisitState();
}

class _SingleDoctorVisitState extends State<SingleDoctorVisit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Neurosurgeon Visit'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Image.network(
              'https://www.nejm.org/na101/home/literatum/publisher/mms/journals/content/nejm/1999/nejm_1999.341.issue-7/nejm199908123410703/production/images/img_medium/nejm199908123410703_f1.jpeg',
              height: 400,
              width: 400,
            ),
            SizedBox(height: 10),
            Text('Name: Saurabh Khatiwada'),
            SizedBox(height: 10),
            Text('Date: 2078/05/02'),
            SizedBox(height: 10),
            Text('Reason for visit: TG Increase while regular checkup'),
            SizedBox(height: 10),
            Text('Continue dosage of telsamartin. Follow up after 3 months'),
          ],
        ),
      ),
    );
  }
}
