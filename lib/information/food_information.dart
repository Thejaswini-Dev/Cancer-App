import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CancerFood extends StatefulWidget {
  @override
  _CancerFoodState createState() => _CancerFoodState();
}

class _CancerFoodState extends State<CancerFood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text("Cancer Protective Foods",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold))),
          backgroundColor: Colors.red.withOpacity(1.0),
        ),
        body: Padding(
            padding: EdgeInsets.all(15),
            child: ListView(
              children: <Widget>[
                Image.asset(
                  "assets/images/cancerfood.jpg",
                  height: 200,
                  fit: BoxFit.fill,
                ),
                Divider(),
                Center(
                  child: Text(
                    "Cancer Protective Foods",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Divider(),
                commonfood("Brocolli", "assets/images/broccoli.jpg",
                    "Broccoli contains sulforaphane, a plant compound found in cruciferous vegetables that may have potent anticancer properties.One test-tube study showed that sulforaphane reduced the size and number of breast cancer cells by up to 75% .Similarly, an animal study found that treating mice with sulforaphane helped kill off prostate cancer cells and reduced tumor volume by more than 50% .Some studies have also found that a higher intake of cruciferous vegetables like broccoli may be linked to a lower risk of colorectal cancer."),
                SizedBox(height: 10),
                Divider(),
                SizedBox(height: 15),
                commonfood("Carrots", "assets/images/carrots.jpg",
                    "Several studies have found that eating more carrots is linked to a decreased risk of certain types of cancer. For example, an analysis looked at the results of five studies and concluded that eating carrots may reduce the risk of stomach cancer by up to 26%.Another study found that a higher intake of carrots was associated with 18% lower odds of developing prostate cancer.One study analyzed the diets of 1,266 participants with and without lung cancer. It found that current smokers who did not eat carrots were three times as likely to develop lung cancer, compared to those who ate carrots more than once per week."),
                SizedBox(height: 10),
                Divider(),
                SizedBox(height: 15),
                commonfood("Beans", "assets/images/beans.jpg",
                    "Beans are high in fiber, which some studies have found may help protect against colorectal cancer. One study followed 1,905 people with a history of colorectal tumors, and found that those who consumed more cooked, dried beans tended to have a decreased risk of tumor recurrence. An animal study also found that feeding rats black beans or navy beans and then inducing colon cancer blocked the development of cancer cells by up to 75%")
              ],
            )));
  }
}

Widget commonfood(String title, String image, String information) {
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(left: 12, bottom: 20),
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            )),
        Center(
          child: Image.asset(
            image,
            height: 150,
          ),
        ),
        SizedBox(height: 15),
        Text(
          information,
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 16),
        )
      ]);
}
