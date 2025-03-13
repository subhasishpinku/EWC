import 'package:EWC/fragment/favourite_property.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarIconPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return IconButton(
      icon: Icon(
        Icons.favorite_border,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FavouritePropertyPage()),
        );
      },
    );
  }
}
