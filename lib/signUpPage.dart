
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


  @override
  Widget build(BuildContext context) {


     void signup() async {
       String email= emailController.text.toString(), pass = passController.text.toString();

      if(email=="" || pass =="")
      {
        UiHelper.alertbox((context), "Enter required fields"); // If any field is empty user will see this message
      }
      else{
        UserCredential ? usercredential; // Declaring UserCredential Variable
        try {
          usercredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: pass).then(
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
          UiHelper.CustomTextField(emailController, "Enter email address", Icons.mail, false),
          UiHelper.CustomTextField(passController, "Enter password", Icons.password, true),
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
