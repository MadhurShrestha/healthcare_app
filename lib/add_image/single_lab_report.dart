import 'package:flutter/material.dart';

class SingleLabReport extends StatefulWidget {
  const SingleLabReport({Key? key}) : super(key: key);

  @override
  State<SingleLabReport> createState() => _SingleLabReportState();
}

class _SingleLabReportState extends State<SingleLabReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NRL Package'),
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
              height: 200,
              width: 200,
            ),
          ],
        ),
      ),
    );
  }
}
