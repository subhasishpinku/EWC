import 'package:EWC/fragment/about.dart';
import 'package:EWC/fragment/contact.dart';
import 'package:EWC/fragment/latest_news.dart';
import 'package:EWC/fragment/property.dart';
import 'package:EWC/utils/pageRoute.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'NavigationDrawer Demo',
      theme: new ThemeData(
        //primarySwatch: Colors.blue,
        primaryColor: Colors.blue[900]
      ),
      debugShowCheckedModeBanner: false,
      home: propertyPage(),
      routes: {
        pageRoutes.latestNews: (context) => latestNewsPage(),
        pageRoutes.aboutus: (context) => aboutPage(),
        pageRoutes.property: (context) => propertyPage(),
        pageRoutes.contact: (context) => contactPage(),
        //pageRoutes.category: (context) => categoryPage(),
      },
    );
  }
}
