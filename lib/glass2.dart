import 'dart:ui';
import 'package:flutter/material.dart';

class Glass2 extends StatefulWidget {
  const Glass2({Key? key}) : super(key: key);

  @override
  State<Glass2> createState() => _Glass2State();
}

class _Glass2State extends State<Glass2> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[300],
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1432847712612-926caafaa802?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80"),
                fit: BoxFit.cover)),
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
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: AnimatedContainer(
                  duration: const Duration(microseconds: 200),
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomCenter,
                            colors: [Colors.white60, Colors.white10]),
                        borderRadius: BorderRadius.circular(250),
                        border: Border.all(width: 2, color: Colors.white30),
                        color: Colors.white.withOpacity(isPressed ? 0.4 : 0.3),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 25,
                              spreadRadius: -5)
                        ]),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
