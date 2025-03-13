

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget createDrawerHeader(context) {
  return Container(
    height: 75.0,
    child: DrawerHeader(
        child: Padding(
            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Row(
              children: [
                IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                     Navigator.of(context).pop() ;

                    }),
                SizedBox(width: 5),
                Text(
                  'Menu',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ],
            )),
        decoration: BoxDecoration(color: Colors.blue[900]),
        margin: EdgeInsets.all(0.0),
        padding: EdgeInsets.all(0.0)),
  );

  // return DrawerHeader(
  //   margin: EdgeInsets.zero,
  //   padding: EdgeInsets.zero,
  //   decoration: BoxDecoration(
  //       image: DecorationImage(
  //           colorFilter: ColorFilter.mode(
  //               Colors.black.withOpacity(0.5), BlendMode.dstATop),
  //           fit: BoxFit.fill,
  //           image: AssetImage('images/home_img.jpg'))),
  //   child: Stack(
  //     children: <Widget>[
  //       Positioned(
  //         //bottom: 12.0,
  //         //left: 16.0,
  //         child: Center(
  //           child: Text(
  //             "Welcome to Flutter",
  //             style: TextStyle(
  //                 color: Colors.black,
  //                 fontSize: 20.0,
  //                 fontWeight: FontWeight.w500),
  //           ),
  //         ),
  //       ),
  //     ],
  //   ),
  // );
}
