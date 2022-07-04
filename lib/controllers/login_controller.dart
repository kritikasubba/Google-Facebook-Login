import 'package:flutter/cupertino.dart';
import 'package:google_login/models/user_details.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController with ChangeNotifier {
  final _googleSignIn = GoogleSignIn();

  GoogleSignInAccount? googleSignInAccount;
  UserDetails? userDetails;


  googleLogin() async {
    googleSignInAccount = await _googleSignIn.signIn();
  
  userDetails = UserDetails(email:  googleSignInAccount!.email, photoUrl : googleSignInAccount!.photoUrl.toString(), displayName: googleSignInAccount!.displayName.toString());

  notifyListeners();
  }
  googleLogout() async {
  googleSignInAccount = await _googleSignIn.signOut();
  userDetails = null;
  notifyListeners();
  }
  
}