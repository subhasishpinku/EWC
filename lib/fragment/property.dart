import 'dart:convert';

import 'package:EWC/controller/properties_helper.dart';
import 'package:EWC/drawerpage/appbaricon.dart';
import 'package:EWC/drawerpage/navigationDrawer.dart';
import 'package:EWC/fragment/favourite_property.dart';
import 'package:EWC/fragment/property_details.dart';
import 'package:EWC/models/messages.dart';
import 'package:EWC/models/propertyitem.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:imagebutton/imagebutton.dart';
import 'package:http/http.dart' as http;

import 'filter_overlay.dart';

class propertyPage extends StatefulWidget {
  static const String routeName = '/propertyPage';

  @override
  _propertyPageState createState() => _propertyPageState();
}

List<Propertyitem> data;

class _propertyPageState extends State<propertyPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: navigationDrawer(),
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "Property List",
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
      body: Column(
        children: [
          Container(
            padding: new EdgeInsets.only(left: 16.0, right: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () {},
                  //color: Colors.blue,
                  minWidth: 0,
                  height: 28,
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Restaurants',
                    style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 14,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w600),
                  ),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                    side: BorderSide(
                        color: Colors.grey, width: 1, style: BorderStyle.solid),
                  ),
                ),
                //Spacer(),
                SizedBox(
                  width: 4,
                ),
                MaterialButton(
                  onPressed: () {},
                  //color: Colors.blue,
                  minWidth: 50,
                  height: 28,
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Bar',
                    style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 14,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w600),
                  ),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                    side: BorderSide(
                        color: Colors.grey, width: 1, style: BorderStyle.solid),
                  ),
                ),
                SizedBox(
                  width: 4,
                ),

                //Spacer(),
                MaterialButton(
                  onPressed: () {},
                  //color: Colors.blue,
                  minWidth: 0,
                  height: 28,
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Night Clubs',
                    style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 14,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w600),
                  ),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                    side: BorderSide(
                        color: Colors.grey, width: 1, style: BorderStyle.solid),
                  ),
                ),
                Spacer(),
                MaterialButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => FilterOverlay(),
                    );
                  },
                  color: Colors.greenAccent[400],
                  minWidth: 0,
                  height: 28,
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Filters',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w600),
                  ),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                    side: BorderSide(
                        color: Colors.greenAccent[400],
                        width: 1,
                        style: BorderStyle.solid),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 6,
            color: Colors.black,
          ),
          Padding(
            padding:
                new EdgeInsets.only(left: 10.0, right: 10.0, top: 5, bottom: 5),
            child: Container(
              height: 40,
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextFormField(
                  style: new TextStyle(color: Colors.black),
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    suffixIcon: Container(
                      // transform: Matrix4.translationValues(-10.0, 0.0, 0.0),
                      padding: const EdgeInsetsDirectional.only(start: 12.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.blue[900],
                        size: 30.0,
                      ), // icon is 48px widget.
                    ),
                    // prefixIcon: Icon(
                    //   Icons.search,
                    //   color: Colors.grey,
                    //   size: 30.0,
                    // ),
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.grey[200]),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 16.0),
                    hintText: 'Search',
                  ),
                ),
              ),
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          //   child: Align(
          //     alignment: Alignment.centerLeft,
          //     child: new Text(data.length.toString()+" results found",

          //       textAlign: TextAlign.left,
          //       style: TextStyle(
          //         fontSize: 12.0,
          //         color: Colors.black,
          //         fontWeight: FontWeight.w600,
          //         letterSpacing: 0.5,
          //         fontFamily: "OpenSans",
          //       ),
          //     ),
          //   ),
          // ),
          Expanded(
            child: propertyData(),
            // child: ListView(
            //   children: [
            //     blogList(context),
            //     blogList(context),
            //     blogList(context),
            //     blogList(context),
            //     blogList(context),
            //   ],
            // ),
          )
        ],
      ),
    );
  }

  FutureBuilder propertyData() {
    return FutureBuilder<List<Propertyitem>>(
      future: GetProperty().getProperties(),
      builder:
          (BuildContext context, AsyncSnapshot<List<Propertyitem>> snapshot) {
        if (snapshot.hasData) {
          data = snapshot.data;

          if (data.length > 0) {
            return _listProperty(data);
          } else {
            return Center(
                child: Text(
              "No Properties List Found",
            ));
          }
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Image(
          //fit: BoxFit.cover,
          image: AssetImage('images/rolling_loader.gif'),
          width: 50,
          height: 50,
        );
      },
    );
  }

  ListView _listProperty(data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) =>
          buildPropertyCard(context, index),
    );
  }

  buildPropertyCard(BuildContext context, int index) {
    return Card(
      margin: EdgeInsets.all(6),
      elevation: 3.0,
      color: Colors.indigo[50],
      child: Padding(
        padding: EdgeInsets.all(0.0),

        //padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Material(
          //elevation: 1.0,
          color: Colors.transparent,

          borderRadius: BorderRadius.circular(10.0),
          child: new GestureDetector(
            onTap: () {
              //print("Container clicked");
              String propertyId = data[index].propertiesid;
              String propertiesName = data[index].propertiesname;
              String propertiesLocation = data[index].propertieslocation;
              String propertiesDescription = data[index].propertiesdescription;
              String propertiesPrice = data[index].propertiesprice;
              String propertiesImage = data[index].propertiesimage;
              String statusFav = data[index].statusfav;
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (BuildContext context) => new PropertyDetailsPage(
                      propertyId,
                      propertiesName,
                      propertiesLocation,
                      propertiesDescription,
                      propertiesPrice,
                      propertiesImage,
                      statusFav),
                ),
              );

              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => PropertyDetailsPage()),
              // );
            },
            child: Container(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Material(
                          elevation: 0.2,
                          // borderRadius: BorderRadius.all(Radius.elliptical(50.0, 50.0)),
                          child: Container(
                            width: 100.0,
                            height: 100.0,
                            child: FadeInImage.assetNetwork(
                              placeholder: 'images/img_loader.gif',
                              image: data[index].propertiesimage,
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
                        ),
                      ),
                      Container(
                        //padding: new EdgeInsets.only(left: 8.0),
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            new Text(
                              "\$" + data[index].propertiesprice + " AUD",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.blue[900],
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5,
                                fontFamily: "OpenSans",
                              ),
                            ),
                            new Text(
                              data[index].propertieslocation,
                              style: TextStyle(
                                fontSize: 8.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5,
                                fontFamily: "OpenSans",
                              ),
                            ),
                            SizedBox(height: 5),
                            new Text(
                              data[index].propertiesdescription,
                              style: TextStyle(
                                fontSize: 8.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5,
                                fontFamily: "OpenSans",
                              ),
                            ),
                            new Text(
                              '436 Sqft',
                              style: TextStyle(
                                fontSize: 8.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5,
                                fontFamily: "OpenSans",
                              ),
                            ),
                            new Text(
                              'Ownership',
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
                      Spacer(),
                      Container(
                        //color: Colors.pink,
                        height: 120.0,
                        width: 50,
                        child: Stack(
                          children: [
                            Positioned(
                              // top: 5,
                              right: 5,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    height: 27,
                                    width: 30,
                                    child: IconButton(
                                      iconSize: 15,
                                      onPressed: () {
                                        //fetchAdd(otp, password);
                                        setState(() {
                                          // data[index].statusfav =
                                          //     data[index].statusfav == "0"
                                          //         ? "1"
                                          //         : "0";
                                          if (data[index].statusfav == "1") {
                                            //loadProgress();
                                            addToWishList(
                                                data[index].propertiesid, "0");
                                            // Fluttertoast.showToast(
                                            //     msg: "0",
                                            //     toastLength: Toast.LENGTH_SHORT,
                                            //     gravity: ToastGravity.BOTTOM,
                                            //     timeInSecForIosWeb: 1,
                                            //     backgroundColor: Colors.black,
                                            //     textColor: Colors.white,
                                            //     fontSize: 12.0);
                                          } else {
                                            // Fluttertoast.showToast(
                                            //   msg: "1",
                                            //   toastLength: Toast.LENGTH_SHORT,
                                            //   gravity: ToastGravity.BOTTOM,
                                            //   timeInSecForIosWeb: 1,
                                            //   backgroundColor: Colors.black,
                                            //   textColor: Colors.white,
                                            //   fontSize: 12.0);
                                            addToWishList(
                                                data[index].propertiesid, "1");
                                          }
                                        });
                                      },
                                      icon: data[index].statusfav == "0"
                                          ? Icon(Icons.favorite_border,
                                              color: Colors.blue[900], size: 20)
                                          : Icon(Icons.favorite,
                                              color: Colors.red[300], size: 20),
                                    ),
                                  ),

                                  SizedBox(width: 5),
                                  CupertinoButton(
                                    minSize: double.minPositive,
                                    padding: EdgeInsets.zero,
                                    child: Image.asset(
                                      "images/shield.png",
                                      color: Colors.greenAccent[400],
                                      height: 18,
                                      width: 16,
                                    ),
                                    onPressed: () {},
                                  ),
                                  // SizedBox(
                                  //   height: 30,
                                  //   //width: 30,
                                  //   child:
                                  // ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: -13,
                              right: 0,
                              child: MaterialButton(
                                onPressed: () {},
                                color: Colors.blue[900],
                                minWidth: 50,
                                height: 20,
                                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),

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
                                  borderRadius: new BorderRadius.only(
                                      topLeft: Radius.circular(8.0),
                                      bottomRight: Radius.circular(8.0)),
                                  side: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                      style: BorderStyle.solid),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // bool visible = true;
  // loadProgress() {
  //   if (visible == true) {
  //     setState(() {
  //       visible = false;
  //     });
  //   } else {
  //     setState(() {
  //       visible = true;
  //     });
  //   }
  // }

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
      //loadProgress();
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
// Widget blogPropertyList(BuildContext context, int index) {
//   return Padding(
//     padding: EdgeInsets.all(10.0),

//     //padding: EdgeInsets.only(left: 10.0, right: 10.0),
//     child: Material(
//       color: Colors.indigo[50],
//       elevation: 1.0,
//       borderRadius: BorderRadius.circular(15.0),
//       child: new GestureDetector(
//         onTap: () {
//           //print("Container clicked");
//           String propertyId = "propertiesid";
//           Navigator.push(
//               context,
//               new MaterialPageRoute(
//                   builder: (BuildContext context) =>
//                       new PropertyDetailsPage(propertyId)));
//           // Navigator.push(
//           //   context,
//           //   MaterialPageRoute(builder: (context) => PropertyDetailsPage()),
//           // );
//         },
//         child: Container(
//           child: Column(
//             children: <Widget>[
//               Row(
//                 children: <Widget>[
//                   Padding(
//                     padding: EdgeInsets.all(10),
//                     child: Material(
//                       elevation: 0.2,
//                       // borderRadius: BorderRadius.all(Radius.elliptical(50.0, 50.0)),
//                       child: Container(
//                         width: 100.0,
//                         height: 100.0,
//                         child: Image(
//                           fit: BoxFit.cover,
//                           image: AssetImage('images/house.jpg'),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     //padding: new EdgeInsets.only(left: 8.0),
//                     child: new Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: <Widget>[
//                         new Text(
//                           "\$ 50,000 AUD",
//                           textAlign: TextAlign.left,
//                           style: TextStyle(
//                             fontSize: 16.0,
//                             color: Colors.blue[900],
//                             fontWeight: FontWeight.w600,
//                             letterSpacing: 0.5,
//                             fontFamily: "OpenSans",
//                           ),
//                         ),
//                         new Text(
//                           'Sec 4, Salt Lake City, Kolkata',
//                           style: TextStyle(
//                             fontSize: 8.0,
//                             color: Colors.black,
//                             fontWeight: FontWeight.w600,
//                             letterSpacing: 0.5,
//                             fontFamily: "OpenSans",
//                           ),
//                         ),
//                         SizedBox(height: 5),
//                         new Text(
//                           '4 BHK/Flat, House/Villa',
//                           style: TextStyle(
//                             fontSize: 8.0,
//                             color: Colors.black,
//                             fontWeight: FontWeight.w600,
//                             letterSpacing: 0.5,
//                             fontFamily: "OpenSans",
//                           ),
//                         ),
//                         new Text(
//                           '436 Sqft',
//                           style: TextStyle(
//                             fontSize: 8.0,
//                             color: Colors.black,
//                             fontWeight: FontWeight.w600,
//                             letterSpacing: 0.5,
//                             fontFamily: "OpenSans",
//                           ),
//                         ),
//                         new Text(
//                           'Ownership',
//                           style: TextStyle(
//                             fontSize: 8.0,
//                             color: Colors.black,
//                             fontWeight: FontWeight.w600,
//                             letterSpacing: 0.5,
//                             fontFamily: "OpenSans",
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Spacer(),
//                   Container(
//                     //color: Colors.pink,
//                     height: 120.0,
//                     width: 50,
//                     child: Stack(
//                       children: [
//                         Positioned(
//                           top: 5,
//                           right: 5,
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
//                               CupertinoButton(
//                                 minSize: double.minPositive,
//                                 padding: EdgeInsets.zero,
//                                 child: Icon(Icons.favorite_border,
//                                     color: Colors.blue[900], size: 20),
//                                 onPressed: () {},
//                               ),
//                               SizedBox(width: 5),
//                               CupertinoButton(
//                                 minSize: double.minPositive,
//                                 padding: EdgeInsets.zero,
//                                 child: Image.asset(
//                                   "images/shield.png",
//                                   color: Colors.greenAccent[400],
//                                   height: 18,
//                                   width: 16,
//                                 ),
//                                 onPressed: () {},
//                               ),
//                             ],
//                           ),
//                         ),
//                         Positioned(
//                           bottom: -13,
//                           right: 0,

//                           child: MaterialButton(
//                             onPressed: () {},
//                             color: Colors.blue[900],
//                             minWidth: 50,
//                             height: 20,
//                             padding: EdgeInsets.fromLTRB(5, 5, 5, 5),

//                             //padding: EdgeInsets.all(0),
//                             child: Text(
//                               'Hold',
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 10,
//                                   fontFamily: 'OpenSans',
//                                   fontWeight: FontWeight.w600),
//                             ),
//                             shape: new RoundedRectangleBorder(
//                               borderRadius: new BorderRadius.only(
//                                   topLeft: Radius.circular(8.0),
//                                   bottomRight: Radius.circular(8.0)),
//                               side: BorderSide(
//                                   color: Colors.transparent,
//                                   width: 1,
//                                   style: BorderStyle.solid),
//                             ),
//                           ),

//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }
