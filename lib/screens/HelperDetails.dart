// ignore: file_names
import 'package:flutter/material.dart';
import 'package:helper_module/constants/app_colors.dart';

class HelperDetails extends StatefulWidget {
  const HelperDetails({super.key});

  @override
  State<HelperDetails> createState() => _HelperDetailsState();
}

class _HelperDetailsState extends State<HelperDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
      ),
    );
  }
}
