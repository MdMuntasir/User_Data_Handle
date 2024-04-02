
import 'dart:developer';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_handle/Models/User_model.dart';
import 'package:user_handle/Widgets/UIHelper.dart';
import 'package:user_handle/signUpPage.dart';

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
  // List info = ["Test1", "Test2"];
  Map userinfo = {};
  bool isEdit = false;



  final user = FirebaseAuth.instance.currentUser!;

  Future fireStore() async
  {
    await FirebaseFirestore.instance.collection("Users").doc(user.uid).get().then((user) async{
      if(user.exists){
        info = UserModel.fromJason(user.data()!).toMap();
      }
    });
  }

  void state(){
    initState();
  }



  late Map<String,dynamic> info = {};

  @override
  Widget build(BuildContext context) {
    var document = FirebaseFirestore.instance.collection("Users").doc(user.uid);
   print(document);
    double w = MediaQuery.of(context).size.width,
        h = MediaQuery.of(context).size.height;

    TextEditingController nameController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    TextEditingController heightController = TextEditingController();
    TextEditingController weightController = TextEditingController();



    

    StreamBuilder UserInfo =  StreamBuilder(
      stream: FirebaseFirestore.instance.collection("Users").doc(user.uid).snapshots(),
      builder: (context, AsyncSnapshot snapshot) {

        // info = UserModel.fromJason(snapshot.).toMap();
        if(snapshot.connectionState == ConnectionState.waiting)
          {
            return CircularProgressIndicator(strokeWidth: 1,);
          }

        else {
          dynamic info = snapshot.data;
            return Column(
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
                UiHelper.DashboardText(context, nameController, "Name",
                    info["Name"].toString(), isEdit),
                UiHelper.DashboardText(context, ageController, "Age",
                    info["Age"].toString(), isEdit),
                UiHelper.DashboardText(context, TextEditingController(), "BMI",
                    info["BMI"].toString(), false),
              ],
            );
          }
        }
    );

    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: UserInfo,
                  )
              ),
            ),
          ),
              Center(
                child: FloatingActionButton(
                  onPressed: (){
                    FirebaseAuth.instance.signOut().then((value) =>
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignUpPage()))
                    );
                  },
                  child: Text("Sign Out"),
                ),),
            SizedBox(height: 20),

                ],
              ),
        ));
  }
}
