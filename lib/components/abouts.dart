import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.6,
              decoration: BoxDecoration(
                color: Color(0xff005b8f),
                image: DecorationImage(
                  image: AssetImage("assets/images/table_ban.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                transform: Matrix4.translationValues(170.0, -100.0, 0.0),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.close, size: 40, color: Colors.white),
                ),
              ),
            ),
            Container(
              transform: Matrix4.translationValues(100.0, -180.0, 0.0),
              child: Image.asset(
                'assets/images/about_logo.png',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Container(
                transform: Matrix4.translationValues(0.0, -180.0, 0.0),
                child: Text(
                  ' Us',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Color(0xff005b8f),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Container(
                transform: Matrix4.translationValues(0.0, -165.0, 0.0),
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
