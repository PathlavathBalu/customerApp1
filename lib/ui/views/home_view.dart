// import 'dart:async';

import 'dart:async';

import 'package:CustomerApp/components/abouts.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Webview extends StatefulWidget {
  Webview({Key key}) : super(key: key);

  @override
  _WebviewState createState() => _WebviewState();
}

class _WebviewState extends State<Webview> {
  final globalKey = GlobalKey<ScaffoldState>();

  // String _title = 'Himdeve Shop';

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      // appBar: AppBar(
      //   title: Text(_title),
      //   actions: <Widget>[
      //     NavigationControls(_controller.future),
      //   ],
      // ),
      body: SafeArea(child: _buildWebView()),
    );
  }

  Widget _buildWebView() {
    return WebView(
   
      initialUrl: 'http://sandbox786.com/web-order/',
         javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _controller.complete(webViewController);
      },
       javascriptChannels: <JavascriptChannel>[
            _toasterJavascriptChannel(context),
                      ].toSet(),
                  navigationDelegate: (NavigationRequest request) {
                    print(request.url);
                    Fluttertoast.showToast(
                        msg:request.url,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                    if (request.url.contains("bookatable.html")) {
                      Navigator.of(context).push(new MaterialPageRoute(
                        builder: (context) {
                          return About();
                        },
                      ));
                      print("Blocking navigation");
                      return NavigationDecision.prevent;
                    } 
                     else {
                      Fluttertoast.showToast(
                          msg: "aaaa",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.blue,
                          fontSize: 16.0);
                    }
                    return NavigationDecision.navigate;
                  },
                );
              }
            
             JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          // ignore: deprecated_member_use
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }

  // NavigationDecision _buildNavigationDecision(NavigationRequest request) {
  //   print(request.url);
  //   if (request.url.contains('about-us')) {
  // Navigator.push(
  //   context,
  //   MaterialPageRoute(builder: (context) => About()),
  // );
  //   }

  //   if (request.url.contains('contactus')) {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => MyHomePage()),
  //     );
  //   }

  //   if (request.url.contains('profile')) {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => Profile()),
  //     );
  //   }

  //   if (request.url.contains('policies')) {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => Policy()),
  //     );
  //     return NavigationDecision.prevent;
  //   }

  //   return NavigationDecision.navigate;
  // }

}

// import 'dart:async';
// import 'package:CustomerApp/components/abouts.dart';
// import 'package:CustomerApp/components/contact.dart';
// import 'package:CustomerApp/components/policies.dart';
// import 'package:CustomerApp/components/profile.dart';
// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class Webview extends StatefulWidget {
//   Webview({Key key}) : super(key: key);

//   @override
//   _WebviewState createState() => _WebviewState();
// }

// class _WebviewState extends State<Webview> {
//   final globalKey = GlobalKey<ScaffoldState>();

//   // String _title = 'Himdeve Shop';

//   final Completer<WebViewController> _controller =
//       Completer<WebViewController>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: globalKey,
//       // appBar: AppBar(
//       //   title: Text(_title),
//       //   actions: <Widget>[
//       //     NavigationControls(_controller.future),
//       //   ],
//       // ),
//       body: SafeArea(child: _buildWebView()),
//     );
//   }

//   Widget _buildWebView() {
//     return WebView(
//       javascriptMode: JavascriptMode.unrestricted,
//       initialUrl: 'https://www.fininfocom.com/',
//       onWebViewCreated: (WebViewController webViewController) {
//         _controller.complete(webViewController);
//       },
//       navigationDelegate: (request) {
//         return _buildNavigationDecision(request);
//       },
//     );
//   }

//   NavigationDecision _buildNavigationDecision(NavigationRequest request) {
//     print(request.url);
//     if (request.url.contains('about-us')) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => About()),
//       );
//     }

//     if (request.url.contains('contactus')) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => MyHomePage()),
//       );
//     }

//     if (request.url.contains('profile')) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => Profile()),
//       );
//     }

//     if (request.url.contains('policies')) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => Policy()),
//       );
//       return NavigationDecision.prevent;
//     }

//     return NavigationDecision.navigate;
//   }
// }





  // onLoadStart: (InAppWebViewController controller, String url) {
  //          if (url.contains("loyalty")) {
  //         Navigator.of(context).push(new MaterialPageRoute(
  //           builder: (context) {
  //             return About();
  //           },
  //         ));
  //     }
  //     },