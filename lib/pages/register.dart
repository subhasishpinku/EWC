import 'dart:convert';
import 'dart:math';

import 'package:EWC/models/messages.dart';
import 'package:EWC/pages/otp.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'createsuccess.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegisterPageState();
  }
}

TextEditingController userNameController = new TextEditingController();
TextEditingController emailController = new TextEditingController();
TextEditingController mobileController = new TextEditingController();
TextEditingController passwordController = new TextEditingController();
TextEditingController conPasswordController = new TextEditingController();
//bool checkVal = false;
ProgressDialog pr;

class RegisterPageState extends State<RegisterPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String name;
  String email;
  String mobile;
  String password;
  String conPassword;
  bool _termsChecked = false;
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                        controller: userNameController,
                        autofocus: false,
                        keyboardType: TextInputType.text,
                        onSaved: (String value) {
                          name = value;
                        },
                        validator: _validateName,
                        decoration: InputDecoration(
                          //border: InputBorder.none,
                          hintText: "User Name",
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.black45,
                              letterSpacing: 0.5,
                              fontSize: 13,
                              fontFamily: 'OpenSans'),
                          prefixIcon: Icon(Icons.account_circle),
                          // labelText: "User Name",
                          // labelStyle: TextStyle(color: Colors.black45, fontSize: 14),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        //controller: userNameController,
                        autofocus: false,
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (String value) {
                          email = value;
                        },
                        controller: emailController,
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
                      SizedBox(height: 10),
                      TextFormField(
                        //controller: userNameController,
                        autofocus: false,
                        keyboardType: TextInputType.number,
                        onSaved: (String value) {
                          mobile = value;
                        },
                        controller: mobileController,
                        validator: _validateMobile,
                        decoration: InputDecoration(
                          //border: InputBorder.none,
                          hintText: "Mobile",
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.black45,
                              letterSpacing: 0.5,
                              fontSize: 13,
                              fontFamily: 'OpenSans'),
                          prefixIcon: Icon(Icons.phone_android),
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
                          hintText: "Password",
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
                          hintText: "Confirm Password",
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
                      SizedBox(height: 5),
                      Align(
                        alignment: Alignment.centerLeft,
                        // child: CheckboxListTile(

                        // value: _termsChecked,
                        // onChanged: (bool value) =>
                        //     setState(() => _termsChecked = value),
                        //           title: new Text(
                        //       "Feel free to check out this.",
                        //       textAlign: TextAlign.center,
                        //       style: TextStyle(
                        //           color: Colors.grey[700],
                        //           letterSpacing: 0.5,
                        //           fontSize: 12,
                        //           fontFamily: 'OpenSans'),
                        //     ),),

                        child: Row(
                          children: [
                            Checkbox(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              activeColor: Colors.blue[900],
                              checkColor: Colors.white,
                              value: _termsChecked,
                              onChanged: (bool value) =>
                                  setState(() => _termsChecked = value),
                            ),
                            Text(
                              "Feel free to check out this.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  letterSpacing: 0.5,
                                  fontSize: 12,
                                  fontFamily: 'OpenSans'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40),
                      RaisedButton(
                        onPressed: _validateInputs,

                        // onPressed: () async {
                        //   setState(() {
                        //     Navigator.pop(context);
                        //     Route route = MaterialPageRoute(
                        //         builder: (context) => OtpPage());
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

  String _validatePassword(String value) {
    if (value.length > 5) {
      return null;
    }

    return 'Password must be upto 6 characters';
  }

  String _validateConPassword(String value) {
    if (value.isEmpty) {
      // The form is empty
      return "Enter Confirm Password";
    }
    if (value == passwordController.text.toString().trim()) {
      return null;
    }

    return 'Confirm Password does not match';
  }

  String _validateMobile(String value) {
    if (value.isEmpty) {
      // The form is empty
      return "Enter Mobile";
    }
    // This is just a regular expression for email addresses
    String p = "[0-9]{10}";
    RegExp regExp = new RegExp(p);

    if (regExp.hasMatch(value)) {
      // So, the Mobile is valid
      return null;
    }

    // The pattern of the email didn't match the regex above.
    return 'Mobile must be  10 digits';
  }
  // String _validateMobile(String value) {
  //   if (value.isEmpty) {
  //     // The form is empty
  //     return "Enter Mobile";
  //   }

  //   if (value.length < 11) {
  //     return null;
  //   }

  //   return 'Mobile must be  10 digits';
  // }

  String _validateName(String value) {
    if (value.isNotEmpty) {
      return null;
    }

    return 'Enter User Name';
  }

  void _validateInputs() async {
    final form = _formKey.currentState;
    if (form.validate()) {
      // Text forms has validated.
      // Let's validate radios and checkbox
      if (!_termsChecked) {
        // The checkbox wasn't checked
        _showSnackBar("Please Feel free to check out it");
      } else {
        // Every of the data in the form are valid at this point
        form.save();
        String checkedValue = "1";
        print(name +
            "\n" +
            email +
            "\n" +
            mobile +
            "\n" +
            password +
            "\n" +
            checkedValue);
        //pr.show();
        //fetchRegister(name, email, mobile, password, checkedValue);

        var connectivityResult = await (Connectivity().checkConnectivity());

        if (connectivityResult == ConnectivityResult.mobile) {
          pr.show();
          fetchRegister(name, email, mobile, password, checkedValue);

          // I am connected to a mobile network.
        } else if (connectivityResult == ConnectivityResult.wifi) {
          // I am connected to a wifi network.
          pr.show();
          fetchRegister(name, email, mobile, password, checkedValue);
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

        // showDialog(
        //     context: context,
        //     builder: (BuildContext context) => new AlertDialog(
        //           content: new Text("All inputs are valid"),
        //         ));
      }
    } else {
      setState(() => _autoValidate = true);
    }
  }

  void _showSnackBar(message) {
    final snackBar = new SnackBar(
      content: new Text(message),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  Future<Messages> fetchRegister(
      String name, email, mobile, password, status) async {
    final http.Response response = await http.post(
      'https://fituniverse.com/EWC/api/UserRegistration',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'user_name': name,
        'email': email,
        'mobile': mobile,
        'user_password': password,
        'status': status,
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
          Route route = MaterialPageRoute(builder: (context) => OtpPage());
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
