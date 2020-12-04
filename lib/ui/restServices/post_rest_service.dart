import 'dart:convert';

import 'package:CustomerApp/ui/model/login_model.dart';
import 'package:http/http.dart' as client;
import 'package:shared_preferences/shared_preferences.dart';

class PostRestService {
  static String url = "http://www.moonking.co.uk:8000/";
  static String appKey = "DCALYY";

  static Future<dynamic> generateAuthToken() async {
    var prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> data = {"app_key": appKey};

    final response = await client.post(url + "token/", body: data);
    var decodedResponse = jsonDecode(response.body);
    print(response);

    prefs.setString("token", decodedResponse["token"]);
    print(decodedResponse["token"]);
    return true;
  }

  static Future<dynamic> registerUser(String name, String email, String mobile,
      String password, int storedFlag, int promotionFlag) async {
    var prefs = await SharedPreferences.getInstance();
    Map<String, String> header = {
      "Content-Type": "application/json",
      "Authorization": prefs.getString("token")
    };
    // Map<String, dynamic> info = {
    //   "name": name,
    //   "email": email,
    //   "mobile": mobile,
    //   "password": password,
    //   "stored_flag": storedFlag,
    //   "promotions_flag": promotionFlag
    // };

    Map<String, String> data = {
      "android_app_key": appKey,
      "customer_name": name,
      "email_id": email,
      "password": password,
      "phone_number": mobile

      // "customer_details": json.encode(info)
    };

    final response = await client.post(url + "customer_registration/",
        headers: header, body: json.encode(data));

    print(response.body);
    // Map decodedResponse = json.decode(response.body);
    print(response.body);
    // print(decodedResponse);
    return loginModelFromMap(response.body);
  }

  static Future<dynamic> login(String email, String password) async {
    print(email);
    print(password);
    var prefs = await SharedPreferences.getInstance();

    Map<String, String> header = {
      "Content-Type": "application/json",
      "Authorization": prefs.getString("token")
    };

    Map<String, String> data = {
      "android_app_key": appKey,
      "email_id": email,
      "password": password,
    };

    final response = await client.post(url + "login/",
        headers: header, body: json.encode(data));

    print(response.body);

    return loginModelFromMap(response.body);
  }

  static Future<dynamic> forgotPassword(String email) async {
    print(email);
    // print(password);
    var prefs = await SharedPreferences.getInstance();
    Map<String, String> header = {
      "Content-Type": "application/json",
      "Authorization": prefs.getString("token")
    };
    Map<String, dynamic> data = {
      "android_app_key": appKey,
      "email_id": email,
      // "password": password,
    };

    final response = await client.post(url + "forgot_password/",
        headers: header, body: json.encode(data));

    print(response.body);

    return loginModelFromMap(response.body);
  }
}


// import 'dart:convert';

// import 'package:CustomerApp/ui/model/login_model.dart';
// import 'package:CustomerApp/ui/model/registration_model.dart';
// import 'package:http/http.dart' as client;

// class PostRestService {
//   static String url = "http://www.moonking.co.uk:8000/";

//   static Future<dynamic> registerUser(String name, String email, String mobile,
//       String password, int storedFlag, int promotionFlag) async {
//     Map<String, dynamic> info = {
//       "customer_name": name,
//       "email_id": email,
//       "phone_number": mobile,
//       "password": password,
//       "stored_flag": storedFlag,
//       "promotions_flag": promotionFlag
//     };

//     Map<String, dynamic> data = {
//      "android_app_key": "DCALYY",
//      // "customer_details": json.encode(info)
//     };

//     final response =
//         await client.post(url + "customer_registration", body: json.encode(data));

//     print(response.body);
//     // Map decodedResponse = json.decode(response.body);
//     print(response.body);
//     // print(decodedResponse);
//     return registrationModelFromMap(response.body);
//   }






//   static Future<dynamic> login(String email, String password) async {
//     print(email);
//     print(password);

//     Map<String, dynamic> data = {
//       "auth_code": "HZFAYW",
//       "user_name": email,
//       "password": password,
//     };

//     final response = await client.post(url + "login", body: json.encode(data));

//     print(response.body);
   
//     return loginModelFromMap(response.body);
//   }







//   static Future<dynamic> forgotPassword(String email) async {
//     print(email);
//     // print(password);

//     Map<String, dynamic> data = {
//      "android_app_key": "DCALYY",
//       "email_id": email,
//       // "password": password,
//     };

//     final response = await client.post(url + "forgotPassword", body: json.encode(data));

//     print(response.body);
   
//     return loginModelFromMap(response.body);
//   }
// }
