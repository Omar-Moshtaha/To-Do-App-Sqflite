import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/firebase_options.dart';
import 'dart:ui' as ui;

import 'package:project/layout/home_screen/home_screen.dart';

void main() async{
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  runApp(   MyApp(), // Wrap your app
  );
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
          theme: ThemeData(
              appBarTheme: const AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.transparent
                  )
              )
          ),

          home: AnimatedSplashScreen(
            splashIconSize: double.infinity,

            nextScreen: Home_Screen(),splash: const Column(
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
