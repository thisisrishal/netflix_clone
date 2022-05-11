import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_ui/core/colors/colors.dart';
import 'package:netflix_ui/main_page/screen_main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Netflix UI',
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.black),
        primarySwatch: Colors.blue,
        backgroundColor: Colors.black,
        scaffoldBackgroundColor: backgroundColor,
        fontFamily: 'NetflixSans',
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            color: Colors.white,
          ),
          bodyText2: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      home: ScreenMainPage(),
    );
  }
}




