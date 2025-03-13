import 'dart:async';

import 'package:EWC/pages/home.dart';
import 'package:EWC/pages/login.dart';
import 'package:after_layout/after_layout.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'intro.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen>
    with AfterLayoutMixin<SplashScreen> {
  Future checkFirstSeen() async {
    String deviceId = await _getId();
    print(deviceId);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);
    String _islogged = (prefs.getString("islogged") ?? "0");

    if (_seen) {
      if (_islogged == "0") {
        Navigator.of(context).pushReplacement(
            new MaterialPageRoute(builder: (context) => new LoginPage()));
      } else {
        Navigator.of(context).pushReplacement(
            new MaterialPageRoute(builder: (context) => new HomeDrawer()));
      }
    } else {
      //await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new IntroScreen()));
    }
  }

  // @override
  // void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width,
            top: MediaQuery.of(context).size.width * 0.50,
            bottom: MediaQuery.of(context).size.width *
                0.50, //TRY TO CHANGE THIS **0.30** value to achieve your goal
            child: Container(
              margin: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('images/logo.png',
                      height: 150.0, width: 150.0, scale: 2.5),
                  SizedBox(
                    height: 5,
                  ),
                  // Text(
                  //   "NeutronX",
                  //   style: TextStyle(
                  //       fontSize: 20,
                  //       color: Colors.black,
                  //       //fontFamily: 'Open Sans',
                  //       fontWeight: FontWeight.bold),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    // TODO: implement afterFirstLayout
    new Timer(new Duration(milliseconds: 2000), () {
      checkFirstSeen();
    });
  }

  Future<String> _getId() async {
    var deviceInfo = DeviceInfoPlugin();
    // if (Platform.isIOS) { // import 'dart:io'
    //   IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
    //   return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    // } else {
    AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
    return androidDeviceInfo.androidId; // unique ID on Android
    // }
  }
}
