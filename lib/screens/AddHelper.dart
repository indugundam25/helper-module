// ignore: file_names
import 'dart:async';
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:helper_module/screens/HelperList.dart';
import 'package:helper_module/screens/KYCDocument.dart';
import 'package:helper_module/screens/ServiceTypes.dart';
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
    String selectedValue = "Male";
    final helperkey = GlobalKey<FormState>();
    File? imageFile;
    final ImagePicker picker = ImagePicker();
    bool selected = false;
    List<String> orgs = [
      'None',
      'Sonic Services',
      'InnCircles',
      'Servico',
      'Dr.House',
    ];
    List<String> languages = [
      'English',
      'Hindi',
      'Kannada',
      'Malayalam',
      'Marathi',
      'Tamil',
      'Telugu',
    ];
    Future<void> pickImage() async {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);

      if (pickedFile != null) {
        setState(() {
          imageFile = File(pickedFile.path);
        });
      }
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HelperList()),
              );
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
          backgroundColor: AppColors.primary,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Center(
                      child: GestureDetector(
                        onTap: pickImage,
                        child: DottedBorder(
                          color: AppColors.neonblue,
                          strokeWidth: 2,
                          dashPattern: const [6, 3],
                          borderType: BorderType.Circle,
                          child: Container(
                            height: 150,
                            width: 150,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.accent,
                            ),
                            child: imageFile != null
                                ? ClipOval(
                                    child: Image.file(
                                      imageFile!,
                                      fit: BoxFit.cover,
                                      height: 150,
                                      width: 150,
                                    ),
                                  )
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.camera_alt_outlined,
                                        size: 40.0,
                                        color: AppColors.neonblue,
                                      ),
                                      SizedBox(height: 8.0),
                                      Text(
                                        'Take Photo',
                                        style: TextStyle(
                                          color: AppColors.neonblue,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Form(
                    key: helperkey,
                    child: Column(
                      children: [
                        SizedBox(height: 20.0),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30.0, 5.0, 0.0, 0.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Type of Service'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 30.0,
                          ),
                          child: GestureDetector(
                            child: TextFormField(
                              readOnly: true,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ServiceTypes(),
                                  ),
                                );
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter service';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'Select type of service',
                                suffixIcon: Icon(Icons.keyboard_arrow_down),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30.0, 5.0, 0.0, 0.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Organization'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 30.0,
                          ),
                          
                          child: TextFormField(
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'Enter name';
                            //   } else {
                            //     return null;
                            //   }
                            // },
                            readOnly: true,
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return SizedBox(
                                    height: 450,
                                    child: Column(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(12.0),
                                          child: Text(
                                            'Select Organization',
                                            style: TextStyle(
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: ListView.separated(
                                            itemBuilder:
                                                (
                                                  BuildContext context,
                                                  int index,
                                                ) {
                                                  final org = orgs[index];
                                                  return ListTile(
                                                    trailing: Icon(Icons.check_circle, color: AppColors.neonblue,),
                                                    onTap: () {
                                                      selected = true;
                                                      Navigator.pop(
                                                        context,
                                                        org,
                                                      );
                                                      
                                                    },
                                                    title: Text(org),
                                                  );
                                                },
                                            separatorBuilder:
                                                (
                                                  BuildContext context,
                                                  int index,
                                                ) => const Divider(
                                                  height: 10.0,
                                                  thickness: 1.0,
                                                  color: Color(0xFFDEDEDE),
                                                ),
                                            itemCount: orgs.length,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                    130,
                                                    5,
                                                    130,
                                                    5,
                                                  ),
                                              child: Text(
                                                'Done',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ).then((selectedOrg) {
                                if (selectedOrg != null) {
                                  setState(() {
                                    // _orgController.text = selectedOrg;
                                  });
                                }
                              });
                            },
                            // controller: _orgController, // controller for text field
                            decoration: const InputDecoration(
                              hintText: 'Organization',
                              suffixIcon: Icon(Icons.keyboard_arrow_down),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30.0, 5.0, 0.0, 0.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Name'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 30.0,
                          ),
                          child: TextFormField(
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'Enter name';
                            //   } else {
                            //     return null;
                            //   }
                            // },
                            decoration: InputDecoration(
                              labelText: 'Name',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Gender'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20.0, 5.0, 5.0, 5.0),
                          child: Row(
                            children: [
                              Radio<String>(
                                value: "Male",
                                groupValue: selectedValue,
                                onChanged: (value) {
                                  setState(() {
                                    selectedValue = value!;
                                  });
                                },
                              ),
                              Text("Male"),
                              Radio<String>(
                                value: "Female",
                                groupValue: selectedValue,
                                onChanged: (value) {
                                  setState(() {
                                    selectedValue = value!;
                                  });
                                },
                              ),
                              Text("Female"),
                              Radio<String>(
                                value: "Other",
                                groupValue: selectedValue,
                                onChanged: (value) {
                                  setState(() {
                                    selectedValue = value!;
                                  });
                                },
                              ),
                              Text("Other"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30.0, 5.0, 0.0, 0.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Languages'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 30.0,
                          ),
                          child: TextFormField(
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'select atleast 1, max 3';
                            //   } else {
                            //     return null;
                            //   }
                            // },
                            readOnly: true,
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return SizedBox(
                                    height: 450,
                                    child: Column(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(12.0),
                                          child: Text(
                                            'Languages',
                                            style: TextStyle(
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: ListView.separated(
                                            itemBuilder:
                                                (
                                                  BuildContext context,
                                                  int index,
                                                ) {
                                                  final language = languages[index];
                                                  return ListTile(
                                                    trailing: Icon(Icons.check_circle, color: AppColors.neonblue,),
                                                    onTap: () {
                                                      selected = true;
                                                      Navigator.pop(
                                                        context,
                                                        language,
                                                      );
                                                      
                                                    },
                                                    title: Text(language),
                                                  );
                                                },
                                            separatorBuilder:
                                                (
                                                  BuildContext context,
                                                  int index,
                                                ) => const Divider(
                                                  height: 10.0,
                                                  thickness: 1.0,
                                                  color: Color(0xFFDEDEDE),
                                                ),
                                            itemCount: orgs.length,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                    130,
                                                    5,
                                                    130,
                                                    5,
                                                  ),
                                              child: Text(
                                                'Done',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ).then((selectedOrg) {
                                if (selectedOrg != null) {
                                  setState(() {
                                    // _orgController.text = selectedOrg;
                                  });
                                }
                              });
                            },
                            decoration: InputDecoration(
                              hintText: 'Languages',
                              suffixIcon: Icon(Icons.keyboard_arrow_down),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30.0, 5.0, 0.0, 0.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Phone Number'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 30.0,
                          ),
                          child: TextFormField(
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'Enter Phone number';
                            //   } else {
                            //     return null;
                            //   }
                            // },
                            decoration: InputDecoration(
                              labelText: 'Phone (Mobile)',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30.0, 5.0, 0.0, 0.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Email'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 30.0,
                          ),
                          child: SizedBox(
                            child: TextFormField(
                              // validator: (value) {
                              //   if (value == null || value.isEmpty) {
                              //     return 'Enter Email';
                              //   } else {
                              //     return null;
                              //   }
                              // },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Email',
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30.0, 5.0, 0.0, 0.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Vehicle Number'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 30.0,
                          ),
                          child: TextFormField(
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'Enter Vehicle Number';
                            //   } else {
                            //     return null;
                            //   }
                            // },
                            decoration: InputDecoration(
                              labelText: 'Vehicle Number',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: Text(
                              'KYC Document',
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Nunito Sans',
                                color: Colors.black,
                              ),
                            ),
                            trailing: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => KYCDocument(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: null,
                                foregroundColor: Colors.black,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.add, size: 20.0),
                                  SizedBox(width: 8.0),
                                  Text(
                                    'Add Document',
                                    style: TextStyle(
                                      fontFamily: 'Nunito Sans',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
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
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 24,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Nunito Sans',
                    color: Colors.white,
                  ),
                ),
                onPressed: () async {
                  if (helperkey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Scaffold(
                          // debugShowCheckedModeBanner: false,
                          body: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  color: AppColors.neonblue,
                                  size: 80.0,
                                ),
                                SizedBox(height: 40.0),
                                Text(
                                  'Helper added!',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                    Timer(Duration(seconds: 2), () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HelperList()),
                      );
                    });

                    // showDialog<String>(
                    //   context: context,
                    //   builder: (BuildContext content) => Dialog(
                    //     child: Padding(
                    //       padding: const EdgeInsets.all(8.0),
                    //       child: Column(
                    //         mainAxisSize: MainAxisSize.min,
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: [
                    //           Text('Contact added successfully'),
                    //           SizedBox(height: 20.0),
                    //           TextButton(
                    //             onPressed: () {
                    //               Navigator.push(
                    //                 context,
                    //                 MaterialPageRoute(
                    //                   builder: (context) => HelperList(),
                    //                 ),
                    //               );
                    //             },
                    //             child: Text('close'),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // );
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.add, size: 30, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      'Add helper',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
