import 'package:flutter/material.dart';
import 'package:lead_generator/screen/home.dart';

void main(){
  runApp(const BlessApp());
}

class BlessApp extends StatelessWidget {
  const BlessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}