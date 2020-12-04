import 'package:CustomerApp/ui/Intro/intro_data.dart';
import 'package:CustomerApp/ui/splashScreen.dart';
//import 'package:CustomerApp/ui/widgets/Homepage.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  List<SliderModel> mySLides = new List<SliderModel>();
  int slideIndex = 0;
  PageController controller;

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: isCurrentPage ? 7.0 : 7.0,
      width: isCurrentPage ? 20.0 : 15.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.white : Color(0xff768DDD),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    mySLides = getSlides();
    controller = new PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5200C6),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 130,
            width: MediaQuery.of(context).size.width,
            child: PageView(
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  slideIndex = index;
                });
              },
              children: <Widget>[
                SlideTile(
                  imagePath: mySLides[0].getImageAssetPath(),
                  title: mySLides[0].getTitle(),
                  desc: mySLides[0].getDesc(),
                ),
                SlideTile(
                  imagePath: mySLides[1].getImageAssetPath(),
                  title: mySLides[1].getTitle(),
                  desc: mySLides[1].getDesc(),
                ),
                SlideTile(
                  imagePath: mySLides[2].getImageAssetPath(),
                  title: mySLides[2].getTitle(),
                  desc: mySLides[2].getDesc(),
                )
              ],
            ),
          ),
          SizedBox(height: 50),
          slideIndex != 2
              ? Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: [
                              for (int i = 0; i < 3; i++)
                                i == slideIndex
                                    ? _buildPageIndicator(true)
                                    : _buildPageIndicator(false),
                            ],
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            print("this is slideIndex: $slideIndex");
                            controller.animateToPage(slideIndex + 1,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.linear);
                          },
                          child: Image.asset(
                            'assets/images/Button.png',
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: [
                            for (int i = 0; i < 3; i++)
                              i == slideIndex
                                  ? _buildPageIndicator(true)
                                  : _buildPageIndicator(false),
                          ],
                        ),
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>Splash()),
                          );
                        },
                        child: Image.asset(
                          'assets/images/Button.png',
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}

class SlideTile extends StatelessWidget {
  String imagePath, title, desc;

  SlideTile({this.imagePath, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            imagePath,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          // SizedBox(
          //   height: 10,
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 29.0),
            child: Expanded(
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 33),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 29.0,
            ),
            child: Expanded(
              child: Text(desc,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(0xffF9FAFE),
                      fontSize: 16)),
            ),
          )
        ],
      ),
    );
  }
}
