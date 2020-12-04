import 'package:CustomerApp/ui/loginScreen/login.dart';
import 'package:CustomerApp/ui/restServices/post_rest_service.dart';
import 'package:CustomerApp/ui/widgets/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateAccount extends StatefulWidget {
  CreateAccount() : super();
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  String _name;
  String _email;
  String _password;
  String _phoneNumber;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController password = TextEditingController();
  int stVal = 1;
  int proVal = 0;

  bool storedFlag = true;
  bool promotionFlag = false;
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
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            movetoBack();
                          },
                          child: Image.asset(
                            'assets/images/Arrow.png',
                            width: 12,
                            height: 20,
                          ),
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
                    Text(
                      'Create Account',
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
              // SizedBox(height: 10),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextFormField(
                        controller: name,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Name',
                            hintStyle: TextStyle(
                              color: Color(0xff919196),
                              fontSize: 17,
                              fontFamily: 'Sfpro',
                            )),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Name is Required';
                          }

                          return null;
                        },
                        onSaved: (String value) {
                          _name = value;
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                    Divider(
                      color: Colors.grey[700],
                      indent: 10,
                      endIndent: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextFormField(
                        controller: mobile,
                        maxLength: 15,
                        inputFormatters: [
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: ' Mobile Number',
                          hintStyle: TextStyle(
                            color: Color(0xff919196),
                            fontSize: 17,
                            fontFamily: 'Sfpro',
                          ),
                          counterText: "",
                        ),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Phone number is Required';
                          }

                          return null;
                        },
                        onSaved: (String value) {
                          _phoneNumber = value;
                        },
                      ),
                    ),
                    Divider(
                      color: Colors.grey[700],
                      indent: 10,
                      endIndent: 10,
                    ),
                    SizedBox(height: 40),
                    ListTile(
                      leading: Switch(
                        value: storedFlag,
                        onChanged: (value) {
                          setState(() {
                            storedFlag = value;
                            value ? stVal = 1 : stVal = 0;
                            print(storedFlag);
                          });
                        },
                        activeTrackColor: Color(0xff5200C6),
                        activeColor: Colors.white,
                      ),
                      title: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "I accept to store my ",
                              style: TextStyle(
                                fontFamily: 'Sfpro',
                                color: Color(0xff919196),
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            WidgetSpan(
                              child: InkWell(
                                // onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => CreateAccount()),
                                // );
                                // },
                                child: Text(
                                  "details",
                                  style: TextStyle(
                                    fontFamily: 'Sfpro',
                                    color: Color(0xff5200C6),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            TextSpan(
                              text: " for providing better services",
                              style: TextStyle(
                                fontFamily: 'Sfpro',
                                color: Color(0xff919196),
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Switch(
                        value: promotionFlag,
                        onChanged: (value) {
                          setState(() {
                            promotionFlag = value;

                            value ? proVal = 1 : proVal = 0;
                            print(promotionFlag);
                          });
                        },
                        activeTrackColor: Color(0xff5200C6),
                        activeColor: Colors.white,
                      ),
                      title: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "I am happy to receive ",
                              style: TextStyle(
                                fontFamily: 'Sfpro',
                                color: Color(0xff919196),
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            WidgetSpan(
                              child: InkWell(
                                // onTap: () {
                                //   Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => CreateAccount()),
                                //   );
                                // },
                                child: Text(
                                  "promotions ",
                                  style: TextStyle(
                                    fontFamily: 'Sfpro',
                                    color: Color(0xff5200C6),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            TextSpan(
                              text: " & ",
                              style: TextStyle(
                                fontFamily: 'Sfpro',
                                color: Color(0xff919196),
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            WidgetSpan(
                              child: InkWell(
                                // onTap: () {
                                //   Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => CreateAccount()),
                                //   );
                                // },
                                child: Text(
                                  "offers",
                                  style: TextStyle(
                                    fontFamily: 'Sfpro',
                                    color: Color(0xff5200C6),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            TextSpan(
                              text: " from you",
                              style: TextStyle(
                                fontFamily: 'Sfpro',
                                color: Color(0xff919196),
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: () {
                          if (!_formKey.currentState.validate()) {
                            return;
                          }

                          _formKey.currentState.save();

                          print(_name);
                          print(_email);
                          print(_phoneNumber);
                          print(_password);

                          PostRestService.registerUser(name.text, email.text,
                                  mobile.text, password.text, stVal, proVal)
                              .then((result) {
                            print(result.toString());

                            if (result.status == 1) {
                              print("navigate to perticular Screen ");

                              //Navigator.of(context).pushNamed("/login");
                            } else
                              errorBottomSheet(result.msg, context);
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 55,
                          decoration: BoxDecoration(
                              color: Color(0xff5200C6),
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Center(
                            child: Text(
                              'Create account',
                              style: TextStyle(
                                fontFamily: 'Sfpro',
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Already have an account? ",
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
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        child: Text(
                          " Sign in",
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
