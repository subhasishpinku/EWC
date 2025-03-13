import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';
import 'login.dart';

class IntroScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    //FlutterStatusbarcolor.setStatusBarColor(Colors.blue[900]);

    return IntroScreenState();
  }
}

class IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // TODO: implement build
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      //statusBarColor: Color(0xFF2E7D32),
      statusBarColor: Colors.blue[900],
    ));
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: new Column(
        children: [
          Container(
            height: size.height * 0.35,
            color: Colors.white,
            child: Stack(
              children: [
                CustomPaint(
                  painter: ShapesPainter(),
                  child: Container(
                    height: 150.0,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 80,
                  right: 80,
                  //bottom: 20,
                  child: Center(
                    child: Image.asset(
                      'images/logo.png',
                      height: 100,
                    ),
                  ),
                ),
              ],
            ),
          ),
          //SizedBox(height: 20),
          Container(
            height: size.height * 0.65,
            child: Center(
              child: Column(
                children: [
                  Image.asset(
                    'images/workers.jpg',
                    height: 200,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Quisque venenatis mattis dolor, non \nconvallis aliquam et. Integer auctor risus, \nat iaculis ipsum. Vestibulum id metus ac \ndiam imperdiet tempus Nam tincidunt \neuismod tincidunt.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          letterSpacing: 0.5,
                          height: 1.5,
                          fontFamily: 'OpenSans'),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      setState(() {
                        prefs.setBool('seen', true);
                      });
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    padding: EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Colors.blue[900],
                              Colors.indigo[900]
                            ],

                            //colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Container(
                        constraints:
                            BoxConstraints(maxWidth: 120.0, minHeight: 40.0),
                        alignment: Alignment.center,
                        child: Text(
                          "I AGREE",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 0.5,
                              fontSize: 12,
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const double _kCurveHeight = 35;

class ShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Path();
    p.lineTo(0, size.height - _kCurveHeight);
    p.relativeQuadraticBezierTo(
        size.width / 2, 2 * _kCurveHeight, size.width, 0);
    p.lineTo(size.width, 0);
    p.close();
    canvas.drawShadow(p, Colors.grey[900], 20.0, false);
    canvas.drawPath(p, Paint()..color = Colors.blue[900]);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
