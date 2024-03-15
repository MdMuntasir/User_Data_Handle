import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  String name = "", age = "", height = "", weight = "", email = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
