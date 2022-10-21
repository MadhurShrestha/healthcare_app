import 'package:flutter/material.dart';
import 'package:pinch_zoom_release_unzoom/pinch_zoom_release_unzoom.dart';

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
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Text('Date: 2079/05/05'),
              SizedBox(
                height: 10,
              ),
              Center(
                child: PinchZoomReleaseUnzoomWidget(
                  fingersRequiredToPinch: -1,
                  child: Image.network(
                      'https://www.nejm.org/na101/home/literatum/publisher/mms/journals/content/nejm/1999/nejm_1999.341.issue-7/nejm199908123410703/production/images/img_medium/nejm199908123410703_f1.jpeg'),
                  zoomChild:
                      Container(height: 500, width: 500, color: Colors.red),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit_outlined), label: '1'),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm_rounded), label: '2')
        ],
      ),
    );
  }
}
