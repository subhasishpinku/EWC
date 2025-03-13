import 'dart:convert';

import 'package:EWC/models/messages.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'forgototp.dart';

ProgressDialog pr;

class ForgotPasswordPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ForgotPasswordPageState();
  }
}

class ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String email;
  bool _autoValidate = false;
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context);

    final height = MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      body: Form(
        key: _formKey,
        autovalidate: _autoValidate,
        child: new Column(
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
              padding: EdgeInsets.all(20),
              height: size.height * 0.65,
              child: Center(
                child: Column(
                  children: [
                    TextFormField(
                      //controller: useremailController,
                      autofocus: false,
                      keyboardType: TextInputType.text,
                      onSaved: (String value) {
                        email = value;
                      },
                      //controller: emailController,
                      validator: _validateEmail,
                      decoration: InputDecoration(
                        //border: InputBorder.none,
                        hintText: "Email",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.black45,
                            letterSpacing: 0.5,
                            fontSize: 13,
                            fontFamily: 'OpenSans'),
                        prefixIcon: Icon(Icons.email),
                        // labelText: "User Name",
                        // labelStyle: TextStyle(color: Colors.black45, fontSize: 14),
                      ),
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: RaisedButton(
                            onPressed: _validateInputs,
                            // onPressed: () {
                            //   setState(() {
                            //     Navigator.pop(context);
                            //     Route route = MaterialPageRoute(
                            //         builder: (context) => ForgotOtpPage());
                            //     Navigator.pushReplacement(context, route);
                            //   });
                            // },

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
                                constraints: BoxConstraints(
                                    maxWidth: 120.0, minHeight: 40.0),
                                alignment: Alignment.center,
                                child: Text(
                                  "GET OTP",
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
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _validateEmail(String value) {
    if (value.isEmpty) {
      // The form is empty
      return "Enter Email Address";
    }
    // This is just a regular expression for email addresses
    String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
        ")+";
    RegExp regExp = new RegExp(p);

    if (regExp.hasMatch(value)) {
      // So, the email is valid
      return null;
    }

    // The pattern of the email didn't match the regex above.
    return 'Email is not valid';
  }

  void _validateInputs() async {
    final form = _formKey.currentState;
    if (form.validate()) {
      // Every of the data in the form are valid at this point
      form.save();
      //print(name + "\n" + password);
      _isLoading = true;
      // pr.show();
      // fetchForgotPassword(email);
      var connectivityResult = await (Connectivity().checkConnectivity());

      if (connectivityResult == ConnectivityResult.mobile) {
        pr.show();
        fetchForgotPassword(email);

        // I am connected to a mobile network.
      } else if (connectivityResult == ConnectivityResult.wifi) {
        // I am connected to a wifi network.
        pr.show();
        fetchForgotPassword(email);
      } else if (connectivityResult == ConnectivityResult.none) {
        Fluttertoast.showToast(
            msg: 'No Internet Connection',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 12.0);
      }

      //logIn(name, password);
    } else {
      setState(() => _autoValidate = true);
    }
  }

  Future<Messages> fetchForgotPassword(String email) async {
    final http.Response response = await http.post(
      'https://fituniverse.com/EWC/api/UserForgotPassword',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
      }),
    );
    if (response.statusCode == 200) {
      pr.hide();
      var statusMsg = Messages.fromJson(jsonDecode(response.body));
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (statusMsg.status == 1) {
        print(statusMsg.status);
        print(statusMsg.message);
        setState(() {
          Navigator.pop(context);
          Route route =
              MaterialPageRoute(builder: (context) => ForgotOtpPage());
          Navigator.pushReplacement(context, route);
        });

        Fluttertoast.showToast(
            msg: statusMsg.message,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 12.0);
      } else {
        print(statusMsg.message);
        Fluttertoast.showToast(
            msg: statusMsg.message,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 12.0);
      }
      print(statusMsg.status);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to load Login');
    }
  }
}

@override
Widget build(BuildContext context) {}
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
