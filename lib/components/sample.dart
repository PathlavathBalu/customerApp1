import 'package:CustomerApp/ui/views/home_view.dart';
import 'package:flutter/material.dart';

class Sample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(builder: (context) => Webview()),
                );
              },
              child: Icon(
                Icons.arrow_back,
                size: 30,
              ),
            ),
            Container(
              child: Center(
                  child: Text(
                "data",
                style: TextStyle(color: Colors.red),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
