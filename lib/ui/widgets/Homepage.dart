import 'dart:convert';

import 'package:CustomerApp/ui/model/rest_deatil.dart';
// import 'package:CustomerApp/ui/widgets/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Unsplash extends StatefulWidget {
  @override
  _UnsplashState createState() => _UnsplashState();
}

class _UnsplashState extends State<Unsplash> {
  //  Future<RestDetail> futureRestDetail;
  // List<User> users;
  // User selectedUser;
  // Declare this variable
  int selectedRadio;
  int selectedRadioTile;
  int multipleRestFlag;
 

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
    selectedRadioTile = 0;
    // users = User.getUsers();
  getPostById().then((RestDetail restDetail){

    setState(() {
      restDetail.restDetails.multipleRestFlag = multipleRestFlag;
    });


     }

  );
    //  multipleRestFlag = 1;

  }

// Changes the selected value on 'onChanged' click on each radio button
  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  // setSelectedUser(User user) {
  //   setState(() {
  //     selectedUser = user;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
           image: AssetImage("assets/images/home4.jpeg"),
           // image: NetworkImage("https://i.pinimg.com/originals/c9/93/0c/c9930c5004d401be4f30a087c48a0c1e.jpg"),
            fit: BoxFit.cover,
          ),
        ),
  
    //     child:  Column(
    //   children: <Widget>[
    //     Expanded(
    //       child: Center(
    //         child: Text("",
    //            style: TextStyle(color: Colors.white,
    //       ),
    //         ),
    //       ),
    //     ),
    //     Align(
    //       alignment: Alignment.bottomRight,
    //       child: Text(
    //         "Which location",
    //          style: TextStyle(
    //            color: Colors.white,
    //             fontSize: 18,
    //            fontWeight: FontWeight.w600
    //       ),
    //       ),
    //     ),
    //     SizedBox(height: 5,),
    //      Align(
    //       alignment: Alignment.bottomRight,
    //       child: Text(
    //         "will you choose",
    //          style: TextStyle(
    //            color: Colors.white,
    //            fontSize: 18,
    //            fontWeight: FontWeight.w600
    //       ),
    //       ),
    //     ),
    //     SizedBox(height: 5,),
    //      Align(
    //       alignment: Alignment.bottomRight,
    //       child: Text(
    //         "today",
    //          style: TextStyle(
    //            color: Colors.white,
    //             fontSize: 18,
    //            fontWeight: FontWeight.w600
    //       ),
    //       ),
    //     ),
    //     Container(height: 100,),
    //   ],
    // ), /* add child content here */
      
      ),
      
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffF15A2B),
        onPressed: () {
          
          if(multipleRestFlag == 1) {
            _settingModalBottomSheet(context);
            print(multipleRestFlag);
             
          } else {
              Navigator.of(context).pushNamed("/webview");
          }
         // _settingModalBottomSheet(context);
        //  Navigator.of(context).pushNamed("/webview");
        },
    
        child: Icon(
          Icons.keyboard_arrow_right,
          size: 30,
          // color: Color(0xffF15A2B),
        ),
      ),
    );
  }
   Future<RestDetail> getPostById() async {
    http.Response postResponse =
        await http.get('https://www.deveposhybrid.uk/index.php/customerServices/RestaurantDetails?auth_code=DCALYY');
    if (postResponse.statusCode == 200) {
      //success you can get the value
      print("*****Hello******"+postResponse.body);
      return RestDetail.fromJson(json.decode(postResponse.body));
    } else {
      throw Exception('Cant not load this post');
    }
  }

  void _settingModalBottomSheet(context) {
    
    showModalBottomSheet<void>(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0)),
        ),
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:15.0, vertical: 10),
                      child: Text(
                        "Postcode",
                        style: TextStyle(
                          color: Color(0xff3D70B2),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Card(
                            elevation: 5,
                            child: Container(
                              width: 200,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Enter post code',
                                      hintStyle: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      )),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Card(
                            elevation: 5,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0)),
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 0.0, vertical: 0),
                                child: FlatButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Find Location',
                                    style: TextStyle(
                                      color: Color(0xffF15A2B),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    RadioListTile(
                      value: 0,
                      groupValue: selectedRadioTile,
                      title: Text(
                        'U Resto, Scotland',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff1A1824)),
                      ),
                      subtitle: RichText(
                        text: new TextSpan(
                          text: '20 mins Away ',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff1A1824),
                          ),
                          children: <TextSpan>[
                            new TextSpan(
                              text: ' Delivery & Collection Avaliable',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff5200C6),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onChanged: (val) {
                        print("Radio Tile Changed $val");
                        setSelectedRadioTile(val);
                      },
                      activeColor: Colors.red,
                      selected: true,
                    ),
                    RadioListTile(
                      value: 1,
                      groupValue: selectedRadioTile,
                      title: Text(
                        'JKM-U Resto, Edinburgh',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff1A1824)),
                      ),
                      subtitle: RichText(
                        text: new TextSpan(
                          text: '10 mins Away',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff1A1824),
                          ),
                          children: <TextSpan>[
                            new TextSpan(
                              text: ' Only Delivery Avaliable',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff5200C6),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onChanged: (val) {
                        print("Radio Tile Changed $val");
                        setSelectedRadioTile(val);
                      },
                      activeColor: Colors.red,
                      selected: true,
                    ),
                    RadioListTile(
                      value: 2,
                      groupValue: selectedRadioTile,
                      title: Text(
                        'JKM-U Resto, Scotland',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff1A1824)),
                      ),
                      subtitle: RichText(
                        text: new TextSpan(
                          text: '30 mins Away ',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff1A1824),
                          ),
                          children: <TextSpan>[
                            new TextSpan(
                              text: ' Only Collection Avaliable',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff5200C6),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onChanged: (val) {
                        print("Radio Tile Changed $val");
                        setSelectedRadioTile(val);
                      },
                      activeColor: Colors.red,
                      selected: true,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30.0, right: 30,),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        //height: 55,
                        decoration: BoxDecoration(
                            color: Color(0xff5200C6),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: FlatButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed("/webview");
                          },
                          child: Center(
                            child: Text(
                              'Proceed',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height:20),
                  ]),
                ],
              ),
            ),
          );
        });
  
  }
}
