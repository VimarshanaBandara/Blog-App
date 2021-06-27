import 'package:blog_app/app_screens/authentic_screen.dart';
import 'package:blog_app/app_screens/upload_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Blog App'),
        centerTitle: true,
        backgroundColor: Colors.pink,
        actions: [

          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              child: Icon(Icons.add,color: Colors.white,),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>UploadScreen()));

              },

            ),
          ),



          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              child: Icon(Icons.exit_to_app,color: Colors.white,),
              onTap: (){
                 FirebaseAuth.instance.signOut().whenComplete((){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>AuthenticScreen()));
                 }).catchError((error){
                   Fluttertoast.showToast(
                       msg: 'Please enter your password'
                   );
                 });
              },

            ),
          )
        ],

      ),
    );
  }
}
