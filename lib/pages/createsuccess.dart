import 'package:EWC/pages/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home.dart';

class SuccessPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SuccessPageState();
  }
}

class SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/back_img.jpg"), fit: BoxFit.cover),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('images/logo.png',
                            height: 150.0, width: 150.0, scale: 2.5),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "You  are  ready  to  go!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 0.5,
                              fontSize: 18,
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Thanks for taking your time to create \naccount with us, Let's \nexplore the app.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 0.5,
                              fontSize: 15,
                              fontFamily: 'OpenSans',
                              height: 1.8),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            Route route = MaterialPageRoute(
                                builder: (context) => LoginPage());
                            Navigator.pushReplacement(context, route);
                            // Navigator.pushReplacement(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => LoginPage(),
                            //   ),
                            // );
                          },
                          child: Image.asset(
                            "images/double_right.png",
                            color: Colors.white,
                          ),
                        ),
                        //Image.asset('images/double_right.png', color: Colors.white,),
                      ],
                    ),
                  ),
                )
                // Positioned(
                //   width: MediaQuery.of(context).size.width,
                //   top: MediaQuery.of(context).size.width * 0.40,
                //   // bottom: MediaQuery.of(context).size.width *
                //   //     0.50, //TRY TO CHANGE THIS **0.30** value to achieve your goal
                //   child: Container(
                //     margin: EdgeInsets.all(16.0),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: <Widget>[
                //         Image.asset('images/logo.png',
                //             height: 150.0, width: 150.0, scale: 2.5),
                //         SizedBox(
                //           height: 30,
                //         ),
                //         Text(
                //           "You  are  ready  to  go!",
                //           textAlign: TextAlign.center,
                //           style: TextStyle(
                //               color: Colors.white,
                //               letterSpacing: 0.5,
                //               fontSize: 18,
                //               fontFamily: 'OpenSans',
                //               fontWeight: FontWeight.w600),
                //         ),
                //         SizedBox(
                //           height: 10,
                //         ),
                //         Text(
                //           "Thanks for taking your time to create \naccount with us, Let's \nexplore the app.",
                //           textAlign: TextAlign.center,
                //           style: TextStyle(
                //               color: Colors.white,
                //               letterSpacing: 0.5,
                //               fontSize: 15,
                //               fontFamily: 'OpenSans',
                //               height: 1.8),
                //         ),
                //         SizedBox(
                //           height: 20,
                //         ),
                //         InkWell(
                //           onTap: () {
                //             Navigator.pushReplacement(
                //               context,
                //               MaterialPageRoute(
                //                 builder: (context) => HomeDrawer(),
                //               ),
                //             );
                //           },
                //           child: Image.asset(
                //             "images/double_right.png",
                //             color: Colors.white,
                //           ),
                //         ),
                //         //Image.asset('images/double_right.png', color: Colors.white,),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            )
            // backgroundColor: Colors.transparent,
            // appBar: AppBar(
            //   elevation: 0,
            //   backgroundColor: Colors.transparent,
            //   title: Text('My App'),
            //   centerTitle: true,
            //   leading: IconButton(
            //       icon: Icon(
            //         Icons.list,
            //         color: Colors.white,
            //       ),
            //       onPressed: () {}),
            // ),
            ),
      ),
    );
  }
}
