import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Skills extends StatefulWidget {
  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: [
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new CircularPercentIndicator(
                radius: 100.0,
                animation: true,
                animationDuration: 5000,
                lineWidth: 15.0,
                percent: 0.8,
                footer: new Text(
                  "VS Code",
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17.0, height: 2),
                ),
                center: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://i.ibb.co/hXCX8zD/icons8-vscode.png"))),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                backgroundColor: Colors.grey.shade300,
                progressColor: Colors.blue,
              ),
/////////////////////////////////////////////////////////////////////////////////
              new Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
              ),
/////////////////////////////////////////////////////////////////////////////////
              new CircularPercentIndicator(
                radius: 100.0,
                animation: true,
                animationDuration: 5000,
                lineWidth: 15.0,
                percent: 0.6,
                footer: new Text(
                  "Flutter",
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17.0, height: 2),
                ),
                center: Container(
                  height: 42,
                  width: 42,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://i.ibb.co/qD87PZ0/icons8-flutter.png"))),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                backgroundColor: Colors.grey.shade300,
                progressColor: Colors.blue[300],
              ),
/////////////////////////////////////////////////////////////////////////////////
              new Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
              ),
/////////////////////////////////////////////////////////////////////////////////
              new CircularPercentIndicator(
                radius: 100.0,
                animation: true,
                animationDuration: 5000,
                lineWidth: 15.0,
                percent: 0.4,
                footer: new Text(
                  "Firebase",
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17.0, height: 2),
                ),
                center: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://i.ibb.co/3StZvxP/icons8-firebase.png"))),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                backgroundColor: Colors.grey.shade300,
                progressColor: Colors.yellow[700],
              ),
            ],
          ),
////////////////////////////////////////////////////////////////////////////
          SizedBox(height: 30),
////////////////////////////////////////////////////////////////////////////
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new CircularPercentIndicator(
                radius: 100.0,
                animation: true,
                animationDuration: 5000,
                lineWidth: 15.0,
                percent: 0.8,
                footer: new Text(
                  "Photoshop",
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17.0, height: 2),
                ),
                center: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://i.ibb.co/smzHhX6/icons8-photoshop.png"))),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                backgroundColor: Colors.grey.shade300,
                progressColor: Colors.blueGrey[600],
              ),
              /////////////////////////////////////////////////////////////////////////////////
              new Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
              ),
/////////////////////////////////////////////////////////////////////////////////
              new CircularPercentIndicator(
                radius: 100.0,
                animation: true,
                animationDuration: 5000,
                lineWidth: 15.0,
                percent: 0.9,
                footer: new Text(
                  "MS Word",
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17.0, height: 2),
                ),
                center: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://i.ibb.co/56PP4yf/icons8-word.png"))),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                backgroundColor: Colors.grey.shade300,
                progressColor: Colors.blue[800],
              ),
            ],
          )
        ],
      ),
    );
  }
}
