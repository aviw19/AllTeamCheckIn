import 'dart:convert';

import 'package:allteamcheckin/DataModels/CheckInForm.dart';
import 'package:allteamcheckin/Networking/NetworkUtilities.dart';
import 'package:flutter/material.dart';

// import 'package:lumos_app/structure/GetIndividualCollection.dart';

class FormProvider extends ChangeNotifier {
  late CheckInForm checkInForm;
  bool checkQuestions = false;
  // List<GetIndividualCollectionResults> individualCollectionList =
  //     new List<GetIndividualCollectionResults>();
  List<String> getGroupResults = [];

  FormProvider() {
    getQuestions();
  }

  //Get my groups
  Future<void> getQuestions() async {
    List<String> questions;
     print("YO Yo");
    Future<void> fetchQuestionList() async {
      print("gl");
    var response=await NetworkUtilities.getRequest("checkInForm.json");
    
    if(response!=null) {
      CheckInForm checkInForm= CheckInForm.fromJson(jsonDecode(response.toString()));
       questions= checkInForm.questionList;
      if(questions.length>0){
        checkQuestions=true;
        print(questions.toString());
        notifyListeners();
      }
      
    }
  
  }
  }
}