import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterOverlay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FilterOverlayState();
}

class FilterOverlayState extends State<FilterOverlay>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  RangeValues values = RangeValues(5000, 105000);
  RangeLabels labels = RangeLabels('5000', '105000');
  int _value = 1;
  List<String> options = <String>[
    'Select Your Location',
    'India',
    'USA',
    'Europe'
  ];
  String dropdownValue = 'Select Your Location';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.all(5.0),
            width: size.width * 0.8,
            height: size.height * 0.6,
            decoration: ShapeDecoration(
                color: Colors.white,
                //color: Color.fromRGBO(41, 167, 77, 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0))),
            child: Column(
              children: <Widget>[
                Container(
                  padding: new EdgeInsets.only(top: 5, left: 8, right: 8),
                  child: Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: new Text(
                          "Price",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  //padding: new EdgeInsets.only(left: 8, right: 8),
                  child: new RangeSlider(
                    min: 5000,
                    max: 105000,
                    values: values,
                    divisions: 5,
                    activeColor: Colors.greenAccent[400],
                    labels: labels,
                    onChanged: (value) {
                      print('START: ${value.start}, END: ${value.end}');
                      setState(() {
                        values = value;

                        labels = RangeLabels(
                            '${value.start.toInt().toString()}\$',
                            '${value.end.toInt().toString()}\$');
                      });
                    },
                  ),
                ),
                Align(
                    alignment: Alignment.topLeft,

                    //padding: new EdgeInsets.only(left: 8, right: 8),
                    child: Padding(
                      padding: new EdgeInsets.only(left: 8, right: 8),
                      child: Row(
                        children: [
                          new Text(
                            '\$ 5,000',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.greenAccent[400],
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                              fontFamily: "OpenSans",
                            ),
                          ),
                          Spacer(),
                          new Text(
                            '\$ 105,000',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.greenAccent[400],
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                              fontFamily: "OpenSans",
                            ),
                          ),
                        ],
                      ),
                    )),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 5.0, left: 10.0, right: 5.0),
                    child: Text(
                      "Categories",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 5.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //mainAxisAlignment: MainAxisAlignment.center,
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
                                color: Colors.grey,
                                width: 1,
                                style: BorderStyle.solid),
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
                                color: Colors.grey,
                                width: 1,
                                style: BorderStyle.solid),
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
                                color: Colors.grey,
                                width: 1,
                                style: BorderStyle.solid),
                          ),
                        ),
                        //Spacer(),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 5.0),
                    child: Row(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          onPressed: () {},
                          //color: Colors.blue,
                          minWidth: 0,
                          height: 28,
                          padding: EdgeInsets.all(5),
                          child: Text(
                            'Arts & Entertainments',
                            style: TextStyle(
                                color: Colors.blue[900],
                                fontSize: 14,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.w600),
                          ),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            side: BorderSide(
                                color: Colors.grey,
                                width: 1,
                                style: BorderStyle.solid),
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
                            'Hotels',
                            style: TextStyle(
                                color: Colors.blue[900],
                                fontSize: 14,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.w600),
                          ),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            side: BorderSide(
                                color: Colors.grey,
                                width: 1,
                                style: BorderStyle.solid),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 5.0, left: 10.0, right: 5.0),
                    child: Text(
                      "Location",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  //padding: EdgeInsets.all(4.0),
                  child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, left: 10.0, right: 10.0),
                      child: Container(
                         padding: const EdgeInsets.only(
                          top: 0.0, left: 10.0, right: 10.0),
                        height: 30,
                        width: size.width * 0.7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          // border: Border(
                          //   left: BorderSide(
                          //     color: Colors.green,
                          //     width: 3,
                          //   ),
                          // ),

                          color: Colors.white,
                          border: Border.all( color: Colors.grey[300],),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            icon: Image.asset(
                              "images/down_arrow.png",
                              color: Colors.greenAccent[400],
                              height: 16,
                              width: 16,
                            ),
                            iconSize: 10,
                            elevation: 16,
                            style: TextStyle(
                                color: Colors.blue[900],
                                fontSize: 14.0,
                                fontFamily: "OpenSans",
                                fontWeight: FontWeight.w600),
                            underline: Container(height: 2, color: Colors.grey),
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValue = newValue;
                              });
                            },
                            items: <String>[
                              'Select Your Location',
                              'India',
                              'USA',
                              'Europe'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      )
                      // child: DropdownButton(
                      //   value: _value,
                      //   items: [
                      //     DropdownMenuItem(

                      //       child: Text(
                      //         "Select Your Location",
                      //         textAlign: TextAlign.left,
                      //         style: TextStyle(
                      //             color: Colors.black,
                      //             fontSize: 14.0,
                      //             fontFamily: "OpenSans",
                      //             fontWeight: FontWeight.w600),
                      //       ),
                      //       value: 1,
                      //     ),
                      //     DropdownMenuItem(
                      //       child: Text(
                      //         "Kolkata",
                      //         textAlign: TextAlign.left,
                      //         style: TextStyle(
                      //             color: Colors.black,
                      //             fontSize: 14.0,
                      //             fontFamily: "OpenSans",
                      //             fontWeight: FontWeight.w600),
                      //       ),
                      //       value: 2,
                      //     ),
                      //     DropdownMenuItem(
                      //       child: Text(
                      //         "USA",
                      //         textAlign: TextAlign.left,
                      //         style: TextStyle(
                      //             color: Colors.black,
                      //             fontSize: 14.0,
                      //             fontFamily: "OpenSans",
                      //             fontWeight: FontWeight.w600),
                      //       ),
                      //       value: 3,
                      //     ),
                      //     DropdownMenuItem(
                      //         child: Text(
                      //           "America",
                      //           textAlign: TextAlign.left,
                      //           style: TextStyle(
                      //               color: Colors.black,
                      //               fontSize: 14.0,
                      //               fontFamily: "OpenSans",
                      //               fontWeight: FontWeight.w600),
                      //         ),
                      //         value: 4)
                      //   ],
                      //   onChanged: (value) {
                      //     setState(() {
                      //       _value = value;
                      //     });
                      //   },
                      // ),

                      // child: DropdownButton<String>(
                      //   value: dropdownValue,
                      //   onChanged: (String newValue) {
                      //     setState(() {
                      //       dropdownValue = newValue;
                      //     });
                      //   },
                      //   style: TextStyle(
                      //       color: Colors.black,
                      //       fontSize: 14.0,
                      //       fontFamily: "OpenSans",
                      //       fontWeight: FontWeight.w600),
                      //   selectedItemBuilder: (BuildContext context) {
                      //     return options.map((String value) {
                      //       return Text(
                      //         dropdownValue,
                      //         style: TextStyle(color: Colors.black),
                      //       );
                      //     }).toList();
                      //   },
                      //   items: options.map<DropdownMenuItem<String>>(
                      //     (String value) {
                      //       return DropdownMenuItem<String>(
                      //         value: value,
                      //         child: Text(value),
                      //       );
                      //     },
                      //   ).toList(),
                      // ),
                      ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, left: 10.0, right: 5.0),
                    child: MaterialButton(
                      onPressed: () {},
                      color: Colors.greenAccent[400],
                      minWidth: 0,
                      height: 24,
                      padding: EdgeInsets.fromLTRB(5, 4, 5, 4),

                      //padding: EdgeInsets.all(0),
                      child: Text(
                        'SUBMIT',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
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
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
