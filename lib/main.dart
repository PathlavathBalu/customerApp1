import 'package:CustomerApp/components/contact.dart';
import 'package:CustomerApp/ui/loginScreen/create_account.dart';
import 'package:CustomerApp/ui/loginScreen/forgot_passoword.dart';
import 'package:CustomerApp/ui/model/message.dart';
import 'package:CustomerApp/ui/navigator.dart';
import 'package:CustomerApp/ui/splashScreen.dart';
import 'package:CustomerApp/ui/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:CustomerApp/ui/loginScreen/login.dart';
//import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final String appTitle = 'Firebase messaging';

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  final List<Message> messages = [];
  @override
  void initState() {
    super.initState();
    _firebaseMessaging.getToken().then((String token) {
      assert(token != null);
      print(token);
    });

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        final notification = message['notification'];
        setState(() {
          messages.add(Message(
              title: notification['title'], body: notification['body']));
        });
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");

        final notification = message['data'];
        setState(() {
          messages.add(Message(
            title: '${notification['title']}',
            body: '${notification['body']}',
          ));
        });
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
         final notification = message['data'];
       setState(() {
          messages.add(Message(
              title: notification['title'], body: notification['body']));
        });
      },
    );

    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Customer App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // home:IntroPage(),
        home: NavigatorPage(),
        routes: <String, WidgetBuilder>{
          '/splash': (BuildContext context) => new Splash(),
          '/login': (BuildContext context) => Login(),
          '/createAccount': (BuildContext context) => CreateAccount(),
          '/profile': (BuildContext context) => ForgotPassword(),
           '/contactus': (BuildContext context) => ContactUs(),
          '/webview': (BuildContext context) => Webview(),

          // "/webview": (_) => WebviewScaffold(
          //       url: url,
          //       withJavascript: true,
          //       withLocalStorage: true,
          //       withZoom: true,
          //     )

        });
  }
}

