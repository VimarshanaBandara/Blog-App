import 'package:blog_app/app_screens/home_screen.dart';
import 'package:blog_app/widgets/loading_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';




class AuthenticScreen extends StatefulWidget {
  const AuthenticScreen({Key? key}) : super(key: key);

  @override
  _AuthenticScreenState createState() => _AuthenticScreenState();
}

class _AuthenticScreenState extends State<AuthenticScreen> {

  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController = TextEditingController();


  String _buttonText ='Login';
  String _switchText = 'Don\'t have an account? Register';

  bool _loading = false;

  void _validateFields(){
    if(_emailEditingController.text.isEmpty && _passwordEditingController.text.isEmpty){
      {
        Fluttertoast.showToast(
            msg: 'Please enter your email and password'
        );
      }
    }
    else if(_emailEditingController.text.isEmpty)
      {
        Fluttertoast.showToast(
            msg: 'Please enter your email'
        );
      }

    else if(_passwordEditingController.text.isEmpty)
    {
      Fluttertoast.showToast(
          msg: 'Please enter your password'
      );
    }
    else
      {
        setState(() {
          _loading = true;
        });

        if(_buttonText == 'Login')
          _login();
        else
          _register();
      }

  }


  void _login(){
    FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailEditingController.text,
      password: _passwordEditingController.text,
    ).then((UserCredential  userCredential ){
      //MOVE TO THE HOME SCREEN
      setState(() {
        _loading = false;
      });
      Fluttertoast.showToast(
          msg: 'Login Successfully'
      );
      _moveToHomeScreen();
    }).catchError((error){
      //SHOW ERROR MESSAGE
      setState(() {
        _loading = false;
      });
      Fluttertoast.showToast(
          msg: error.toString()
      );
    });


  }

  void _moveToHomeScreen(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
  }


  void _register(){
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailEditingController.text,
        password: _passwordEditingController.text,
    ).then((UserCredential  userCredential ){
      //MOVE TO THE HOME SCREEN

      setState(() {
        _loading = false;
      });

      Fluttertoast.showToast(
          msg: 'Registered Successfully'
      );
      _moveToHomeScreen();
    }).catchError((error){
      //SHOW ERROR MESSAGE

      setState(() {
        _loading = false;
      });


      Fluttertoast.showToast(
          msg: error.toString()
      );
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Blog'),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 30.0,),
                Image.asset('images/i1.png',width: 200.0 ,height: 200.0,fit: BoxFit.cover, ),
                SizedBox(height: 30.0,),
                TextField(
                  controller: _emailEditingController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email'
                  ),
                ),
                SizedBox(height: 10.0,),
                TextField(
                  controller: _passwordEditingController,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Password'
                  ),
                ),
                SizedBox(height: 40.0,),
                   _loading ? circularProgress() : GestureDetector(
                  onTap: _validateFields,
                  child: Container(
                    color: Colors.pink,
                    height: 50.0,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text(_buttonText,style: TextStyle(fontSize: 18.0 , color: Colors.white),),
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                FlatButton(
                  onPressed: (){
                    setState(() {
                      if(_buttonText == 'Login'){
                        _buttonText ='Register';
                        _switchText = 'Already have an account? Login';
                      }
                      else
                        {
                          _buttonText ='Login';
                          _switchText = 'Don\'t have an account? Register';
                        }
                    });
                  },
                  textColor: Colors.pink,
                  child: Text(_switchText , style: TextStyle(fontSize: 18.0),),
                )

              ],
            ),
          )
        ),
      ),
    );
  }
}
