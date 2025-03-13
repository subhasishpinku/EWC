import 'package:EWC/fragment/logout_overlay.dart';
import 'package:EWC/utils/pageRoute.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'createDrawerBodyItem.dart';
import 'createDrawerHeader.dart';

class navigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          createDrawerHeader(context),
          createDrawerBodyItem(
            icon: Icons.tv,
            text: 'Latest News',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.latestNews),
          ),
          Divider(
            height: 0,
          ),
          createDrawerBodyItem(
            icon: Icons.account_circle,
            text: 'About Us',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.aboutus),
          ),
          Divider(
            height: 0,
          ),

          createDrawerBodyItem(
            icon: Icons.home,
            text: 'Property List',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.property),
          ),

          //  createDrawerBodyItem(
          //    icon: Icons.category,
          //    text: 'Category',
          //    onTap: () =>
          //        Navigator.pushReplacementNamed(context, pageRoutes.category),
          //  ),
          Divider(
            height: 0,
          ),

          createDrawerBodyItem(
            icon: Icons.email,
            text: 'Contact Us',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.contact),
          ),
          Divider(
            height: 0,
          ),

          createDrawerBodyItem(
            icon: Icons.exit_to_app,
            text: 'Log out',
            onTap: () => {
              Navigator.of(context).pop() ,
              showDialog(
                context: context,
                builder: (_) => LogoutOverlay(),
              ),
            },
            //Navigator.pushReplacementNamed(context, pageRoutes.contact),
          ),
          Divider(
            height: 0,
          ),

          ListTile(
            title: Text(
              'App version 1.0.0',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.blue[900],
                  letterSpacing: 0.5,
                  fontSize: 13,
                  fontFamily: 'OpenSans'),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
