import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.age,
    required this.height,
    required this.weight,
    required this.BMI,
    required this.email
  });

  late String? id;
  late String name;
  late String age;
  late String height;
  late String weight;
  late double BMI;
  late String email;


  UserModel.fromJason(Map<String, dynamic> json){
    name = json["Name"] ?? "";
    age = json["Age"] ?? "";
    height = json["Height"] ?? "";
    weight = json["Weight"] ?? "";
    BMI = json["BMI"] ?? "";
    email = json["Email"] ?? "";
  }

  toMap() {
    return {
      "Name": name,
      "Age": age,
      "Height": height,
      "Weight": weight,
      "BMI" : BMI,
      "Email" : email
    };
  }

}


class userInfo{

  static Map<String,dynamic> info = {};

  Future getInfo() async{
    final user = FirebaseAuth.instance.currentUser!;

      await FirebaseFirestore.instance.collection("Users").doc(user.uid).get().then((user) async{
        if(user.exists){
          userInfo.info = UserModel.fromJason(user.data()!).toMap();
        }
      });
      print(info);
  }

}




