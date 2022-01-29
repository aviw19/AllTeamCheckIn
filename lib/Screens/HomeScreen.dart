// ignore_for_file: deprecated_member_use

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
      body: SafeArea(
        
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 100,),
          Container(
          height: MediaQuery.of(context).size.height*0.5,
          child: 
          FutureBuilder<List<String>> (
            future: getQuestions(),
            builder: (context,snapshot) {
              if(snapshot.hasData){
                List<String>? data=snapshot.data;
                return ListView.builder(
                  itemCount: data?.length,
                  //scrollDirection: ,
                  itemBuilder: (context,index){
                    return Column(children: [Text(data![index]),
                    TextField(textAlign: TextAlign.center,),
                    ]);
                  } );
              }
              else {
                return CircularProgressIndicator();
              }
            },
          )
      ),
      FlatButton(onPressed: () async { 
        print("yop");
        List<String> yo = ["w","2r","2"];
        Map<String,dynamic> temp=new Map<String,dynamic>();
        temp["questionList"]=yo;
        await completeCheckIn(temp);


       }, child: Text("Submit Response"),),
      ])));
  }
    Future<List<String>> getQuestions() async {
     print("YO Yo");
      late CheckInForm checkInForm;
  
    var response=await NetworkUtilities.getRequest("checkInForm.json");
     print(response.toString());
    if(response!=null) {
      
      checkInForm=CheckInForm.fromJson(response.data);

    }
      return checkInForm.questionList;
    }
  
}
Future<void> completeCheckIn(dynamic body) async {
  var response = await NetworkUtilities.putRequest("User/f20180023.json", body);
}