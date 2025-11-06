import 'dart:async';

import 'package:e_commerce/ui/homepage.dart';
import 'package:e_commerce/ui/login%20signup/loginsignup.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () async {
      var pref = await SharedPreferences.getInstance();
      var token = pref.getString("token");
      // print("yee${token}");
      if (token == null) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginSignUp()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ClipOval(
             child: Image.asset(
                    "assets/image/ss.jpg",
                    height: 200,
                    width: 300,
                  ),
          )),
    );
  }
}
