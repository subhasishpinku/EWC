import 'dart:convert';

import 'package:EWC/models/messages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class PropertyDetailsPage extends StatefulWidget {
  //PropertyDetailsPage(String propertyId);
  final String propertyId,
      propertiesName,
      propertiesLocation,
      propertiesDescription,
      propertiesPrice,
      propertiesImage,
      statusFav;
  PropertyDetailsPage(
      this.propertyId,
      this.propertiesName,
      this.propertiesLocation,
      this.propertiesDescription,
      this.propertiesPrice,
      this.propertiesImage,
      this.statusFav);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PropertyDetailsPageState(
        propertyId,
        propertiesName,
        propertiesLocation,
        propertiesDescription,
        propertiesPrice,
        propertiesImage,
        statusFav);
  }
}

class PropertyDetailsPageState extends State<PropertyDetailsPage> {
  String propertyId,
      propertiesName,
      propertiesLocation,
      propertiesDescription,
      propertiesPrice,
      propertiesImage,
      statusFav;

  PropertyDetailsPageState(
      this.propertyId,
      this.propertiesName,
      this.propertiesLocation,
      this.propertiesDescription,
      this.propertiesPrice,
      this.propertiesImage,
      this.statusFav);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "\$" + propertiesPrice + " AUD",
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
            fontFamily: "OpenSans",
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  decoration: new BoxDecoration(color: Colors.white),
                  height: 200,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 200.0,
                        // child: Image.network(
                        //   propertiesImage,
                        //   fit: BoxFit.cover,
                        // ),
                        child: FadeInImage.assetNetwork(
                          placeholder: 'images/img_loader.gif',
                          image: propertiesImage,
                          //width: 40,
                          //height: 40,
                          fit: BoxFit.cover,
                        ),
                        // child: Image.network(
                        //   data[index].propertiesimage,
                        //   fit: BoxFit.cover,
                        // ),
                        // child: Image(
                        //   fit: BoxFit.cover,
                        //   image: AssetImage('images/house.jpg'),
                        // ),
                      ),
                      //  FadeInImage.assetNetwork(
                      //         placeholder: 'images/img_loader.gif',
                      //         image: propertiesImage,
                      //         fit: BoxFit.cover,

                      //       ),
                      // new Image.asset(
                      //   propertiesImage,
                      //   width: double.infinity,
                      //   height: 200.0,
                      //   fit: BoxFit.cover,
                      // ),
                      // Opacity(
                      //   opacity: 0.5,
                      //   child: new Image.asset(
                      //     'images/house.jpg',
                      //     width: double.infinity,
                      //     height: 200.0,
                      //     fit: BoxFit.cover,
                      //   ),
                      // ),

                      //Image.network(used_car.imageUrl, fit: BoxFit.fill),
                      Positioned(
                        top: 10,
                        right:
                            10, //give the values according to your requirement
                        //child: Icon(Icons.share),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CupertinoButton(
                              minSize: double.minPositive,
                              padding: EdgeInsets.zero,
                              child: Icon(Icons.share,
                                  color: Colors.blue[700], size: 20),
                              onPressed: () {},
                            ),
                            SizedBox(width: 8),
                            SizedBox(
                              height: 28,
                              width: 30,
                              child: IconButton(
                                iconSize: 20,
                                onPressed: () {
                                  // setState(
                                  //   () {
                                  //     // data[index].statusfav =
                                  //     //     data[index].statusfav == "0"
                                  //     //         ? "1"
                                  //     //         : "0";
                                  //     if (statusFav == "1") {
                                  //       addToWishList(propertyId, "0");
                                  //       // Fluttertoast.showToast(
                                  //       //     msg: "0",
                                  //       //     toastLength: Toast.LENGTH_SHORT,
                                  //       //     gravity: ToastGravity.BOTTOM,
                                  //       //     timeInSecForIosWeb: 1,
                                  //       //     backgroundColor: Colors.black,
                                  //       //     textColor: Colors.white,
                                  //       //     fontSize: 12.0);
                                  //     } else {
                                  //       // Fluttertoast.showToast(
                                  //       //   msg: "1",
                                  //       //   toastLength: Toast.LENGTH_SHORT,
                                  //       //   gravity: ToastGravity.BOTTOM,
                                  //       //   timeInSecForIosWeb: 1,
                                  //       //   backgroundColor: Colors.black,
                                  //       //   textColor: Colors.white,
                                  //       //   fontSize: 12.0);
                                  //       addToWishList(propertyId, "1");
                                  //     }
                                  //   },
                                  // );
                                },
                                icon: statusFav == "0"
                                    ? Icon(Icons.favorite_border,
                                        color: Colors.blue[700], size: 20)
                                    : Icon(Icons.favorite,
                                        color: Colors.red[300], size: 20),
                              ),
                            ),
                            // CupertinoButton(
                            //   minSize: double.minPositive,
                            //   padding: EdgeInsets.zero,
                            //   child: Icon(Icons.favorite_border,
                            //       color: Colors.blue[700], size: 20),
                            //   onPressed: () {},
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: new EdgeInsets.only(left: 8, right: 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "\$" + propertiesPrice + " AUD",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.blue[900],
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5,
                                fontFamily: "OpenSans",
                              ),
                            ),
                            Container(
                                height: 14,
                                child: VerticalDivider(
                                    thickness: 1, color: Colors.blue[900])),
                            Text(
                              '4 BHK/Flat, House/Villa',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5,
                                fontFamily: "OpenSans",
                              ),
                            ),
                            SizedBox(width: 5),
                            Image.asset(
                              "images/shield.png",
                              color: Colors.greenAccent[400],
                              height: 15,
                              width: 15,
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CupertinoButton(
                                minSize: double.minPositive,
                                padding: EdgeInsets.zero,
                                child: Icon(Icons.location_on,
                                    color: Colors.black87, size: 14),
                                onPressed: () {},
                              ),
                              Text(
                                propertiesLocation,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.5,
                                  fontFamily: "OpenSans",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    MaterialButton(
                      onPressed: () {
                        // Fluttertoast.showToast(
                        //     msg: propertyId,
                        //     toastLength: Toast.LENGTH_SHORT,
                        //     gravity: ToastGravity.CENTER,
                        //     timeInSecForIosWeb: 1,
                        //     backgroundColor: Colors.black,
                        //     textColor: Colors.white,
                        //     fontSize: 12.0);
                      },
                      color: Colors.blue[900],
                      minWidth: 0,
                      height: 24,
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),

                      //padding: EdgeInsets.all(0),
                      child: Text(
                        'Hold',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w600),
                      ),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(6.0),
                        side: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                            style: BorderStyle.solid),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: new EdgeInsets.only(top: 3),
              height: 0.5,
              width: double.infinity,
              color: Colors.grey,
            ),
            Container(
              padding: new EdgeInsets.only(top: 5, left: 8, right: 8),
              child: Row(
                children: [
                  new Text(
                    'Covered Area',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                      fontFamily: "OpenSans",
                    ),
                  ),
                  Spacer(),
                  new Text(
                    'Locality',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                      fontFamily: "OpenSans",
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: new EdgeInsets.only(top: 3, left: 8, right: 8),
              child: Row(
                children: [
                  new Text(
                    '1034 Sqft',
                    style: TextStyle(
                      fontSize: 8.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                      fontFamily: "OpenSans",
                    ),
                  ),
                  Spacer(),
                  new Text(
                    'Rajarhat, Kolkata',
                    style: TextStyle(
                      fontSize: 8.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                      fontFamily: "OpenSans",
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: new EdgeInsets.only(top: 3, left: 8, right: 8),
              child: Row(
                children: [
                  new Text(
                    '\$ 4000 AUD/Sqft',
                    style: TextStyle(
                      fontSize: 8.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                      fontFamily: "OpenSans",
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: new EdgeInsets.only(top: 8, left: 8, right: 8),
              child: Row(
                children: [
                  new Text(
                    'Society',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                      fontFamily: "OpenSans",
                    ),
                  ),
                  Spacer(),
                  new Text(
                    'Configuraton',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                      fontFamily: "OpenSans",
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: new EdgeInsets.only(top: 3, left: 8, right: 8),
              child: Row(
                children: [
                  new Text(
                    'Rishi Phase 1',
                    style: TextStyle(
                      fontSize: 8.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                      fontFamily: "OpenSans",
                    ),
                  ),
                  Spacer(),
                  new Text(
                    '3 Bed, 2 Bath',
                    style: TextStyle(
                      fontSize: 8.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                      fontFamily: "OpenSans",
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: new EdgeInsets.only(top: 8, left: 8, right: 8),
              child: Row(
                children: [
                  new Text(
                    'Possession',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                      fontFamily: "OpenSans",
                    ),
                  ),
                  Spacer(),
                  new Text(
                    'Status',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                      fontFamily: "OpenSans",
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding:
                  new EdgeInsets.only(top: 3, left: 8, right: 8, bottom: 5),
              child: Row(
                children: [
                  new Text(
                    'June 2023',
                    style: TextStyle(
                      fontSize: 8.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                      fontFamily: "OpenSans",
                    ),
                  ),
                  Spacer(),
                  new Text(
                    'Under Construction',
                    style: TextStyle(
                      fontSize: 8.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                      fontFamily: "OpenSans",
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: new EdgeInsets.only(top: 5),
              height: 0.5,
              width: double.infinity,
              color: Colors.grey,
            ),
            Container(
              padding: new EdgeInsets.only(top: 5, left: 8, right: 8),
              child: Row(
                children: [
                  Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                      fontFamily: "OpenSans",
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.fromLTRB(8, 4, 8, 8),
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum." +
                      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
                  //textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 11.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5,
                    fontFamily: "OpenSans",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ignore: missing_return
  Future<Messages> addToWishList(String propertiesid, String favStatus) async {
    final http.Response response = await http.post(
      'https://fituniverse.com/EWC/api/FavResponse',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'properties_id': propertiesid,
        'status_fav': favStatus,
      }),
    );
    if (response.statusCode == 200) {
      //pr.hide();
      var statusMsg = Messages.fromJson(jsonDecode(response.body));
      //SharedPreferences prefs = await SharedPreferences.getInstance();
      if (statusMsg.status == 1) {
        print(statusMsg.status);
        print(statusMsg.message);
// ignore: invalid_use_of_protected_member
        (context as Element).reassemble();
        // Fluttertoast.showToast(
        //     msg: statusMsg.message,
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: Colors.black,
        //     textColor: Colors.white,
        //     fontSize: 12.0);

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
}
