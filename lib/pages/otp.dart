import 'dart:convert';

import 'package:EWC/models/index.dart';
import 'package:EWC/pages/createsuccess.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class OtpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return OtpPageState();
  }
}

ProgressDialog pr;

class OtpPageState extends State<OtpPage> {
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

    // TODO: implement build
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
                      SizedBox(height: 40),
                      RaisedButton(
                        onPressed: _validateInputs,
                        // onPressed: () {
                        //  setState(() {
                        //       Navigator.pop(context);
                        //       Route route = MaterialPageRoute(
                        //           builder: (context) => SuccessPage());
                        //       Navigator.pushReplacement(context, route);
                        //     });

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
                              "REGISTER",
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

  void _validateInputs() async {
    final form = _formKey.currentState;
    if (form.validate()) {
      // Every of the data in the form are valid at this point
      form.save();
      //print(name + "\n" + password);
      //_isLoading = true;
      // pr.show();
      //fetchOtp(otp);

      var connectivityResult = await (Connectivity().checkConnectivity());

      if (connectivityResult == ConnectivityResult.mobile) {
        pr.show();
        fetchOtp(otp);

        // I am connected to a mobile network.
      } else if (connectivityResult == ConnectivityResult.wifi) {
        // I am connected to a wifi network.
        pr.show();
        fetchOtp(otp);
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

  Future<Messages> fetchOtp(String otp) async {
    final http.Response response = await http.post(
      'https://fituniverse.com/EWC/api/UserOtpVerification',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'otp': otp,
      }),
    );
    if (response.statusCode == 200) {
      pr.hide();
      var statusMsg = Messages.fromJson(jsonDecode(response.body));
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (statusMsg.status == 1) {
        print(statusMsg.status);

        Fluttertoast.showToast(
            msg: statusMsg.message,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 12.0);
        Route route = MaterialPageRoute(builder: (context) => SuccessPage());
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
