import 'package:EWC/drawerpage/appbaricon.dart';
import 'package:EWC/drawerpage/navigationDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class contactPage extends StatefulWidget {
  static const String routeName = '/contactPage';

  @override
  _contactPageState createState() => _contactPageState();
}

class _contactPageState extends State<contactPage>
    with SingleTickerProviderStateMixin {
  /* TabController _tabController;
  ScrollController _scrollViewController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollViewController.dispose();
    super.dispose();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: navigationDrawer(),
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            "Contact Us",
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
        body: Center(child: Text("This is Contact page")));
  }
}
