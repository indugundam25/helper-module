import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:helper_module/constants/app_colors.dart';
import 'package:helper_module/screens/AddHelper.dart';
import 'package:helper_module/screens/DocumentType.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

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
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return SizedBox(
                  height: 300,
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: 20.0),
                        Icon(
                          Icons.warning_amber,
                          size: 50.0,
                          color: Colors.amber[700],
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Discard changes?',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Text(
                          'Going back without saving will not keep the changes.',
                        ),
                        SizedBox(height: 50.0),
                        Row(
                          children: [
                            SizedBox(width: 50.0),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                ),
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddHelper( service : ''),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.amber[700],
                                ),
                                child: Text(
                                  'Discard',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
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
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> DocumentType()));
              },
              readOnly: true,
              decoration: InputDecoration(
                hintText: 'Aadhar card',
                suffixIcon: Icon(
                  PhosphorIcons.caretDown(PhosphorIconsStyle.regular),
                ),
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
                      PhosphorIcons.cloudArrowUp(PhosphorIconsStyle.regular),
                      color: AppColors.neonblue,
                      size: 50.0,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Upload',
                      style: TextStyle(
                        color: AppColors.neonblue,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ListTile(
              leading: Stack(
                alignment: Alignment.center, 
                children: [
                  SvgPicture.asset(
                    'assets/images/file_color.svg', 
                    width: 30.0,
                    height: 40.0,
                    fit: BoxFit.cover,
                  ),
                  SvgPicture.asset(
                    'assets/images/jpg.svg', 
                    alignment: Alignment.bottomCenter,
                    width: 7.0,
                    height: 7.0,
                  ),
                ],
              ),

              title: Text('87654dfghvgf'),
              subtitle: Text('1.5 MB'),
              trailing: Icon(PhosphorIcons.trash(PhosphorIconsStyle.regular), color: Colors.red,),
            ),
            SizedBox(height: 280.0),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: Row(
                children: [
                  SizedBox(width: 100.0),
                  Icon(Icons.save, size: 20.0, color: Colors.white),
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
