import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do/layout/home_screen/home_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        home: Home_Screen(),
      debugShowCheckedModeBanner:false,

    );
  }


}
