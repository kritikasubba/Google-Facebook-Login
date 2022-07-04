import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInController with ChangeNotifier{

var _googleSignIn = GoogleSignIn();

GoogleSignInAccount? googleSignInAccount;
//function to login
login() async {
  googleSignInAccount = await _googleSignIn.signIn(); //wait for google sign in to take place
  notifyListeners();

}
//function to log out
logOut() async {
  googleSignInAccount = await _googleSignIn.signOut();
  notifyListeners();

}



}