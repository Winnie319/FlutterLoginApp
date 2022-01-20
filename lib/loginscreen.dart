import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/profile_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  //login function
  static Future<User?> loginUsingEmailPassword(
    {required String email,
    required String password,
    required BuildContext context}) async{
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email, password: password);
      user = userCredential.user;
    }on FirebaseAuthException catch (e){
      if(e.code == "user-not-found"){
        print("No User found for that email");
      }
    }
    return user;
  } 
  @override
  Widget build(BuildContext context) {
    //the textfield controller
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Padding(
      padding:const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "HELLO THERE",
            style: TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              ),
            ),
            const Text("People are waiting to hear from you",
            style: TextStyle(
              color: Colors.black,
              fontSize: 44,
              fontWeight: FontWeight.bold),
              ),
             const  SizedBox(height: 44,),
               TextField(
                controller: _emailController,
               keyboardType: TextInputType.emailAddress,
               decoration: const InputDecoration(
                 hintText: "User Email",
                 prefixIcon:Icon(Icons.mail, color:Colors.black), 
               ),

              ),
              const SizedBox(height: 26,),

               TextField(
                controller: _passwordController,
                obscureText:true,
               keyboardType: TextInputType.emailAddress,
               decoration: const InputDecoration(
                 hintText: "User Password",
                 prefixIcon:Icon(Icons.lock, color:Colors.black), 
               ),
              ),
              const SizedBox(height: 12,),
              const Text("Don't remember your password",
              style: TextStyle(color: Colors.blue),),
              const SizedBox(height: 88,),

              Container(
                width: double.infinity,
                child:RawMaterialButton(
                  fillColor:Colors.blue,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  onPressed:() async{
                    User? user = await loginUsingEmailPassword(email: _emailController.text, password: _passwordController.text, context: context);
                    print(user);
                    if(user != null){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> ProfileScreen( email: _emailController.text)));
                    }
                  },
                  child:const Text("Login",
                  style:TextStyle(color:Colors.white,
                  fontSize: 18,
                  ),),
              )
              ),

        ],
      ),
    );
  }
}