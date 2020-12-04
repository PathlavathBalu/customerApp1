// import 'package:CustomerApp/ui/loginScreen/login.dart';
import 'package:CustomerApp/ui/widgets/Homepage.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  Splash({
    Key key,
  }) : super(key: key);
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  var customerRegId;
  startTime() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      customerRegId = prefs.getString("customerRegId");
    });

    var _duration = new Duration(seconds: 4);

    return Timer(_duration, navigationPage);
  }

  // getData() async {
  //   var prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     customerRegId = prefs.getString("customerRegId");
  //   });
  // }

  @override
  void initState() {
    super.initState();
    // getData();
    startTime();
  }

//navigate to the home page
  // void navigateToHomePage() {
  //   Navigator.of(context).pushNamed("/webview");
  // }

  void navigationPage() {
    customerRegId == null
        ? Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => Unsplash()))
        : Navigator.of(context).pushNamedAndRemoveUntil("/webview", (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Container(
        child: Image.asset(
          'assets/images/splash.png',
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
      ),
    );
  }
}
