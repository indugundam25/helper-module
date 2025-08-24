import 'package:flutter/material.dart';
import 'package:helper_module/constants/app_colors.dart';

class DocumentType extends StatefulWidget {
  const DocumentType({super.key});

  @override
  State<DocumentType> createState() => _DocumentTypeState();
}

class _DocumentTypeState extends State<DocumentType> {
  List<String> doctypes = [
    'Aadhar card',
    'Voter ID',
    'Driving License',
    'PAN Card',
    'Passport',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.chevron_left, color: Colors.white, size: 40.0),
        ),
        title: const Text(
          'Document Type',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Nunito Sans',
          ),
        ),
        backgroundColor: AppColors.primary,
      ),
      body: SizedBox(
        height: 450,
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  String doctype = doctypes[index];
                  return ListTile(
                    // trailing: Icon(
                    //   Icons.check_circle,
                    //   color: AppColors.neonblue,
                    // ),
                    // trailing: doctype == 'Aadhar card'
                    //     ? const Icon(
                    //         Icons.check_circle,
                    //         color: AppColors.neonblue,
                    //       )
                    //     : null,
                    onTap: () {
                      Navigator.pop(context, doctype);
                    },
                    title: Text(doctype),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(
                      height: 10.0,
                      thickness: 1.0,
                      color: Color(0xFFDEDEDE),
                    ),
                itemCount: doctypes.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
