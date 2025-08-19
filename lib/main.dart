import 'package:flutter/material.dart';
import 'package:helper_module/screens/HelperList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.indigo,
        fontFamily: 'Nunito Sans',

        appBarTheme: AppBarTheme(
          backgroundColor: Colors.indigo[900],
          titleTextStyle: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontFamily: 'Nunito Sans',
            color: Colors.white,
          ),
          iconTheme: const IconThemeData(color: Colors.white, size: 40.0),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo[900],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Nunito Sans',
              color: Colors.white,
            ),
          ),
        ),
      ),

      home: const HelperList(), 
    );
  }
}
