import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class CancerInformation extends StatefulWidget {
  final String information;
  final String imgInformation;
  final String titleInformation;

  const CancerInformation(
      {Key key, this.information, this.imgInformation, this.titleInformation})
      : super(key: key);
  @override
  _CancerState createState() => _CancerState();
}

class _CancerState extends State<CancerInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cancer",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
         // padding: const EdgeInsets.all(8.0),
          child: Container(
        margin: EdgeInsets.only(bottom: 15),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            //first container

            Container(
              child: InkWell(
                onTap: () {},
                child: Image.network(
                  widget.imgInformation,
                  height: 200.0,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(height: 20.0),
            Divider(),
            Container(
              margin: EdgeInsets.all(10.0),
              child: Text(widget.titleInformation,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10),
            Divider(),
            Container(
              margin: EdgeInsets.all(20.0),
              child: Text(widget.information,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  )),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
