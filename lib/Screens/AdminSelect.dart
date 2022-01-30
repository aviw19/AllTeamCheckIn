// ignore_for_file: deprecated_member_use

import 'package:allteamcheckin/Screens/HomeScreen.dart';
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
      body: SafeArea(
        child:Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width*0.8,
        child: Column(
      
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
          ElevatedButton(
        child: Text("Proceed as admin"),
     
        onPressed: (){},
        ),
        
        SizedBox(height: 20,),
        
        new ElevatedButton(
        child:  const Text("Go To ChecckIn "),
        onPressed: () {
          
        },
        ),
      ],))));
  }
}