import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:port/skills.dart';
import 'package:url_launcher/url_launcher.dart';

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
  final double coverHeight = 210;
  final double profileHeight = 200;
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        buildTop(),
        buildContent(),
        Skills(),
        SizedBox(height: 40),
        buildBottomImage()
      ],
    ));
  }

/////////////////////////////////////////////////////////////////////////
////////////////////////////// Cover ////////////////////////////////////////
  ///
  Widget buildCoverImage() => Container(
        width: double.infinity,
        height: coverHeight,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(40.0),
              bottomLeft: Radius.circular(40.0),
            ),
            image: DecorationImage(
                image: AssetImage("assets/cover.jpg"), fit: BoxFit.fill)),
      );

////////////////////////////// Profile //////////////////////////////////////
  ///
  Widget buildProfileImage() => CircleAvatar(
        radius: profileHeight / 2.8,
        backgroundColor: Colors.grey.shade800,
        backgroundImage: AssetImage("assets/pic.png"),
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
                  filter: ImageFilter.blur(sigmaX: 6, sigmaY: 0.5),
                  child: AnimatedContainer(
                    duration: const Duration(microseconds: 200),
                    child: Container(
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomCenter,
                            colors: [Colors.white60, Colors.white30]),
                        borderRadius: BorderRadius.circular(250),
                        border: Border.all(width: 2, color: Colors.white12),
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
    List links1 = [
      "https://www.facebook.com/zaryabalam35",
      "https://github.com/ZaryabAlam",
      "https://twitter.com/zaryabalam",
      "https://www.linkedin.com/in/zaryab-alam-660b7a187/",
    ];

    List hpics = [
      "assets/tools.png",
      "assets/archery.png",
      "assets/love.png",
    ];
    List social = [
      "assets/facebook.png",
      "assets/github.png",
      "assets/twitter.png",
      "assets/linkedin.png",
    ];

    List<String> hobby = [
      "Sketching",
      "Target Practise",
      "Petting My Cats",
    ];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
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
////////////////////////////////////////////////////icons/////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              4,
              (index) {
                return Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    CircleAvatar(
                      radius: 25,
                      child: Material(
                        shape: CircleBorder(),
                        clipBehavior: Clip.hardEdge,
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () async {
                            dynamic url = links1[index];
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          child: Center(
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(social[index])),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
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
                  style: TextStyle(
                    fontSize: 18,
                    height: 1.8,
                  ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Hobbies",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (index) {
                      return Column(
                        children: [
                          SizedBox(
                            width: 100,
                          ),
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(hpics[index]))),
                          ),
                          Text(
                            hobby[index],
                            style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                height: 1.8),
                          )
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Skills",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

////////////////////////////// Bottom //////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
  Widget buildBottomImage() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          height: 250,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
              image: DecorationImage(
                  image: AssetImage("assets/cover.jpg"), fit: BoxFit.fill)),
        ),
        GestureDetector(
            onTapDown: (_) {
              setState(() => isPressed = true);
            },
            onTapUp: (_) {
              setState(() => isPressed = false);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                child: AnimatedContainer(
                  duration: const Duration(microseconds: 200),
                  child: Container(
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomCenter,
                          colors: [Colors.white60, Colors.white30]),
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(width: 2, color: Colors.white12),
                      color: Colors.white.withOpacity(isPressed ? 0.4 : 0.3),
                    ),
                  ),
                ),
              ),
            )),
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/qrcode.png"))),
        ),
        Positioned(
          bottom: 10,
          child: Column(
            children: [
              Text(
                "Scan for more!",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "All Rights Reserve 2022 © DevCat | Zaryab Alam",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w100),
              ),
            ],
          ),
        )
      ],
    );
  }
}
