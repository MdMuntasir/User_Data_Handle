import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:user_handle/DashBoardPage.dart';
import 'package:user_handle/signUpPage.dart';
import 'loginPage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDnUn1JNLucE6_tj2hjttNCesJpdmPuRRs",
          appId: "1:199017317952:android:e0f1bfd24c286c1e1781a5",
          messagingSenderId: "199017317952",
          projectId: "fir-1d624")
    );
  } catch (e) {
    log('Firebase initialization error: $e');
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: user!=null ? const DashBoard() : SignUpPage(),


    );
  }
}

