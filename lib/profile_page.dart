import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  String email;
   ProfileScreen({ Key? key,required this.email }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Signed In as',
          style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8,),
          Text(
            widget.email,
            style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
          ),
         const SizedBox(height: 40),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              minimumSize:const Size.fromHeight(50),
            ),
            icon: const Icon(Icons.arrow_back,size:32),
            label:const Text(
              'Log Out',style: TextStyle(fontSize: 24),
            ),
            onPressed: ()=>FirebaseAuth.instance.signOut(),
          )
        ],
      ) ,
    );
  }
}
