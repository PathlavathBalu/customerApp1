import 'package:CustomerApp/ui/base_widget.dart';
import 'package:CustomerApp/ui/loginScreen/create_account.dart';
import 'package:CustomerApp/ui/loginScreen/forgot_passoword.dart';
import 'package:CustomerApp/ui/restServices/post_rest_service.dart';
import 'package:CustomerApp/ui/widgets/bottom_sheet.dart';
import 'package:flutter/material.dart';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email;
  String _password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final webView = FlutterWebviewPlugin();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  Future getAuthToken;

  @override
  void initState() {
    super.initState();
    getAuthToken = PostRestService.generateAuthToken();
    webView.close();
  }

  @override
  void dispose() {
    webView.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      builder: (context, sizingInformation) {
        return Scaffold(
          backgroundColor: Color(0xfff1f1f1),
          body: Container(
            child: SingleChildScrollView(
              child: SafeArea(
                child: Column(children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 12, bottom: 12.0, left: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            // movetoBack();
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/Arrow.png',
                                width: 12,
                                height: 20,
                              ),
                              SizedBox(width: 3),
                              Text(
                                'Login',
                                style: TextStyle(
                                  fontFamily: 'Sfpro',
                                  color: Color(0xff5200C6),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'Login',
                          style: TextStyle(
                            fontFamily: 'Sfpro',
                            color: Color(0xff000000),
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(width: 70),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey[700],
                  ),
                  SizedBox(height: 10),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: TextFormField(
                            controller: email,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Email',
                                hintStyle: TextStyle(
                                  color: Color(0xff919196),
                                  fontSize: 17,
                                  fontFamily: 'Sfpro',
                                )),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Email is Required';
                              }

                              if (!RegExp(
                                      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                  .hasMatch(value)) {
                                return 'Please enter a valid email Address';
                              }

                              return null;
                            },
                            onSaved: (String value) {
                              _email = value;
                            },
                          ),
                        ),
                        Divider(
                          color: Colors.grey[700],
                          indent: 10,
                          endIndent: 10,
                        ),
                        // SizedBox(height: 10.h),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 200,
                                child: TextFormField(
                                  obscureText: true,
                                  controller: password,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Password',
                                      hintStyle: TextStyle(
                                        color: Color(0xff919196),
                                        fontSize: 17,
                                        fontFamily: 'Sfpro',
                                      )),
                                  keyboardType: TextInputType.visiblePassword,
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return 'Password is Required';
                                    }

                                    return null;
                                  },
                                  onSaved: (String value) {
                                    _password = value;
                                  },
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ForgotPassword()),
                                  );
                                },
                                child: Text(
                                  'Forgot Password',
                                  style: TextStyle(
                                    fontFamily: 'Sfpro',
                                    color: Color(0xff5200C6),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey[700],
                          indent: 10,
                          endIndent: 10,
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 55,
                            decoration: BoxDecoration(
                                color: Color(0xff5200C6),
                                borderRadius: BorderRadius.circular(5.0)),
                            child: FlatButton(
                              onPressed: () {
                                PostRestService.login(email.text, password.text)
                                    .then((result) async {
                                  print(result.toString());

                                  if (!_formKey.currentState.validate()) {
                                    return;
                                  }

                                  _formKey.currentState.save();
                                  print(_email);
                                  print(_password);

                                  if (result.status == 1) {
                                    // var prefs =
                                    //     await SharedPreferences.getInstance();

                                    // prefs.setString(
                                    //     "customerRegId",
                                    //     result.customerDetails[
                                    //         "customer_reg_id"]);

                                    var prefs =
                                        await SharedPreferences.getInstance();

                                    prefs.setString(
                                        "customerRegId", result.toString());

                                    Navigator.of(context).pushNamed("/webview");
                                  } else
                                    errorBottomSheet(result.msg, context);
                                });
                              },
                              child: Text(
                                'Sign in',
                                style: TextStyle(
                                  fontFamily: 'Sfpro',
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(10.0),
                  //   child: Container(
                  //     width: MediaQuery.of(context).size.width,
                  //     height: 55,
                  //     decoration: BoxDecoration(
                  //         color: Color(0xffF15A2B),
                  //         borderRadius: BorderRadius.circular(5.0)),
                  //     child: FlatButton(
                  //       onPressed: _authenticate,
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           Image.asset(
                  //             'assets/images/Vector.png',
                  //             width: 25,
                  //             height: 28,
                  //           ),
                  //           SizedBox(width: 5),
                  //           Text(
                  //             'Sign in with fingerprint',
                  //             style: TextStyle(
                  //               fontFamily: 'Sfpro',
                  //               color: Colors.white,
                  //               fontSize: 14,
                  //               fontWeight: FontWeight.w700,
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(
                            fontFamily: 'Sfpro',
                            color: Color(0xff919196),
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        WidgetSpan(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CreateAccount()),
                              );
                            },
                            child: Text(
                              " Create Account",
                              style: TextStyle(
                                fontFamily: 'Sfpro',
                                color: Color(0xff5200C6),
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ),
        );
      },
    );
  }
}
