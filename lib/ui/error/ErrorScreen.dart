import 'package:flutter/material.dart';

class Errorscreen extends StatefulWidget {
  const Errorscreen({super.key});

  @override
  State<Errorscreen> createState() => _ErrorscreenState();
}

class _ErrorscreenState extends State<Errorscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Error"),),
    );
  }
}
