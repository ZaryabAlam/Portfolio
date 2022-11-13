import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        body: Port(),
      ),
    );
  }
}

class Port extends StatefulWidget {
  @override
  State<Port> createState() => _PortState();
}

class _PortState extends State<Port> {
  final double coverHeight = 280;
  final double profileHeight = 144;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.zero,
      children: [
        buildTop(),
        buildContent(),
      ],
    ));
  }

////////////////////////////// Cover ////////////////////////////////////////
  ///
  Widget buildCoverImage() => Container(
        color: Colors.grey,
        child: Image.asset(
          "cover.jpg",
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.fill,
        ),
      );

////////////////////////////// Profile //////////////////////////////////////
  ///
  Widget buildProfileImage() => CircleAvatar(
        radius: profileHeight / 2,
        backgroundColor: Colors.grey.shade800,
        backgroundImage: NetworkImage(
            "https://cdn-icons-png.flaticon.com/512/219/219988.png"),
      );

////////////////////////////// Top //////////////////////////////////////
  ///
  Widget buildTop() {
    final top1 = coverHeight - profileHeight / 2;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        buildCoverImage(),
        Positioned(top: top1, child: buildProfileImage()),
      ],
    );
  }

////////////////////////////// Content //////////////////////////////////////
  ///
  Widget buildContent() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Zaryab Alam",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Text(
                "Flutter Software Engineer",
                style: TextStyle(
                    fontSize: 18, height: 1.8, fontWeight: FontWeight.w100),
              ),
            ],
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "About",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Flutter Software Engineer, Techonology Enthusiast and Aviation Lover. Learning and practicing Flutter and Dart for developing responsive native mobile applications.\nMy hobbies happen to be portrait scretching, target practising and petting my cats. ",
                  style: TextStyle(fontSize: 18, height: 1.8),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

////////////////////////////// Content //////////////////////////////////////
  ///
}
