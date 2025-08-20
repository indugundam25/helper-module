// ignore: file_names
import 'package:flutter/material.dart';
import 'package:helper_module/constants/app_colors.dart';
import 'package:helper_module/screens/EditHelper.dart';
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
                const CircleAvatar(
                  radius: 80.0,
                  backgroundImage: AssetImage('assets/images/profile.avif'),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Name',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                const Text(
                  'Role',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                ),
                const SizedBox(height: 20.0),
                ListTile(
                  leading: const Text(
                    'Employee ID',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                  ),
                  trailing: Text(
                    'view',
                    style: TextStyle(
                        color: AppColors.neonblue,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0),
                  ),
                ),
                const SizedBox(height: 20.0),
                const ListTile(
                  leading: Text(
                    'Employee code',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                  ),
                  trailing: Text(
                    '46542',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                  ),
                ),
                const SizedBox(height: 20.0),
                const ListTile(
                  leading: Text(
                    'Gender',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                  ),
                  trailing: Text(
                    'Male',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                  ),
                ),
                const SizedBox(height: 20.0),
                const ListTile(
                  leading: Text(
                    'Organization',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                  ),
                  trailing: Text(
                    'Spring Helpers',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                  ),
                ),
                const SizedBox(height: 20.0),
                const ListTile(
                  leading: Text(
                    'Language(s)',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                  ),
                  trailing: Text(
                    'English, Hindi',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                  ),
                ),
                const SizedBox(height: 20.0),
                const ListTile(
                  leading: Text(
                    'Phone Number',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                  ),
                  trailing: Text(
                    '9876765456',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                  ),
                ),
                const SizedBox(height: 20.0),
                const ListTile(
                  leading: Text(
                    'Email',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                  ),
                  trailing: Text(
                    'NA',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                  ),
                ),
                const SizedBox(height: 20.0),
                const ListTile(
                  leading: Text(
                    'Vehicle Number',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                  ),
                  trailing: Text(
                    'TS37AV4577',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                  ),
                ),
                const SizedBox(height: 20.0),
                const ListTile(
                  leading: Text(
                    'KYC Document',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                  ),
                  trailing: Text(
                    'view',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
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
