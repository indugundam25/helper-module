import 'package:flutter/material.dart';
import 'package:helper_module/constants/app_colors.dart';

class EditHelper extends StatefulWidget {
  const EditHelper({super.key});

  @override
  State<EditHelper> createState() => _EditHelperState();
}

class _EditHelperState extends State<EditHelper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.chevron_left),
        ),
        title: const Text("Edit Helper"),
        backgroundColor: AppColors.primary,
      ),
    );
  }
}