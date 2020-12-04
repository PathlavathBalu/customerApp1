// import 'package:CustomerApp/ui/Intro/intro_page.dart';
import 'package:CustomerApp/ui/splashScreen.dart';
import 'package:CustomerApp/ui/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavigatorPage extends StatefulWidget {
  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  var customerRegId;
  @override
  void initState() {

    getData();

    super.initState();
  }

  getData() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      customerRegId = prefs.getString("customerRegId");
    });
  }

  @override
  Widget build(BuildContext context) {
    return customerRegId == null ? Splash() : Webview();
  }
}
