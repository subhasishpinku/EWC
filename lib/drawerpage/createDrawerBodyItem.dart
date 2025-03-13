import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget createDrawerBodyItem(
    {IconData icon, String text, GestureTapCallback onTap}) {
  return Container(
    //height: 30,
    child: ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start, //change here don't //worked
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(icon, color: Colors.greenAccent[400]),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.blue[900],
                  letterSpacing: 0.5,
                  fontSize: 14,
                  fontFamily: 'OpenSans'),
            ),
          ),
          new Spacer(),
          Image.asset("images/arrow_30.png", color: Colors.greenAccent[400], height: 18, width: 18,),
          Divider(),
        ],
        
        //mainAxisAlignment: MainAxisAlignment.center,
      ),
      onTap: onTap,
    ),
  );
}
