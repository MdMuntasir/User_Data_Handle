import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:user_handle/DashBoardPage.dart';
import 'package:user_handle/signUpPage.dart';
import 'Widgets/UIHelper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width,
        h = MediaQuery.of(context).size.height;


    void login() async{
      String email = emailController.text.toString(), pass = passController.text.toString();


      if(email=="" || pass=="")
        {UiHelper.alertbox(context, "Enter required fields");} // If any field is empty user will see this message
      else{
        UserCredential ? usercredential; // Declaring UserCredential Variable
        try{
          usercredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: pass).then(
                  (value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashBoard()))
          );
        }
        on FirebaseAuthException catch(e){
          // It will automatically catch any error and show it to user
          UiHelper.alertbox(context, e.code.toString());
        }
      }
    }


    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.CustomTextField(emailController, "Enter email address", w*.8, Icons.mail, false),
          UiHelper.CustomTextField(passController, "Enter password", w*.8 , Icons.password, true),
          UiHelper.customButton(login, "Login" , 50, 200),
          SizedBox(height: h*.015),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't Have an account?", style : TextStyle(fontSize: 18,)),
              TextButton(
                  onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                  },
                  child: const Text("Sign Up", style: TextStyle(fontSize: 20,color: Colors.blueAccent, fontWeight: FontWeight.w300),) )
            ],
          ),


        ],
      ),
    );
  }
}
