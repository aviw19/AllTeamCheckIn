// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:allteamcheckin/DataModels/CheckInForm.dart';
import 'package:allteamcheckin/Networking/NetworkUtilities.dart';
import 'package:allteamcheckin/Screens/OtherUser.dart';

import 'package:allteamcheckin/Screens/WelcomeScreen.dart';
import 'package:allteamcheckin/Utils/MasterDetails.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}
bool hasCheckedIn=false;
class _HomeScreenState extends State<HomeScreen> {
 


  void initState() {
    super.initState();
  //fetchQuestionList();
    } 

  @override
  Widget build(BuildContext context) {
    List<String> questions=[];

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
                    
                    ///extFieldControllers.add(new TextEditingController());
                    return Column(children: [Text(data![index]),
                    TextField(textAlign: TextAlign.center, onChanged: (text){

                        questions[index]=text;
                        print(questions[index]);
                    },),
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
        for(int i=0;i<questions.length;i++)
            print(questions.toString()); 

         List<String> ques =["dd","f"]; 
        Map<String,dynamic> temp=new Map<String,dynamic>();
        temp["questionList"]=ques;
        await completeCheckIn(temp);
         Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => OtherUsers()),(Route<dynamic> route) => false,
  );

       }, child: Text("Submit Response"),),
      ])));
  }
    Future<List<String>> getQuestions() async {
     print("YO Yo");
      late CheckInForm checkInForm;
  
    var response=await NetworkUtilities.getRequest("checkInForm.json");
     print(response.toString());
    if(response!=null) {
      print("yo");
      checkInForm=CheckInForm.fromJson(response.data);

    }
    print(checkInForm.questionList);
      return checkInForm.questionList;
      
    }
  
}
Future<void> completeCheckIn(dynamic body) async {
  int start=MasterDetails.userId.indexOf("@");
  String uniqueId=MasterDetails.userId.toString().substring(0,start);
  String endpoint="User/"+uniqueId+".json";
  var response = await NetworkUtilities.putRequest(endpoint, body);
}