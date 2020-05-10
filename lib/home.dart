import 'package:firestoreapp/information/food_information.dart';
import 'package:firestoreapp/pages/cancer.dart';
import 'package:firestoreapp/pages/cancer_types.dart';
import 'package:firestoreapp/pages/hospital_google_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeStatus createState() => _HomeStatus();
}

class _HomeStatus extends State<Home> {
  int _indexpage = 1;

  final pageOptions = [
    CancerTypes(),
    Cancer(),
    HospitalGoogleMap(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar:
      //     AppBar(title: Text("Cancer"), backgroundColor: Colors.deepOrange),
      drawer: Drawer(
          child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: null,
            accountName: Text("Cancer "),
            decoration: BoxDecoration(color: Colors.deepOrange),
           // currentAccountPicture: Image.asset("assets/images/beans.jpg", fit:BoxFit.fill,),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (c) => Cancer()));
            },
            title: Text(
              "Cancer",
              style: TextStyle(fontSize: 17.0, color: Colors.black),
            ),
            leading: Icon(Icons.home, color: Colors.black),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (c) => CancerTypes()));
            },
            title: Text(
              "Types of cancer",
              style: TextStyle(fontSize: 17.0, color: Colors.black),
            ),
            leading: Icon(Icons.more, color: Colors.black),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (c) => HospitalGoogleMap()));
            },
            title: Text(
              "Hospital",
              style: TextStyle(fontSize: 17.0, color: Colors.black),
            ),
            leading: Icon(Icons.photo, color: Colors.black),
          ),

           ListTile(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (c) => CancerFood()));
            },
            title: Text(
              "Cancer Food",
              style: TextStyle(fontSize: 17.0, color: Colors.black),
            ),
            leading: Icon(Icons.fastfood, color: Colors.black),
          ),
        ],
      )),
      body: pageOptions[_indexpage],
      bottomNavigationBar: CurvedNavigationBar(
          index: 1,
          color: Colors.red,
          buttonBackgroundColor: Colors.black,
          backgroundColor: Colors.yellow,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 300),
          items: <Widget>[
            Icon(Icons.poll, size: 15.0, color: Colors.white),
            Icon(Icons.home, size: 15.0, color: Colors.white),
            Icon(Icons.map, size: 15.0, color: Colors.white)
          ],
          onTap: (int index) {
            setState(() {
              _indexpage = index;
            });
          }),
    );
  }
}
