import 'dart:convert';

import 'package:EWC/models/messages.dart';
import 'package:EWC/pages/login.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:progress_dialog/progress_dialog.dart';

class ForgotOtpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ForgotOtpPageState();
  }
}

ProgressDialog pr;

TextEditingController passwordController = new TextEditingController();
TextEditingController conPasswordController = new TextEditingController();

class ForgotOtpPageState extends State<ForgotOtpPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String otp;
  String password;
  String conPassword;
  bool _termsChecked = false;
  bool _autoValidate = false;
  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context);

    return Scaffold(
      // backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      key: _scaffoldKey,

      body: Form(
        key: _formKey,
        autovalidate: _autoValidate,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 205,
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
              SizedBox(height: 20),
              Center(
                child: Container(
                  padding: EdgeInsets.all(20),
                  //height: size.height * 65,
                  child: Column(
                    children: [
                      TextFormField(
                        //controller: userNameController,
                        autofocus: false,
                        keyboardType: TextInputType.number,
                        //maxLength: 6,
                        onSaved: (String value) {
                          otp = value;
                        },
                        //controller: otpController,
                        validator: _validateOtp,
                        decoration: InputDecoration(
                          //border: InputBorder.none,
                          hintText: "OTP",
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.black45,
                              letterSpacing: 0.5,
                              fontSize: 13,
                              fontFamily: 'OpenSans'),
                          prefixIcon: Icon(Icons.confirmation_number),
                          // labelText: "User Name",
                          // labelStyle: TextStyle(color: Colors.black45, fontSize: 14),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        //controller: userNameController,
                        autofocus: false,
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        controller: passwordController,
                        onSaved: (String value) {
                          password = value;
                        },
                        validator: _validatePassword,
                        decoration: InputDecoration(
                          //border: InputBorder.none,
                          hintText: "New Password",
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.black45,
                              letterSpacing: 0.5,
                              fontSize: 13,
                              fontFamily: 'OpenSans'),
                          prefixIcon: Icon(Icons.lock),
                          // labelText: "User Name",
                          // labelStyle: TextStyle(color: Colors.black45, fontSize: 14),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        autofocus: false,
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        onSaved: (String value) {
                          conPassword = value;
                        },
                        controller: conPasswordController,
                        validator: _validateConPassword,
                        decoration: InputDecoration(
                          //border: InputBorder.none,
                          hintText: "Confirm New Password",
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.black45,
                              letterSpacing: 0.5,
                              fontSize: 13,
                              fontFamily: 'OpenSans'),

                          prefixIcon: Icon(Icons.lock),
                          // labelText: "User Name",
                          // labelStyle: TextStyle(color: Colors.black45, fontSize: 14),
                        ),
                      ),
                      SizedBox(height: 40),
                      RaisedButton(
                        onPressed: _validateInputs,
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
                              "SUBMIT",
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
        ),
      ),
    );
  }

  String _validateOtp(String value) {
    if (value.isEmpty) {
      // The form is empty
      return "Enter OTP";
    }

    if (value.length == 6) {
      return null;
    }
    // The pattern of the email didn't match the regex above.
    return 'OTP must be 6 Digits';
  }

  String _validatePassword(String value) {
    if (value.length > 5) {
      return null;
    }

    return 'New Password must be upto 6 characters';
  }

  String _validateConPassword(String value) {
    if (value.isEmpty) {
      // The form is empty
      return "Enter Confirm Password";
    }
    if (value == passwordController.text.toString().trim()) {
      return null;
    }

    return 'Confirm New Password does not match';
  }

  void _validateInputs() async {
    final form = _formKey.currentState;
    if (form.validate()) {
      // Every of the data in the form are valid at this point
      form.save();
      //print(name + "\n" + password);
      // pr.show();
      // fetchPasswordChange(otp, password);

      var connectivityResult = await (Connectivity().checkConnectivity());

      if (connectivityResult == ConnectivityResult.mobile) {
        pr.show();
        fetchPasswordChange(otp, password);

        // I am connected to a mobile network.
      } else if (connectivityResult == ConnectivityResult.wifi) {
        // I am connected to a wifi network.
        pr.show();
        fetchPasswordChange(otp, password);
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
    } else {
      setState(() => _autoValidate = true);
    }
  }

  // ignore: missing_return
  Future<Messages> fetchPasswordChange(String otp, password) async {
    final http.Response response = await http.post(
      'https://fituniverse.com/EWC/api/UserForgotOtpVerification',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'for_otp': otp,
        'user_password': password,
      }),
    );
    if (response.statusCode == 200) {
      pr.hide();
      var statusMsg = Messages.fromJson(jsonDecode(response.body));
      //SharedPreferences prefs = await SharedPreferences.getInstance();
      if (statusMsg.status == 1) {
        print(statusMsg.status);
        print(statusMsg.message);

        Fluttertoast.showToast(
            msg: statusMsg.message,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 12.0);
        Route route = MaterialPageRoute(builder: (context) => LoginPage());
        Navigator.pushReplacement(context, route);
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
