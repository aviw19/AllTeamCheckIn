import 'package:allteamcheckin/DataModels/AllUsers.dart';
import 'package:allteamcheckin/DataModels/CheckInForm.dart';
import 'package:allteamcheckin/Networking/NetworkUtilities.dart';
import 'package:allteamcheckin/Screens/UserView.dart';
import 'package:flutter/material.dart';

class OtherUsers extends StatefulWidget {
  const OtherUsers({ Key? key }) : super(key: key);

  @override
  _OtherUsersState createState() => _OtherUsersState();
}

class _OtherUsersState extends State<OtherUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column( children: [
          Text("View All CheckIns Here"),
          Container(
          height: MediaQuery.of(context).size.height*0.5,
          child: 
          FutureBuilder<List<String>> (
            future: getOtherUsers(),
            builder: (context,snapshot) {
              if(snapshot.hasData){
                List<String>? data=snapshot.data;
                return ListView.builder(
                  itemCount: data?.length,
                  //scrollDirection: ,
                  itemBuilder: (context,index){
                    return Column(children: [
                    SizedBox(height: 20,),
                    GestureDetector(
                    child:Text(data![index],),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => UserView(user: data[index],)));
                    }
                    ),
                    SizedBox(height: 20,)
                    ]);
                  } );
              }
              else {
                return CircularProgressIndicator();
              }
            },
          )
       ),
        ],
        ) ,
      ),
    );
  }
  Future<List<String>> getOtherUsers() async {
     print("YO Yo");
      late AllUsers allUsers;
    List<String> temp=[];
    var response=await NetworkUtilities.getRequest("All Users.json");
    print(response.toString());
    if(response!=null) {
      print("fjfj");
      allUsers=AllUsers.fromJson(response.data);
      temp=allUsers.userList;
      print(temp);

    }
     return temp;
    }
}