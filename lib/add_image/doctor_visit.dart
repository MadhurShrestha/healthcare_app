import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthcare_app/add_image/lab_report.dart';
import 'package:healthcare_app/add_image/save_doctor_visit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:intl/intl.dart';

class DoctorVisit extends StatefulWidget {
  const DoctorVisit({Key? key}) : super(key: key);

  @override
  State<DoctorVisit> createState() => _DoctorVisitState();
}

class _DoctorVisitState extends State<DoctorVisit> {
  TextEditingController _date = TextEditingController();

  File? _image;

  Future getImage(ImageSource source) async {
    try {
      final image = (await ImagePicker().pickImage(source: source));
      if (image == null) return;

      // final imageTemporary = File(image.path);
      final imagePermanent = await saveFilePermanently(image.path);

      setState(() {
        this._image = imagePermanent;
      });
    } on PlatformException catch (e) {
      print('Failed to show image: $e');
    }
  }

  Future<File> saveFilePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor\u0027s Visit'),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.deepPurple[100],
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  border: InputBorder.none,
                  hintText: 'Doctor\u0027s Name',
                ),
              ),
              TextField(
                controller: _date,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.date_range),
                  border: InputBorder.none,
                  hintText: 'Visit Date',
                ),
                onTap: () async {
                  DateTime? pickeddate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2111));

                  if (pickeddate != null) {
                    setState(() {
                      _date.text = DateFormat('yyyy-MM-dd').format(pickeddate);
                    });
                  }
                },
              ),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.book_rounded),
                  border: InputBorder.none,
                  hintText: 'Reason for visit',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.message),
                  border: InputBorder.none,
                  hintText: 'Doctor\u0027s Remarks',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              _image != null
                  ? Image.file(
                      _image!,
                      width: 250,
                      height: 250,
                      fit: BoxFit.cover,
                    )
                  : Image.network('https://picsum.photos/250?image=9'),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SaveDoctorVisit()));
                  },
                  child: Text('OK'))
            ],
          ),
        ),
        // child: Column(
        //   children: [
        //     Text("Doctor\u0027s Name"),
        //     TextField(),
        //     Text('Visit Date'),
        //     TextField(),
        //     Text('Reason for Visit'),
        //     TextField(),
        //     Text('Reason for visit'),
        //     TextField(),
        //     SizedBox(
        //       height: 20,
        //     ),
        //     _image != null
        //         ? Image.file(
        //             _image!,
        //             width: 250,
        //             height: 250,
        //             fit: BoxFit.cover,
        //           )
        //         : Image.network('https://picsum.photos/250?image=9'),
        //     SizedBox(
        //       height: 15,
        //     ),
        //     CustomButton(
        //         title: 'Choose an image',
        //         icon: Icons.image_outlined,
        //         onClick: () => getImage(ImageSource.gallery)),
        //     CustomButton(
        //       title: 'Open Camera',
        //       icon: Icons.camera,
        //       onClick: () => getImage(ImageSource.camera),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}

Widget CustomButton({
  required String title,
  required IconData icon,
  required VoidCallback onClick,
}) {
  return Container(
    width: 260,
    child: ElevatedButton(
      onPressed: onClick,
      child: Row(
        children: [Icon(icon), SizedBox(width: 15), Text(title)],
      ),
    ),
  );
}