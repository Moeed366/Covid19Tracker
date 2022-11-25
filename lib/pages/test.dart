//https://www.youtube.com/watch?v=0YTSqREl80s
import 'dart:convert';

import 'package:covid19/pages/registration_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:io';

import 'package:tip_dialog/tip_dialog.dart';


class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

  String? email,pwd;  //address
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  var _message;
  late SnackBar sb;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container( decoration:BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/appimages/background.png'),fit: BoxFit.cover)),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              //color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 70,),
                  Text(
                      'LOGIN',
                      style: new TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()..shader = LinearGradient(
                            colors: <Color>[
                              Colors.black,
                              Colors.deepPurpleAccent,
                              Colors.red
                              //add more color here.
                            ],
                          ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 100.0))
                      )
                  ),



                  SizedBox(
                    height: 65,
                  ),


                  Padding(
                    padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                    child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration:buildInputDecoration(Icons.email,"Email","Email"),
                        validator: (String? value){
                          if(value!.isEmpty)
                          {
                            return 'Please  Enter email';
                          }
                          if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                            return 'Please a valid Email';
                          }
                          return null;
                        },
                        onChanged: (_val) {
                          email = _val;}
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                    child: TextFormField(

                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration:buildInputDecoration(Icons.lock,"Password","Password"),
                        validator: (String? value){
                          if(value!.isEmpty)
                          {
                            return 'Please a Enter Password';
                          }
                          return null;
                        },
                        onChanged: (_val) {
                          pwd = _val;}

                    ),
                  ),

                  SizedBox(height: 50,),

                  SizedBox(
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0), side: BorderSide(color: Colors.blue,width: 2)),
                          padding: const EdgeInsets.all(12.0),
                          primary: Colors.indigoAccent,
                          textStyle: TextStyle(color: Colors.white,)
                      ),
                      onPressed: () async {

                        if(_formkey.currentState!.validate())
                        {_uploadFile();
                        TipDialogHelper.loading("Loading");
                        await new Future.delayed(new Duration(seconds: 20));
                        TipDialogHelper.dismiss();
                        /*sb = SnackBar(content: Text('Check Internet connection'));
                        ScaffoldMessenger.of(context).showSnackBar(sb);
                        print('Email or Password Not Match');*/

                        return;
                        }else{
                          sb = SnackBar(content: Text('Fill All Fields'));
                          ScaffoldMessenger.of(context).showSnackBar(sb);
                        }
                      },

                      child: Text("LOGIN"),

                    ),
                  ),
                  SizedBox(height: 70,),
                  Center(
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(' Don''t have any Account?',style: TextStyle(color: Colors.black54,fontSize: 16),),

                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: TextButton(onPressed: (){
                            Navigator.pushNamed(context, 'Register_as');
                          }, child: Text('REGISTER',style: TextStyle(
                              decoration: TextDecoration.underline,color: Colors.teal,fontSize: 18),)),
                        ),

                      ],
                    ),
                  )






                ],
              ),
            ),
          ),
        ),
      ), );
  }
  Future _uploadFile() async {

  }
}
