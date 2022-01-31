import 'package:allteamcheckin/DataModels/User.dart';

class AllUsers {
  List<String> userList=[];
	

	AllUsers.fromJson(Map<String, dynamic> json) {
    userList = json['UserList'].cast<String>();
  
	}

	// Map<String, dynamic> toJson() {
	// 	final Map<String, dynamic> data = new Map<String, dynamic>();
	// 	if (this.user != null) {
  //     data['User'] = this.user!.toJson();
  //   }
	// 	return data;
	// }
}