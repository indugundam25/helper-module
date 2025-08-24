// ignore: file_names
import 'package:flutter/material.dart';
import 'package:helper_module/screens/AddHelper.dart';
import 'package:helper_module/screens/HelperDetails.dart';
import 'package:helper_module/constants/app_colors.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HelperList extends StatefulWidget {
  const HelperList({super.key});

  @override
  State<HelperList> createState() => _HelperListState();
}

class _HelperListState extends State<HelperList> {
  final List<Map<String, String>> helpers = [
    {"name": "Ramesh", "role": "Cleaner"},
    {"name": "Kesar", "role": "Cook"},
    {"name": "Bhargavi", "role": "Maid"},
    {"name": "Rashi", "role": "Caretaker"},
    {"name": "Ramesh", "role": "Cleaner"},
    {"name": "Kesar", "role": "Cook"},
    {"name": "Bhargavi", "role": "Maid"},
    {"name": "Rashi", "role": "Caretaker"},
  ];

  List<Map<String, String>> filteredHelpers = [];

  @override
  void initState() {
    super.initState();
    filteredHelpers = helpers;
  }

  void _filterHelpers(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredHelpers = helpers;
      } else {
        filteredHelpers = helpers.where((helper) {
          final name = helper["name"]!.toLowerCase();
          final role = helper["role"]!.toLowerCase();
          final search = query.toLowerCase();
          return name.contains(search) || role.contains(search);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.chevron_left),
        ),
        title: const Text("Helpers"),
        backgroundColor: AppColors.primary,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            child: TextField(
              onChanged: _filterHelpers,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search by name or role',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.separated(
                itemCount: filteredHelpers.length,
                separatorBuilder: (context, index) => const Divider(
                  height: 10.0,
                  thickness: 1.0,
                  color: Color(0xFFDEDEDE),
                ),
                itemBuilder: (context, index) {
                  final helper = filteredHelpers[index];
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HelperDetails(
                            name: helper["name"],
                            role: helper["role"],
                          ),
                        ),
                      );
                    },
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile.avif'),
                      radius: 30,
                    ),
                    title: Text(
                      helper["name"]!,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      helper["role"]!,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    trailing: CircleAvatar(
                      backgroundColor: AppColors.accent,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          PhosphorIcons.phone(PhosphorIconsStyle.fill),
                        ),
                        color: AppColors.neonblue,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(18.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddHelper(service: ''),
                  ),
                );
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
    );
  }
}
