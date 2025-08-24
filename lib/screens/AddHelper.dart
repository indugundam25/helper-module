// ignore: file_names
import 'dart:async';
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:helper_module/screens/HelperList.dart';
import 'package:helper_module/screens/KYCDocument.dart';
import 'package:helper_module/screens/ServiceTypes.dart';
import 'package:helper_module/widgets/Vehicles.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:helper_module/constants/app_colors.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AddHelper extends StatefulWidget {
  final String service;
  const AddHelper({super.key, required this.service});

  @override
  // ignore: no_logic_in_create_state
  State<AddHelper> createState() => _AddHelperState();
}

// ignore: constant_identifier_names
enum Genders { Male, Female, Other }

class _AddHelperState extends State<AddHelper> {
  Genders _gender = Genders.Male;
  String selectedService = '';
  String selectedOrg = 'None';
  List<String> selectedLangs = [];
  String vehicleNumber = 'TS 08 AV 1234';
  Vehicle selectedVehicle = Vehicle(
    name: 'Bike',
    icon: Icon(PhosphorIconsRegular.moped, color: iconColor),
  );
  File? imageFile;
  final ImagePicker picker = ImagePicker();
  Map<String, String>? kycDoc;

  final TextEditingController _vehicleController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final helperkey = GlobalKey<FormState>();
    final vehicleKey = GlobalKey<FormState>();
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
          centerTitle: false,
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
                            child: imageFile == null
                                ? Column(
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
                                  )
                                : ClipOval(
                                    child: Image.file(
                                      imageFile!,
                                      height: 150,
                                      width: 150,
                                      fit: BoxFit.cover,
                                    ),
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
                          padding: const EdgeInsets.fromLTRB(
                            30.0,
                            5.0,
                            0.0,
                            0.0,
                          ),
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
                              onTap: () async {
                                final result = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ServiceTypes(),
                                  ),
                                );

