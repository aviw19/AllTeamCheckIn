class UserProfile {
  final String email;
  String name, firebaseAuthToken;
  bool hasCheckedIn, isAdmin;
  UserProfile({required this.email, required this.name, required this.firebaseAuthToken, required this.hasCheckedIn, required this.isAdmin}) {
    // TODO: implement 
    //throw UnimplementedError();
  }
  

  UserProfile.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        isAdmin = json['isAdmin'] == 'true' ? true : false,
        hasCheckedIn = json['hasCheckedIn'] == 'true' ? true : false,
        firebaseAuthToken = json['token'];

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "isAdmin": isAdmin,
        "firebaseAuthToken":firebaseAuthToken,
        "hasCheckedIn": hasCheckedIn,
      };
}