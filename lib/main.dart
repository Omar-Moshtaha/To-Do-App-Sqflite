import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do/layout/home_screen/home_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
theme: ThemeData(
  appBarTheme: AppBarTheme(
    backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.blue
    )
  )
),
        home: AnimatedSplashScreen(
          splashIconSize: double.infinity,
          nextScreen: Home_Screen(),splash: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage("assets/image/list.png"),width: 100,height: 100,),
            SizedBox(height: 10,),
            Text("ToDo App",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),)
          ],
        ),splashTransition: SplashTransition.sizeTransition,),
      debugShowCheckedModeBanner:false,

    );
  }


}
