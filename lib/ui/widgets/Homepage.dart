import 'dart:convert';

import 'package:CustomerApp/ui/model/multi_rest.dart';
import 'package:CustomerApp/ui/model/rest_deatil.dart';
// import 'package:CustomerApp/ui/widgets/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as client;

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
  String authCode;
  String postCode;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
    selectedRadioTile = 0;
    // createAlbum(authCode, postCode);
   // createAlbum(authCode, postCode);
    // users = User.getUsers();
    // getPostById().then((RestDetail restDetail) {
    //   setState(() {
    //     restDetail.restDetails.multipleRestFlag = multipleRestFlag;
    //   });
    // });
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
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffF15A2B),
        onPressed: () async {
          getPostById().then((RestDetail restDetail) {
            if (restDetail.restDetails.multipleRestFlag == 1) {
              _settingModalBottomSheet(context);
              print(restDetail.restDetails.multipleRestFlag);
            } else
              Navigator.of(context).pushNamed("/webview");
          });

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
    http.Response postResponse = await http.get(
        'https://www.deveposhybrid.uk/index.php/customerServices/RestaurantDetails?auth_code=DCALYY');
    if (postResponse.statusCode == 200) {
      //success you can get the value
      print("*****Hello******" + postResponse.body);
      return RestDetail.fromJson(json.decode(postResponse.body));
    } else {
      throw Exception('Cant not load this post');
    }
  }





  void _settingModalBottomSheet(context) {
    List  data;
    print("*******MY*"+ data.toString());
    Multirest _postcode;
    final TextEditingController postController = TextEditingController();
    showModalBottomSheet<void>(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
        ),
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 10),
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
                                      controller: postController,
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
                              _postcode == null
                                  ? Container()
                                  : Text(
                                      "the user ${_postcode.msg}, ${_postcode.status}"),
                              Card(
                                elevation: 5,
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(10.0)),
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 0.0, vertical: 0),
                                    child: FlatButton(
                                      onPressed: () async {
                                        final String postCode =
                                            postController.text;
                                        final Multirest multi =
                                            await createAlbum(
                                                authCode, postCode);
                                        setState(() {
                                          _postcode = multi;
                                        });
                                      },
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
                        ListView.builder(
                           // scrollDirection: Axis.horizontal,
                               shrinkWrap: true,
                           itemCount: data == null ? 0 : data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Expanded(
                                child: new Card(
                                  child: RadioListTile(
                                    value: 0,
                                    groupValue: selectedRadioTile,
                                    title: Text(
                                      data[index]["branchName"],
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
                                            text:
                                                 data[index]["isDelivery"],
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff5200C6),
                                            ),
                                          ),
                                          new TextSpan(
                                            text:
                                                 data[index]["isCollection"],
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
                                ),
                              );
                            }),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 30.0,
                            right: 30,
                          ),
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
                        )
                      ]),
                ],
              ),
            ),
          );
        });
  }

  static Future<Multirest> createAlbum(String authCode, String postCode) async {
    print(authCode);
    print(postCode);
    // var prefs = await SharedPreferences.getInstance();

    // Map<String, String> header = {
    //   "Content-Type": "application/json",
    //   "Authorization": prefs.getString("token")
    // };

    Map<String, String> data = {
      "auth_code": 'DCALYY',
      "post_code": 'EH6 6AX',
    };

    final response = await client.post(
        'https://www.eposhybrid.uk/index.php/customerServices/get_restaurant_branches',
        body: json.encode(data));
        print("MYY"+ data.toString());

    print("***Multi***" + response.body);
    

    return multirestFromJson(response.body);
  }

}
