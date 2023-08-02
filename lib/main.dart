import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/layout/home_screen/home_screen.dart';
import 'dart:ui' as ui;

void main() {
  runApp( DevicePreview(       enabled: !kReleaseMode, builder: (context) => MyApp(), // Wrap your app
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final windowSize = ui.window.physicalSize;
    final screenScale = ui.window.devicePixelRatio;
    double  screenWidth = windowSize.width / screenScale;
    double screenHeight = windowSize.height / screenScale;
    return ScreenUtilInit(
      designSize: Size(screenWidth, screenHeight),

      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          builder: DevicePreview.appBuilder,

          theme: ThemeData(
              appBarTheme: AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.transparent
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
      },
    );
  }


}
