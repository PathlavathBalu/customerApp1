import 'dart:convert';

import 'package:CustomerApp/components/abouts.dart';
import 'package:CustomerApp/ui/model/contactus_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ContactUs extends StatefulWidget {


  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  GoogleMapController mapController;
   Future<Contact> futureContact;
  static String url = "http://www.moonking.co.uk:8000/";
  //static String android_app_key = "HZFAYW";
  @override
  void initState() {
    super.initState();
    futureContact = getPostById();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
         title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          'assets/images/Arrow.png',
                          width: 12,
                          height: 20,
                        ),
                      ),
                      SizedBox(width: 6),
                      Text(
                        'Back',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff79c2ff),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Contact Us',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => About()),
                      );
                    },
                    child: Text(
                      'About Us',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff005b8f),
                      ),
                    ),
                  ),
                ],
              ),
      ),
      body: SafeArea(
      child: FutureBuilder<Contact>(
        future: futureContact,
        builder: (context, snapshot) {
         if (snapshot.hasData) {
              return Stack(
                children:<Widget> [
                  Text(snapshot.data.data.restaurantDetails[0].restaurantName),
                  Text(snapshot.data.data.workingHours[0].sunday),
                   GoogleMap(
                         onMapCreated: onMapCreated,
                         
                         initialCameraPosition: CameraPosition(
                            target: LatLng(55.9737703, -3.1686139),
                            zoom: 14
                          ),
                         )
                ],
              );

            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
        } 
        ),
      ),
    );
  }
 Future<Contact> getPostById() async {
   var prefs = await SharedPreferences.getInstance();
    Map<String, String> header = {
      "Content-Type": "application/json",
      "Authorization": prefs.getString("token")
    };
    // http.Response postResponse =
    //     await http.get('http://www.moonking.co.uk:8000/restaurant_details/?android_app_key=HZFAYW');
     final postResponse = await http.get(url + "restaurant_details/?android_app_key=HZFAYW",
        headers: header);
    if (postResponse.statusCode == 200) {
      //success you can get the value
      print('********* hello ******'+postResponse.body);
      return Contact.fromJson(json.decode(postResponse.body));
    } else {
      throw Exception('Cant not load this post');
    }
  }
  // _save(String token) {
  //   final  prefs =  await SharedPreferences.getInstance();
  // }

  void onMapCreated(controller) {
    setState(() {
      mapController = controller;
    });
  }
}


