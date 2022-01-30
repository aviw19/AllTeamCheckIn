import 'dart:convert';

import 'package:allteamcheckin/DataModels/CheckInForm.dart';
import 'package:allteamcheckin/Networking/NetworkUtilities.dart';
import 'package:flutter/material.dart';

class AddQuestions extends StatefulWidget {
  const AddQuestions({ Key? key }) : super(key: key);

  @override
  _AddQuestionsState createState() => _AddQuestionsState();
}
bool isLive=false;

class _AddQuestionsState extends State<AddQuestions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height:MediaQuery.of(context).size.height*0.1),
              const Text("Check In Form is Live",style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(
              height:MediaQuery.of(context).size.height*0.1),
            isLive ? Expanded(
                 child:     FutureBuilder<List<String>> (
            future: getQuestions(),
            builder: (context,snapshot) {
              if(snapshot.hasData){
                List<String>? data=snapshot.data;
                return ListView.builder(
                  itemCount: data?.length,
                  //scrollDirection: ,
                  itemBuilder: (context,index){
                    return Column(children: [Text(data![index]),
                    ]);
                  } );
              }
              else {
                return const CircularProgressIndicator();
              }
            },
          )):Column(
            children: [
              Text("Add New Question"),
              TextField(),
              SizedBox(
              height:MediaQuery.of(context).size.height*0.05),
              ElevatedButton(onPressed: () async {

                List<String> currentQuestions=await getQuestions();
                currentQuestions.add("New Question");
                Map<String,dynamic> body=new Map<String,dynamic>();
                body["questionList"]=currentQuestions;
                body["isLive"]=false;
                await addQuestions(jsonEncode(body));
              }, child: Text("Add quetion")),
               SizedBox(
              height:MediaQuery.of(context).size.height*0.05),
              ElevatedButton(onPressed: (){
                
              }, child: Text("Submit Form"))
            ],
          )
          ],
        ),
      ),
      
    );
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
 Future<void> addQuestions(dynamic body) async {
  var response=await NetworkUtilities.putRequest("checkInForm.json", body);
}
