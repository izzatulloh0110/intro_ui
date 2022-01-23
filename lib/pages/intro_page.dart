import 'package:flutter/material.dart';
import 'package:intro_ui/pages/home_page.dart';
import 'package:intro_ui/pages/strings_page.dart';

class IntroPage extends StatefulWidget {
  static const String id = "intro_page";

  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  PageController _pageController = PageController();
  int currenIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    initialPage:
    0;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        PageView(
          onPageChanged: (int page) {
            setState(() {
              currenIndex = page;
            });
          },
          controller: _pageController,
          children: [
            makePage("assets/images/intro_images.jpeg",
                 Strings.stepOneTitle,
                Strings.stepOneContent),
            makePage("assets/images/intro_images.jpeg", Strings.stepTwoTitle,
                Strings.stepTwoContent),
            Container(
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  makePage("assets/images/intro_images.jpeg",
                      Strings.stepThreeTitle, Strings.stepThreeContent),
                  SizedBox(
                    height: 130,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed(HomePage.id);
                      },
                      child: Container(
                          padding: EdgeInsets.all(20),
                          alignment: Alignment.bottomRight,
                          child: Text(
                            "Skip",
                            style: TextStyle(
                                color: Colors.deepPurple, fontSize: 20),
                          ))),
                ],
              ),
            ),
          ],
        ),
        Container(padding: EdgeInsets.only(bottom: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildIndicator(),
          ),
        )
      ],
    ));
  }

  Widget makePage(image, title, content) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(
                  image,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                title,
                style: TextStyle(fontSize: 32, color: Colors.deepPurple),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                content,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      height: isActive ?12 : 8,
      width: isActive ? 12 : 8,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: Colors.deepPurple, borderRadius: BorderRadius.circular(20)),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (currenIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }
}
