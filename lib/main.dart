import 'package:flutter/material.dart';
import 'package:flutter_login_screen_ui/utils/constants.dart';

import 'home.dart';

void main(){
  runApp(Login());
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.title,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Home(),
    );
  }
}
