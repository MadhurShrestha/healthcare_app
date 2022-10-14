import 'package:flutter/material.dart';

class SaveDoctorVisit extends StatefulWidget {
  const SaveDoctorVisit({Key? key}) : super(key: key);

  @override
  State<SaveDoctorVisit> createState() => _SaveDoctorVisitState();
}

class _SaveDoctorVisitState extends State<SaveDoctorVisit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My doctor visists'),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.all(10),
          height: 120,
          color: Colors.white,
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
                      'Lorem',
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
                      'Ipsum',
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(Icons.group_work),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      'Lorem Ipsum',
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
                            builder: (_) => SaveDoctorVisit(),
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
