import 'package:EWC/drawerpage/appbaricon.dart';
import 'package:EWC/drawerpage/navigationDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class latestNewsPage extends StatefulWidget {
  static const String routeName = '/latestNewsPage';

  @override
  _latestNewsPageState createState() => _latestNewsPageState();
}

class _latestNewsPageState extends State<latestNewsPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: navigationDrawer(),
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            "Latest News",
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.left,
          ),
          actions: [
          AppBarIconPage(),
        ],
        ),
        body: Center(child: Text("This is Latest News page")));
  }
}
