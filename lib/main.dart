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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Text("Portfolio")],
      ),
    );
  }
}
