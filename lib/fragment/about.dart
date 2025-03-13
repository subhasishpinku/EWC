import 'package:EWC/drawerpage/appbaricon.dart';
import 'package:EWC/drawerpage/navigationDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class aboutPage extends StatefulWidget {
  static const String routeName = '/aboutPage';

  @override
  _aboutPageState createState() => _aboutPageState();
}

class _aboutPageState extends State<aboutPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: navigationDrawer(),
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            "About Us",
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w600),
          ),
          actions: [
          AppBarIconPage(),
        ],
        ),
        body: Center(child: Text("This is About page")));
  }
}
