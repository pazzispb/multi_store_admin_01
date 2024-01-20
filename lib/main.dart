import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:multi_store_admin_01/views/screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: kIsWeb || Platform.isAndroid
          ? (FirebaseOptions(
              apiKey: "AIzaSyA_k4FWf4yRA6BdWJFe1PLHtqFPEZXssCg",
              authDomain: "multi-store-admin-110379-fcf49.firebaseapp.com",
              projectId: "multi-store-admin-110379-fcf49",
              storageBucket: "multi-store-admin-110379-fcf49.appspot.com",
              messagingSenderId: "211728166910",
              appId: "1:211728166910:web:0d4f68639996dca2fedaaf"))
          : null);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: false,
      ),
      home: MainScreen(),
    );
  }
}
