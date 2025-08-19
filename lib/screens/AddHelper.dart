// ignore: file_names
import 'package:flutter/material.dart';

class AddHelper extends StatefulWidget {
  const AddHelper({super.key});

  @override
  State<AddHelper> createState() => _AddHelperState();
}

class _AddHelperState extends State<AddHelper> {
  @override
  Widget build(BuildContext context) {
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
            ),
          ),
          backgroundColor: Colors.indigo[900],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 100.0,
                backgroundColor: Colors.grey[200],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.indigo[500],
                      size: 50.0,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Take Photo',
                      style: TextStyle(color: Colors.indigo[500]),
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
