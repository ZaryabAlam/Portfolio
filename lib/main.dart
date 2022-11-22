import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:port/glass.dart';
import 'package:port/glass2.dart';
import 'dart:ui';

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
  final double profileHeight = 200;
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    final _h = MediaQuery.of(context).size.height;
    final _w = MediaQuery.of(context).size.width;

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
        radius: profileHeight / 2.8,
        backgroundColor: Colors.grey.shade800,
        backgroundImage: NetworkImage(
            "https://cdn-icons-png.flaticon.com/512/219/219988.png"),
      );

////////////////////////////// Top //////////////////////////////////////
  ///
  Widget buildTop() {
    final bottom1 = profileHeight / 3;
    final top1 = coverHeight - profileHeight / 2;
    final top2 = coverHeight - profileHeight / 1.7;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(bottom: bottom1), child: buildCoverImage()),
        Positioned(
          top: top2,
          child: GestureDetector(
              onTapDown: (_) {
                setState(() => isPressed = true);
              },
              onTapUp: (_) {
                setState(() => isPressed = false);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(250),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                  child: AnimatedContainer(
                    duration: const Duration(microseconds: 200),
                    child: Container(
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomCenter,
                            colors: [Colors.white60, Colors.white10]),
                        borderRadius: BorderRadius.circular(250),
                        border: Border.all(width: 2, color: Colors.white30),
                        color: Colors.white.withOpacity(isPressed ? 0.4 : 0.3),
                      ),
                    ),
                  ),
                ),
              )),
        ),
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
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildSocialIcon(FontAwesomeIcons.github),
              const SizedBox(width: 12),
              buildSocialIcon(FontAwesomeIcons.facebook),
              const SizedBox(width: 12),
              buildSocialIcon(FontAwesomeIcons.twitter),
              const SizedBox(width: 12),
              buildSocialIcon(FontAwesomeIcons.linkedin),
              const SizedBox(width: 12)
            ],
          ),
          Divider(),
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
                  height: 10,
                ),
                Text(
                  "Flutter Software Engineer, Techonology Enthusiast and Aviation Lover. Learning and practicing Flutter and Dart for developing responsive native mobile applications. ",
                  style: TextStyle(fontSize: 18, height: 1.8),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Hobbies",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "My hobbies happen to be portrait scretching, target practising and petting my cats. ",
                  style: TextStyle(fontSize: 18, height: 1.8),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Skills",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
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
  Widget buildSocialIcon(IconData icon) => CircleAvatar(
        radius: 25,
        child: Material(
          shape: CircleBorder(),
          clipBehavior: Clip.hardEdge,
          color: Colors.black,
          child: InkWell(
            onTap: () {},
            child: Center(
              child: Icon(
                icon,
                size: 32,
                color: Colors.orange[500],
              ),
            ),
          ),
        ),
      );
}
