import 'dart:convert';
import 'package:allteamcheckin/DataModels/User.dart';
import 'package:allteamcheckin/Networking/NetworkUtilities.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<String?> signInwithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      Response response=await NetworkUtilities.getRequest("User.json");
      print(response.toString());
      final UserCredential authResult=await _auth.signInWithCredential(credential);
      final User? user=authResult.user;
      if (authResult.additionalUserInfo != null &&
      authResult.additionalUserInfo!.isNewUser) {
        print("New User");
        UserProfile userObj = UserProfile(email: user!.email.toString(), firebaseAuthToken: user.uid.toString(), hasCheckedIn: false, name: user.displayName.toString(), isAdmin: false, questionList: []);
        print(userObj.toJson().toString());
        int start=user.email.toString().indexOf("@");
        String uniqueId=user.email.toString().substring(0,start);
        String endpoint="User/"+uniqueId+".json";
        
        var response = await NetworkUtilities.putRequest(endpoint.toString(),jsonEncode(userObj));
        print(response.toString());
        
        
      }
      else 
        print("Old User");
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  Future<void> signOutFromGoogle() async{
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}