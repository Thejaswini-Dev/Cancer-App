import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CancerTypes extends StatefulWidget {
  @override
  _CancerTypesState createState() => _CancerTypesState();
}

class _CancerTypesState extends State<CancerTypes> {
  Future getPost() async {
    var firestore = Firestore.instance;

    QuerySnapshot snap = await firestore.collection("itemOne").getDocuments();
    return snap.documents;
  }

  Future<Null> getRefres() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      getPost();
    });
  }

  List<MaterialColor> colorItems = [
    Colors.deepOrange,
    Colors.pink,
    Colors.purple,
    Colors.green,
    Colors.yellow
  ];

  MaterialColor colors;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text("Types of Cancer",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold))),
                      backgroundColor: Colors.red.withOpacity(1.0),
        ),
        body: FutureBuilder(
            future: getPost(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                return RefreshIndicator(
                  onRefresh: getRefres,
                  child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      var ourData = snapshot.data[index];
                      colors = colorItems[index % colorItems.length];
                      return Container(
                        height: 300.0,
                        margin: EdgeInsets.all(5.0),
                        child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: Image.network(
                                        ourData.data['img'],
                                        height: 200.0,
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                SizedBox(width: 10.0),
                                Expanded(
                                    flex: 2,
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(top: 10),
                                            child: Text(
                                              ourData.data['title'],
                                              maxLines: 1,
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                              right: 10,
                                            ),
                                            child: Text(ourData.data['litDes'],
                                                maxLines: 5,
                                                textAlign: TextAlign.justify,
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    color: Colors.black)),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                              right: 10,
                                            ),
                                            child: Text(
                                                'Month : ' +
                                                    ourData.data['month'],
                                                // maxLines: 5,
                                                textAlign: TextAlign.justify,
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.black)),
                                          ),
                                          Align(
                                              alignment: Alignment.bottomRight,
                                              child: InkWell(
                                                  onTap: () {
                                                    customDialog(
                                                        context,
                                                        ourData['img'],
                                                        ourData['title'],
                                                        ourData['des']);
                                                  },
                                                  child: Container(
                                                    margin: EdgeInsets.all(9.0),
                                                    padding:
                                                        EdgeInsets.all(10.0),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                        color: colors),
                                                    height: 40.0,
                                                    child: Text("View Details"),
                                                  )))
                                        ]))
                              ],
                            )),
                      );
                    },
                  ),
                );
              }
            }));
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
                  colors: [Colors.purple, Colors.deepOrange, Colors.green],
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
}
