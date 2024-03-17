
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_handle/DashBoardPage.dart';
import 'package:user_handle/loginPage.dart';
import 'package:user_handle/main.dart';
import 'Widgets/UIHelper.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width,
        h = MediaQuery.of(context).size.height;



     void signup() async {
       String email= emailController.text.toString(), pass = passController.text.toString(),
              name = nameController.text.toString(), age = ageController.text.toString(),
              height = heightController.text.toString(), weight = weightController.text.toString();

      if(email=="" || pass =="" || age=="" || name=="" || height=="" || weight=="" )
      {
        UiHelper.alertbox((context), "Enter required fields"); // If any field is empty user will see this message
      }
      else{
        UserCredential ? usercredential; // Declaring UserCredential Variable
        try {
          usercredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: pass);

          await FirebaseFirestore.instance.collection("Users").doc(email).set({
            "Name" : name,
            "Age" : age,
            "Height" : height,
            "Weight" : weight,
            "BMI" : double.parse(weight)/pow((double.parse(height)/100),2)
          }).then(
                  (value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashBoard()))
          );
        }
        on FirebaseAuthException catch(e){
          // It will automatically catch any error and show it to user
          UiHelper.alertbox((context), e.code.toString());
        }
      }
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.CustomTextField(nameController, "Enter your name", w*.8,null, false),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UiHelper.CustomTextField(ageController, "Age years", w*.23, null, false),
              UiHelper.CustomTextField(heightController, "Height cm", w*.23, null, false),
              UiHelper.CustomTextField(weightController, "Weight kg", w*.23, null, false),
            ],),
          UiHelper.CustomTextField(emailController, "Enter email address", w*.8,Icons.mail, false),
          UiHelper.CustomTextField(passController, "Enter password", w*.8,Icons.password, true),
          UiHelper.customButton(signup, "Sign Up" , 50, 200),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Already Have an account?", style : TextStyle(fontSize: 18,)),
              TextButton(
                  onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: const Text("Sign in", style: TextStyle(fontSize: 20,color: Colors.blueAccent, fontWeight: FontWeight.w300),) )
            ],
          )
        ],
      ),
    );;
  }
}
