import 'package:CustomerApp/ui/loginScreen/create_account.dart';
import 'package:CustomerApp/ui/restServices/post_rest_service.dart';
import 'package:CustomerApp/ui/widgets/bottom_sheet.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String _email;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff1f1f1),
      body: Container(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0, left: 8, top: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                       onTap: () {
                            movetoBack();
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
                      'Password Reset',
                      style: TextStyle(
                        fontFamily: 'Sfpro',
                        color: Color(0xff000000),
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(width: 60),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey[700],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Forgot Password?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Sfpro',
                    color: Color(0xff000000),
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Text(
                'Mel ea numqumem efficiendi appellantur, euvix reque inermis propriae',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Sfpro',
                  color: Color(0xff919196),
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Padding(
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
              ),
              Divider(
                color: Colors.grey[700],
                indent: 10,
                endIndent: 10,
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }

                    _formKey.currentState.save();
                    print(_email);

                    PostRestService.forgotPassword(email.text).then((result) {
                      print(result.toString());

                      if (result.status == 1) {
                        print("please make navigations here");

                        // Navigator.of(context).pushNamed("/webview");

                      } else
                        errorBottomSheet(result.msg, context);
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 55,
                    decoration: BoxDecoration(
                        color: Color(0xff5200C6),
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Center(
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          fontFamily: 'Sfpro',
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
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
  }

  void movetoBack() {
    Navigator.pop(context);
  }
}
