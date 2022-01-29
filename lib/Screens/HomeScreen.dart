import 'dart:convert';

import 'package:allteamcheckin/DataModels/CheckInForm.dart';
import 'package:allteamcheckin/Networking/NetworkUtilities.dart';
import 'package:allteamcheckin/providers/FormProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}
bool hasCheckedIn=false;
class _HomeScreenState extends State<HomeScreen> {
  List<String> questions =["dd","f"];


  void initState() {
    super.initState();
  //fetchQuestionList();
  Provider.of<FormProvider>(context, listen: false).getQuestions();
    } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<FormProvider>(builder: (context, controller, child){
            return controller.checkQuestions? Container(
              child: ListView.builder(
                itemCount: controller.getGroupResults.length,
                itemBuilder: (context, index) {
                            return Text(
                               controller.getGroupResults[index],
                            );
                }),
            ):Text("to yo");
          },)
        ])));
  }
}