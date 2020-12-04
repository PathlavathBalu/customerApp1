import 'package:flutter/material.dart';

class Policy extends StatefulWidget {
  @override
  _PolicyState createState() => _PolicyState();
}

class _PolicyState extends State<Policy> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
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
              'Policies',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Container(
              width: 70,
            )
          ],
        ),
        // leading: Row(
        //       children: [
        //         InkWell(
        //           onTap: () {
        //       Navigator.pop(context);
        //     },
        //           child: Icon(
        //             Icons.keyboard_arrow_left,
        //             size: 30,
        //             color: Color(0xff79c2ff),
        //           ),
        //         ),
        //         Text(
        //           'Back',
        //           style: TextStyle(
        //             fontSize: 16,
        //             color: Color(0xff79c2ff),
        //             fontWeight: FontWeight.w500,
        //           ),
        //         ),
        //       ],
        //     ),
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: <Widget>[
            Container(
              //constraints: BoxConstraints.expand(height: 50),
              child: TabBar(
                  indicatorColor: Color(0xff005b8f),
                  unselectedLabelColor: Colors.grey,
                  labelColor: Color(0xff005b8f),
                  indicatorWeight: 3,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    Tab(
                      child: Container(
                        alignment: Alignment.center,
                        constraints: BoxConstraints.expand(width: 70),
                        child: Text(
                          "T&C",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        alignment: Alignment.center,
                        constraints: BoxConstraints.expand(width: 70),
                        child: Text(
                          "PRIVACY",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        alignment: Alignment.center,
                        constraints: BoxConstraints.expand(width: 70),
                        child: Text(
                          "COOKIES",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
            Expanded(
              child: Container(
                child: TabBarView(children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Last updated:23 December,2020',
                            style: TextStyle(
                              color: Color(0xff005b8f),
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            '1. General Information',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            '2. General Information',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Last updated:23 December,2020',
                            style: TextStyle(
                              color: Color(0xff005b8f),
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Last updated:23 December,2020',
                            style: TextStyle(
                              color: Color(0xff005b8f),
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