                                if (result != null && result is String) {
                                  setState(() {
                                    selectedService = result;
                                  });
                                }
                              },
                              // validator: (value) {
                              //   if (value == null || value.isEmpty) {
                              //     return 'Enter service';
                              //   } else {
                              //     return null;
                              //   }
                              // },
                              decoration: InputDecoration(
                                hintText: (selectedService != '')
                                    ? selectedService
                                    : 'Select type of service',
                                suffixIcon: Icon(Icons.keyboard_arrow_down),
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            30.0,
                            5.0,
                            0.0,
                            0.0,
                          ),
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
                            //     return 'select organization';
                            //   } else {
                            //     return null;
                            //   }
                            // },
                            readOnly: true,
                            onTap: () {
                              showModalBottomSheet<String>(
                                context: context,
                                builder: (BuildContext context) {
                                  String tempOrg = selectedOrg;
                                  return StatefulBuilder(
                                    builder: (context, setModalState) {
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
                                                itemBuilder: (context, index) {
                                                  final org = orgs[index];
                                                  return ListTile(
                                                    title: Text(org),
                                                    trailing: tempOrg == org
                                                        ? const Icon(
                                                            Icons.check_circle,
                                                            color: AppColors
                                                                .neonblue,
                                                          )
                                                        : null,
                                                    onTap: () {
                                                      setModalState(() {
                                                        tempOrg = org;
                                                      });
                                                    },
                                                  );
                                                },
                                                separatorBuilder:
                                                    (context, index) =>
                                                        const Divider(
                                                          height: 10.0,
                                                          thickness: 1.0,
                                                          color: Color(
                                                            0xFFDEDEDE,
                                                          ),
                                                        ),
                                                itemCount: orgs.length,
                                              ),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context, tempOrg);
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                      130,
                                                      0,
                                                      130,
                                                      0,
                                                    ),
                                                child: Text(
                                                  'Done',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              ).then((selected) {
                                if (selected != null) {
                                  setState(() {
                                    selectedOrg = selected;
                                  });
                                }
                              });
                            },
                            decoration: InputDecoration(
                              hintText: selectedOrg.isNotEmpty
                                  ? selectedOrg
                                  : 'Organization',
                              suffixIcon: const Icon(Icons.keyboard_arrow_down),
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            30.0,
                            5.0,
                            0.0,
                            0.0,
                          ),
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
                            controller: nameController,
                            autovalidateMode: AutovalidateMode.onUnfocus,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp('[a-z]'),
                              ),
                            ],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Name is required';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'Name',
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            30.0,
                            0.0,
                            0.0,
                            0.0,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Gender'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            20.0,
                            5.0,
                            5.0,
                            5.0,
                          ),
                          child: Row(
                            children: [
                              Radio<Genders>(
                                value: Genders.Male,
                                groupValue: _gender,
                                onChanged: (Genders? value) {
                                  setState(() {
                                    _gender = value!;
                                  });
                                },
                              ),
                              Text("Male"),
                              Radio<Genders>(
                                value: Genders.Female,
                                groupValue: _gender,
                                onChanged: (Genders? value) {
                                  setState(() {
                                    _gender = value!;
                                  });
                                },
                              ),
                              Text("Female"),
                              Radio<Genders>(
                                value: Genders.Other,
                                groupValue: _gender,
                                onChanged: (Genders? value) {
                                  setState(() {
                                    _gender = value!;
                                  });
                                },
                              ),
                              Text("Other"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            30.0,
                            5.0,
                            0.0,
                            0.0,
                          ),
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
                            readOnly: true,
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  List<String> tempLangs = List.from(
                                    selectedLangs,
                                  );

                                  return StatefulBuilder(
                                    builder: (context, setModalState) {
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
                                                itemCount: languages.length,
                                                separatorBuilder:
                                                    (context, index) =>
                                                        const Divider(
                                                          height: 10.0,
                                                          thickness: 1.0,
                                                          color: Color(
                                                            0xFFDEDEDE,
                                                          ),
                                                        ),
                                                itemBuilder: (context, index) {
                                                  final lang = languages[index];
                                                  final isSelected = tempLangs
                                                      .contains(lang);

                                                  return ListTile(
                                                    title: Text(lang),
                                                    trailing: isSelected
                                                        ? const Icon(
                                                            Icons.check_circle,
                                                            color: AppColors
                                                                .neonblue,
                                                          )
                                                        : null,
                                                    onTap: () {
                                                      setModalState(() {
                                                        if (isSelected) {
                                                          tempLangs.remove(
                                                            lang,
                                                          );
                                                        } else {
                                                          if (tempLangs.length <
                                                              3) {
                                                            tempLangs.add(lang);
                                                          }
                                                        }
                                                      });
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(
                                                20.0,
                                              ),
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(
                                                    context,
                                                    tempLangs,
                                                  );
                                                },
                                                child: const Padding(
                                                  padding: EdgeInsets.fromLTRB(
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
                                  );
                                },
                              ).then((selected) {
                                if (selected != null) {
                                  setState(() {
                                    selectedLangs = List<String>.from(
                                      selected,
                                    ); //selected contains templangs
                                  });
                                }
                              });
                            },
                            decoration: InputDecoration(
                              hintText: selectedLangs.isNotEmpty
                                  ? selectedLangs.join(", ")
                                  : 'Select languages',
                              suffixIcon: const Icon(Icons.keyboard_arrow_down),
                              border: const OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            30.0,
                            5.0,
                            0.0,
                            0.0,
                          ),
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
                            controller: phoneController,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),
                            ],
                            autovalidateMode: AutovalidateMode.onUnfocus,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter Phone number';
                              } else if (value.length < 10) {
                                return 'Phone number must contain 10 digits';
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              prefixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(width: 8),
                                  Icon(PhosphorIcons.caretDown()),
                                  const SizedBox(width: 4),
                                  const Text('+91'),
                                  const SizedBox(width: 8),
                                ],
                              ),
                              prefixIconConstraints: const BoxConstraints(
                                minWidth: 0,
                                minHeight: 0,
                              ),
                              hintText: 'Phone (Mobile)',
                              border: const OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            30.0,
                            5.0,
                            0.0,
                            0.0,
                          ),
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
                              controller: emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Email is required';
                                } else if (!RegExp(
                                  r'^[a-zA-Z0-9._%+-]+@gmail\.com$',
                                ).hasMatch(value)) {
                                  return 'Enter a valid email address';
                                } else {
                                  return null;
                                }
                              },
                              autovalidateMode: AutovalidateMode.onUnfocus,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                hintText: 'Email',
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            30.0,
                            5.0,
                            0.0,
                            0.0,
                          ),
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
                            readOnly: true,
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'Enter Vehicle Number';
                            //   } else {
                            //     return null;
                            //   }
                            // },
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return StatefulBuilder(
                                    builder: (context, setModalState) {
                                      return SizedBox(
                                        height: 500,
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Column(
                                            children: [
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  'Vehicle Details',
                                                  style: TextStyle(
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 20.0),
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                        10.0,
                                                        0.0,
                                                        0.0,
                                                        0.0,
                                                      ),
                                                  child: Text(
                                                    'Vehicle Number',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Form(
                                                key: vehicleKey,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                    8.0,
                                                  ),
                                                  child: TextFormField(
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'Enter Vehicle Number';
                                                      } else {
                                                        return null;
                                                      }
                                                    },
                                                    controller:
                                                        _vehicleController,
                                                    decoration: InputDecoration(
                                                      hintText: vehicleNumber,
                                                      border:
                                                          OutlineInputBorder(),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                  Radius.circular(
                                                                    10.0,
                                                                  ),
                                                                ),
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                children: vehicles.map((
                                                  vehicle,
                                                ) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.fromLTRB(
                                                          12.0,
                                                          8.0,
                                                          12.0,
                                                          8.0,
                                                        ),
                                                    child: Column(
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            setModalState(() {
                                                              selectedVehicle
                                                                      .icon =
                                                                  vehicle.icon;
                                                            });
                                                          },
                                                          child: CircleAvatar(
                                                            radius: 30.0,
                                                            backgroundColor:
                                                                (selectedVehicle
                                                                        .icon ==
                                                                    vehicle
                                                                        .icon)
                                                                ? AppColors
                                                                      .neonblue
                                                                : Colors.white,
                                                            child: vehicle.icon,
                                                          ),
                                                        ),
                                                        Text(vehicle.name),
                                                      ],
                                                    ),
                                                  );
                                                }).toList(),
                                              ),

                                              SizedBox(height: 150.0),
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      AppColors.neonblue,
                                                ),
                                                onPressed: () {
                                                  if (vehicleKey.currentState!
                                                      .validate()) {
                                                    vehicleNumber =
                                                        _vehicleController.text;
                                                  }
                                                  Navigator.pop(context, {
                                                    'vehicle': selectedVehicle,
                                                    'vehicleNumber':
                                                        vehicleNumber,
                                                  });
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                        100.0,
                                                        0.0,
                                                        100.0,
                                                        0.0,
                                                      ),
                                                  child: Text(
                                                    'Save',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ).then((value) {
                                if (value != null) {
                                  setState(() {
                                    selectedVehicle = value['vehicle'];
                                    vehicleNumber = value['vehicleNumber'];
                                  });
                                }
                              });
                            },
                            decoration: InputDecoration(
                              prefixIcon: selectedVehicle.icon,
                              hintText: vehicleNumber,
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: (kycDoc == null)
                              ? ListTile(
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
                                    onPressed: () async {
                                      final result = await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const KYCDocument(),
                                        ),
                                      );
                                      if (result != null &&
                                          result is Map<String, String>) {
                                        setState(() {
                                          kycDoc = result;
                                        });
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: null,
                                      foregroundColor: Colors.black,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
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
                                )
                              : ListTile(
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
                                  title: Text(kycDoc!['type'] ?? 'Unknown'),
                                  subtitle: Text(kycDoc!['size'] ?? ''),
                                  trailing: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        kycDoc = null;
                                      });
                                    },
                                    child: Icon(
                                      PhosphorIcons.trash(
                                        PhosphorIconsStyle.regular,
                                      ),
                                      color: Colors.red,
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
                      //callback
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HelperList()),
                      );
                    });
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
