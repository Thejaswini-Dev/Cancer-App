import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestoreapp/Cancer_information/cancer_information.dart';
import 'package:firestoreapp/pages/nextPage.dart';
import 'package:flutter/material.dart';

class Cancer extends StatefulWidget {
  @override
  _CancerState createState() => _CancerState();
}

class _CancerState extends State<Cancer> {
  Future getHomePost() async {
    var firestore = Firestore.instance;
    QuerySnapshot snap = await firestore.collection("HomeData").getDocuments();
    return snap.documents;
  }

  Future<Null> getRegresh() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      getHomePost();
    });
  }

  List<MaterialColor> colorItem = [
    Colors.deepOrange,
    Colors.blueGrey,
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.green,
    Colors.yellow,
    // Colors.black
  ];

  MaterialColor color;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Cancer",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        ),
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.grey,
      body: FutureBuilder(
          future: getHomePost(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return RefreshIndicator(
                onRefresh: getRegresh,
                child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    var ourData = snapshot.data[index];

                    color = colorItem[index % colorItem.length];
                    // return InkWell(
                    //   onTap: () {
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => NextPage(title: ourData['title'],des: ourData['des'],),
                    //             ));
                    //   },
                    // child: Container(
                    //   // color: Colors.white,
                    //   height: 210.0,
                    //   margin: EdgeInsets.all(10),
                    //   child: Center(
                    //       child: Text(ourData.data["title"],
                    //           style: TextStyle(
                    //               fontSize: 24.0,
                    //               color: Colors.black,
                    //               fontWeight: FontWeight.bold))),
                    //   decoration: BoxDecoration(
                    //       image: DecorationImage(
                    //     fit: BoxFit.fill,
                    //     image: NetworkImage(
                    //       ourData.data['image'],
                    //     ),
                    //   )),
                    // ),
                    return Container(
                        margin: EdgeInsets.only(bottom: 15),
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            //first container

                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                      child: Row(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.all(5.0),
                                        child: CircleAvatar(
                                          child: Text(
                                            ourData.data["title"][0],
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(fontSize: 20.0),
                                          ),
                                          backgroundColor: color,
                                        ),
                                      ),
                                      SizedBox(width: 5.0),
                                      Container(
                                        child: Text(
                                            ourData.data["title"].toString(),
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ],
                                  )),
                                  Container(
                                      margin: EdgeInsets.only(right: 20.0),
                                      child: InkWell(
                                        onTap: () {
                                          customDialog(
                                              context,
                                              ourData['image'],
                                              ourData['title'],
                                              ourData['des']);
                                        },
                                        child: Icon(
                                          Icons.more_horiz,
                                          size: 30.0,
                                        ),
                                      ))
                                ],
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              margin: EdgeInsets.all(10.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CancerInformation(
                                                  imgInformation: ourData
                                                      .data['imgInformation'],
                                                      information: ourData.data['information'],
                                                      titleInformation: ourData.data['title'],
                                                )));
                                  },
                                  child: Image.network(
                                    ourData.data['image'],
                                    height: 200.0,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Container(
                              margin: EdgeInsets.all(10.0),
                              child: Text(ourData.data['litdes'],
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16.0)),
                            ),
                          ],
                        ));
                  },
                ),
              );
            }
          }),
    );
  }
}

customDialog(BuildContext context, String img, String title, String des) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height / 1.2,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.deepOrange, Colors.green],
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 150.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.network(
                        img,
                        height: 150.0,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      title.toUpperCase(),
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      des,
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
