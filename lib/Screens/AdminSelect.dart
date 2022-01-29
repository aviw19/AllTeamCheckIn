import 'package:flutter/material.dart';

class AdminSelect extends StatefulWidget {
  const AdminSelect({ Key? key }) : super(key: key);

  @override
  _AdminSelectState createState() => _AdminSelectState();
}

class _AdminSelectState extends State<AdminSelect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(crossAxisAlignment: CrossAxisAlignment.center,
        children: [Row( children: [
            const ElevatedButton(
        child: Text("LogIn"),
     
        onPressed: null,
        ),


      new ElevatedButton(
        child:  const Text("SignUp"),
        onPressed: null,
        ),

        ],),],)));
  }
}