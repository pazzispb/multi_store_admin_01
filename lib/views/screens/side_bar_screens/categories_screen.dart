import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  static const String routeName = r"\CategoriesScreen";


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(10),
        child: const Text(
          'Categories',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 36,
          ),
        ),
      ),
    );
  }
}
