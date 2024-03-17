
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_handle/UserInformation.dart';
import 'package:user_handle/Widgets/UIHelper.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  String name = "Muntasir",
      age = "20",
      height = "184.5cm",
      weight = "67kg",
      email = "",
      picture = "",
      description = "";
  List info = ["Test1", "Test2"];
  List<Text> userinfo = [];
  bool isEdit = false;
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width,
        h = MediaQuery.of(context).size.height;

    TextEditingController nameController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    TextEditingController heightController = TextEditingController();
    TextEditingController weightController = TextEditingController();





    info.forEach((element) {
      if (userinfo.length < info.length) {
        userinfo.add(Text(
          element,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ));
      }
    });

    Column UserInfo = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: w * .3,
          width: w * .3,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  blurRadius: 3,
                )
              ],
              color: Colors.white),
        ),
        SizedBox(
          height: h * .001,
        ),
        UiHelper.DashboardText(
            context, nameController, "Name", "Muntasir", isEdit)
      ],
    );

    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
          child: Center(
            child: Container(
                height: h * .5,
                width: w * .95,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(blurRadius: 15, spreadRadius: 0)]),
                child: UserInfo),
          ),
        ),
        SizedBox(height: 20),
      ],
    ));
  }
}
