import 'package:flutter/material.dart';
import 'package:multi_store_admin_01/views/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: false,
      ),
      home: MainScreen(),
    );
  }
}