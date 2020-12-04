import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Text(
              'Profile',
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
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          Text(
            'Joseph John',
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Bucharest, Romania',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 30),
          ListTile(
            title: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(
                'First Name',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff999999),
                ),
              ),
            ),
            subtitle: Text(
              'John',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            trailing: Text(
              'Edit',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500,
                color: Color(0xff79c2ff),
              ),
            ),
          ),
          ListTile(
            title: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(
                'Last Name',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff999999),
                ),
              ),
            ),
            subtitle: Text(
              'Joseph',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            trailing: Text(
              'Edit',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500,
                color: Color(0xff79c2ff),
              ),
            ),
          ),
          ListTile(
            title: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(
                'Email',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff999999),
                ),
              ),
            ),
            subtitle: Text(
              'john.joseph@gmail.com',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            trailing: Text(
              'Edit',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500,
                color: Color(0xff79c2ff),
              ),
            ),
          ),
          ListTile(
            title: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(
                'Phone number',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff999999),
                ),
              ),
            ),
            subtitle: Text(
              '+407539084625',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            trailing: Text(
              'Edit',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500,
                color: Color(0xff79c2ff),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
