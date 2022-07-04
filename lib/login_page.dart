import 'package:flutter/material.dart';
import 'package:google_login/controllers/login_controller.dart';
import 'package:provider/provider.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //function
loginPageUi() {
  return Consumer<LoginController>(
    builder: (context, model, child) {
    //already loggedin
    if(model.userDetails != null) {
      return Center(
        child: loggedInUi(model),
      );
      

    } 
    else {
      return loginController(context);
    } 
    },
  );


}

loggedInUi(LoginController model) {
  return Column(
   mainAxisAlignment: MainAxisAlignment.center,
   crossAxisAlignment: CrossAxisAlignment.center,
   children: [
    CircleAvatar(
      backgroundImage: Image.network(model.userDetails!.photoUrl).image,
      radius: 50,
    ),
    Text(model.userDetails!.displayName),
    Text(model.userDetails!.displayName),

    //logout
    ActionChip(
      avatar: const Icon(Icons.logout),
      label: const Text('LogOut') , onPressed: (){
        Provider.of<LoginController>(context , listen: false).googleLogout();
      })
   ],
  );


}
//google Login button
loginController(BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
GestureDetector(
  onTap: (){
    Provider.of<LoginController>(context , listen: false).googleLogin();
  },
  child: Image.asset('assets/google.png' , width: 240,)),
const SizedBox(height: 10,),
Image.asset('assets/fb.png' , width: 240,),
      ],
    ),
  );


}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Google Signin'),
      ),
      body: loginPageUi(),
    );
    
  }
}