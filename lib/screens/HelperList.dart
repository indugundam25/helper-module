// ignore: file_names
import 'package:flutter/material.dart';
import 'package:helper_module/screens/AddHelper.dart';
import 'package:helper_module/screens/HelperDetails.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.chevron_left,),
          ),
          title: const Text(
            'Helpers',
          ),
          backgroundColor: Colors.indigo[900],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search for helpers',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final helper = helpers[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HelperDetails(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 0.5,
                            color: Color.fromARGB(255, 222, 222, 222),
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            backgroundImage: AssetImage(
                              'assets/images/profile.avif',
                            ),
                            radius: 30.0,
                          ),
                          const SizedBox(width: 20.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                helper["name"]!,
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                helper["role"]!,
                                style: const TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          CircleAvatar(
                            backgroundColor: const Color.fromARGB(
                              255,
                              195,
                              212,
                              242,
                            ),
                            child: IconButton(
                              onPressed: () {
                                // Call logic here
                              },
                              icon: const Icon(Icons.phone),
                              color: Colors.indigo,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.indigo[900])),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AddHelper()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, size: 30.0, weight: 20.0, color: Colors.white,),
                    SizedBox(width: 10.0),
                    Text('Add helper', style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }
}
