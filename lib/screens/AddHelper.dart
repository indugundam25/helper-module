// ignore: file_names
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:helper_module/constants/app_colors.dart';

class AddHelper extends StatefulWidget {
  const AddHelper({super.key});

  @override
  State<AddHelper> createState() => _AddHelperState();
}

class _AddHelperState extends State<AddHelper> {
  @override
  Widget build(BuildContext context) {
    final helperkey = GlobalKey<FormState>();
    File? imageFile; 
  final ImagePicker picker = ImagePicker();

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.camera, 
    );

    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.chevron_left, color: Colors.white, size: 40.0),
          ),
          title: const Text(
            'Add Helper',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Nunito Sans',
            ),
          ),
          backgroundColor:  AppColors.primary,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: CircleAvatar(
                  radius: 80.0,
                  backgroundColor:  AppColors.accent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_alt_outlined,
                        color: AppColors.neonblue,
                        size: 50.0,
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Take Photo',
                        style: TextStyle(color: AppColors.neonblue),
                      ),
                    ],
                  ),
                ),
              ),
              Form(
        key: helperkey,
        child: Column(
          children: [
            SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 30.0,
              ),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter name';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  labelText: 'First Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 30.0,
              ),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter sur name';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  labelText: 'Sur Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 30.0,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Company',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 30.0,
              ),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Phone number';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  labelText: 'Phone (Mobile)',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 30.0,
              ),
              child: SizedBox(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Notes',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
            ],
          ),
        ),
      ),
    );
  }
}
