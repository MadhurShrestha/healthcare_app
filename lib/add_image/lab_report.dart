import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthcare_app/add_image/view_lab_reports.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:intl/intl.dart';

class LabReport extends StatefulWidget {
  const LabReport({Key? key}) : super(key: key);

  @override
  State<LabReport> createState() => _LabReportState();
}

class _LabReportState extends State<LabReport> {
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
        title: Text('Lab Report'),
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
                  hintText: 'Report Name',
                ),
              ),
              TextField(
                controller: _date,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.date_range),
                  border: InputBorder.none,
                  hintText: 'Report Date',
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
              CustomButton(
                  title: 'Choose an image',
                  icon: Icons.image_outlined,
                  onClick: () => getImage(ImageSource.gallery)),
              CustomButton(
                title: 'Open Camera',
                icon: Icons.camera,
                onClick: () => getImage(ImageSource.camera),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ViewLabReports()));
                },
                icon: Icon(Icons.save_as_sharp),
                label: Text('Save '),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontStyle: FontStyle.italic),
                ),
              )
            ],
          ),
        ),
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
