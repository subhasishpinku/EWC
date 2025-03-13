import 'dart:async';
import 'dart:convert';

import 'package:EWC/models/index.dart';
import 'package:EWC/pages/forgotpassword.dart';
import 'package:EWC/pages/register.dart';
import 'package:clippy_flutter/arc.dart';
import 'package:clippy_flutter/bevel.dart';
import 'package:clippy_flutter/bevel.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'home.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      //statusBarColor: Color(0xFF2E7D32),
      statusBarColor: Colors.transparent,
    ));
    return LoginPageState();
  }
}

TextEditingController userNameController = new TextEditingController();
ProgressDialog pr;

class LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String mobile;
  String password;
  bool _autoValidate = false;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                      controller: userNameController,
                      autofocus: false,
                      keyboardType: TextInputType.phone,
                      onSaved: (String value) {
                        mobile = value;
                      },
                      validator: _validateMobile,
                      decoration: InputDecoration(
                        //border: InputBorder.none,
                        hintText: "Mobile Number",
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
                      autofocus: false,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      onSaved: (String value) {
                        password = value;
                      },
                      validator: _validatePassword,
                      decoration: InputDecoration(
                        //border: InputBorder.none,
                        hintText: "*********",
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
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgotPasswordPage(),
                            ),
                          );
                        },
                        child: Text(
                          "Forgot Password?",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 13,
                              letterSpacing: 0.5,
                              fontFamily: 'OpenSans'),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: RaisedButton(
                            onPressed: _validateInputs,

                            // onPressed: () async {
                            //   // SharedPreferences prefs =
                            //   //     await SharedPreferences.getInstance();
                            //   // setState(() {
                            //   //   prefs.setBool('seen', true);
                            //   // });
                            //   // Do what you want

                            //   Navigator.pushReplacement(
                            //       context,
                            //       MaterialPageRoute(
                            //         builder: (context) => HomeDrawer(),
                            //       ));
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
                                  "LOGIN",
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
                        Align(
                          alignment: Alignment.centerRight,
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterPage(),
                                ),
                              );
                              // Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => RegisterPage(),
                              //     ));
                            },
                            child: Text(
                              "REGISTER",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.grey[800],
                                  letterSpacing: 0.5,
                                  fontSize: 12,
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w600),
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

  // String _validateName(String value) {
  //   if (value.isNotEmpty) {
  //     return null;
  //   }

  //   return 'Enter Mobile Number';
  // }

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

  String _validatePassword(String value) {
    if (value.isEmpty) {
      return 'Enter Password';
    }
    // if (value.length > 5) {
    //   return null;
    // }
    return null;

    //return 'Password must be upto 6 characters';
  }

  void _validateInputs() async {
    final form = _formKey.currentState;
    if (form.validate()) {
      // Every of the data in the form are valid at this point
      form.save();
      //print(name + "\n" + password);
      _isLoading = true;

      var connectivityResult = await (Connectivity().checkConnectivity());

      if (connectivityResult == ConnectivityResult.mobile) {
        pr.show();
        fetchLogin(mobile, password);

        // I am connected to a mobile network.
      } else if (connectivityResult == ConnectivityResult.wifi) {
        // I am connected to a wifi network.
        pr.show();
        fetchLogin(mobile, password);
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
  Future<Login> fetchLogin(String mobile, password) async {
    final http.Response response = await http.post(
      'https://fituniverse.com/EWC/api/UserLogin',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'mobile': mobile,
        'user_password': password,
      }),
    );
    if (response.statusCode == 200) {
      pr.hide();
      var statusMsg = Login.fromJson(jsonDecode(response.body));
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (statusMsg.status == 1) {
        print(statusMsg.status);
        print(statusMsg.message);
        print(statusMsg.data.userid);
        print(statusMsg.data.username);
        print(statusMsg.data.useremail);
        print(statusMsg.data.usermobile);
        setState(() {
          prefs.setString('user_id', statusMsg.data.userid);
          prefs.setString('user_name', statusMsg.data.username);
          prefs.setString('user_email', statusMsg.data.useremail);
          prefs.setString('user_mobile', statusMsg.data.usermobile);
          prefs.setString('islogged', "1");
        });
        Fluttertoast.showToast(
            msg: statusMsg.message,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 12.0);

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDrawer(),
            ));
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
  // fetchLogin(String username, userpassword) async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   Map data = {'mobile': username, 'user_password': userpassword};
  //   String body = json.encode(data);

  //   http.Response response = await http.post(
  //     'https://fituniverse.com/EWC/api/UserLogin',
  //     headers: {
  //       //"Accept": "application/json",
  //       "Accept": "application/json"
  //     },
  //     body: body,
  //   );
  //   if (response.statusCode == 200) {
  //     var statusMsg = Login.fromJson(jsonDecode(response.body));

  //     if (statusMsg.status == 1) {
  //       print(statusMsg.status);
  //       print(statusMsg.message);
  //       print(statusMsg.data.userid);
  //       print(statusMsg.data.username);
  //       print(statusMsg.data.useremail);
  //       print(statusMsg.data.usermobile);

  //     } else {
  //       print(statusMsg.message);
  //     }

  //     //sharedPreferences.setString("token", jsonResponse['token']);
  //     // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => MainPage()), (Route<dynamic> route) => false);

  //   } else {
  //     // print(response.body);
  //   }
  // }
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
