import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NextPage extends StatelessWidget {

   const NextPage({
    Key key,
    this.title,
    this.des,
  }) : super(key: key);
  
  final String title;
  final String des;
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SingleChildScrollView(
   child:   Container(
          child: Padding(padding: EdgeInsets.all(15),
         child:  Text(
        des,
        textAlign: TextAlign.justify,
        style: TextStyle(fontSize: 16.0),
      )),
    )));
    ;
  }
}
