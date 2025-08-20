import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:helper_module/constants/app_colors.dart';

class KYCDocument extends StatefulWidget {
  const KYCDocument({super.key});

  @override
  State<KYCDocument> createState() => _KYCDocumentState();
}

class _KYCDocumentState extends State<KYCDocument> {
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
        title: const Text("KYC Document"),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            SizedBox(height: 20.0),
            Text('Document Type'),
            SizedBox(height: 7.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Aadhar card',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            Text('Please upload both sides of the document'),
            SizedBox(height: 10.0),
            DottedBorder(
              color: AppColors.neonblue,
              strokeWidth: 2,
              radius: Radius.circular(20.0),
              dashPattern: [6, 3],
              borderType: BorderType.RRect,

              child: Container(
                height: 150,
                width: 380,
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  shape: BoxShape.rectangle,
                ),
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
                      style: TextStyle(
                        color: AppColors.neonblue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 380.0),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: Row(
                children: [
                  SizedBox(width: 100.0,),
                  Icon(Icons.save, size: 20.0, color: Colors.white,),
                  SizedBox(width: 10.0),
                  Text('Save KYC', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
