import 'package:flutter/material.dart';
import 'package:intro_ui/pages/home_page.dart';
import 'package:intro_ui/pages/intro_page.dart';
import 'package:intro_ui/pages/strings_page.dart';
void main (){
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Intro Ui",
      theme: ThemeData(backgroundColor: Colors.black,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
      )),
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      routes: { IntroPage.id: (context) => IntroPage(),
        HomePage.id: (context) => HomePage(),
      }
    );
  }
}
