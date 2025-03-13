import 'package:EWC/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return MaterialApp( theme: ThemeData(primarySwatch: Colors.blue), home: HomeScreen());
    //FlutterStatusbarcolor.setStatusBarColor(Colors.blue[900]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      //statusBarColor: Color(0xFF2E7D32),
      statusBarColor: Colors.transparent,
    ));
    

    return MaterialApp(
      theme: new ThemeData(
       // brightness: Brightness.light,
        primaryColor:  Colors.blue[900],
        //scaffoldBackgroundColor: Colors.white
        //indicatorColor: Colors.blue[900]
        ),
        
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
