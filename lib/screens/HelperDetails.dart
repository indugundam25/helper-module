// ignore: file_names
import 'package:flutter/material.dart';
import 'package:helper_module/constants/app_colors.dart';
import 'package:helper_module/screens/EditHelper.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

// ignore: must_be_immutable
class HelperDetails extends StatefulWidget {
  String? name;
  String? role;
  HelperDetails({super.key, required this.name, required this.role});

  @override
  // ignore: no_logic_in_create_state
  State<HelperDetails> createState() =>
      // ignore: no_logic_in_create_state
      _HelperDetailsState(name: name, role: role);
}

class _HelperDetailsState extends State<HelperDetails> {
  String? name;
  String? role;
  _HelperDetailsState({required this.name, required this.role});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage("assets/images/profile.avif"),
                    ),

                    Positioned(
                      bottom: 10,
                      right: 120,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(
                          "assets/images/profile2.webp",
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  name ?? 'No name',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  role ?? 'No role',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                ),
                const SizedBox(height: 20.0),
                ListTile(
                  leading: const Text(
                    'Employee ID',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min, 
                    children: [
                      Icon(
                        PhosphorIcons.eye(PhosphorIconsStyle.regular),
                        color: AppColors.neonblue,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        'view',
                        style: TextStyle(
                          color: AppColors.neonblue,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                const ListTile(
                  leading: Text(
                    'Employee code',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                  trailing: Text(
                    '46542',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                const ListTile(
                  leading: Text(
                    'Gender',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                  trailing: Text(
                    'Male',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                const ListTile(
                  leading: Text(
                    'Organization',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                  trailing: Text(
                    'Spring Helpers',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                const ListTile(
                  leading: Text(
                    'Language(s)',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                  trailing: Text(
                    'English, Hindi',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                const ListTile(
                  leading: Text(
                    'Phone Number',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                  trailing: Text(
                    '9876765456',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                const ListTile(
                  leading: Text(
                    'Email',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                  trailing: Text(
                    'NA',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                const ListTile(
                  leading: Text(
                    'Vehicle Number',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                  trailing: Text(
                    'TS37AV4577',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                ListTile(
                  leading: Text(
                    'KYC Document',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min, 
                    children: [
                      Icon(
                        PhosphorIcons.eye(PhosphorIconsStyle.regular),
                        color: AppColors.neonblue,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        'view',
                        style: TextStyle(
                          color: AppColors.neonblue,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
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
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditHelper()),
                  );
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.edit_outlined, size: 30, color: Colors.black),
                    SizedBox(width: 10),
                    Text(
                      'Edit Details',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
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
    );
  }
}
