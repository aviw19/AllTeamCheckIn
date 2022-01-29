import 'dart:convert';

import 'package:allteamcheckin/DataModels/CheckInForm.dart';
import 'package:allteamcheckin/Networking/NetworkUtilities.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}
bool hasCheckedIn=false;
class _HomeScreenState extends State<HomeScreen> {
  late List<String> questions;
  Future<void> fetchQuestionList() async {
    var response=await NetworkUtilities.getRequest("checkInForm.json");
    
    if(response!=null) {
      CheckInForm checkInForm= CheckInForm.fromJson(jsonDecode(response.toString()));
    
      questions= checkInForm.questionList;
      print(questions.toString());
    }
  }

  void initState() {
    super.initState();
    if(!hasCheckedIn) {
      fetchQuestionList();
    } 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          hasCheckedIn ? Text("You have checked In") : Text("You still have to fill in ",textAlign: TextAlign.center),
        ],
      ),),
    );
  }
}