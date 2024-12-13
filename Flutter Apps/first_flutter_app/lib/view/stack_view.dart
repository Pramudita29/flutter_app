import 'package:flutter/material.dart';

class StackView extends StatelessWidget {
  const StackView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 400,
            width: 400,
            color: Colors.amber,
            child: const Text("I'm first container"),
          ),
          Positioned(
            top: 1,
            right: 1,
            child: Container(
              height: 100,
              width: 100,
              color: Colors.green,
              child: const Text("I'm second container"),
            ),
          ),
          Positioned(
            bottom: 1,
            left: 1,
            child: Container(
              height: 100,
              width: 100,
              color: Colors.blueGrey,
              child: const Text("I'm third container"),
            ),
          ),
          const Positioned(
            bottom: -50,
            right: 1,
            child: CircleAvatar(
              radius: 100.0,
              backgroundImage: AssetImage('assets/images/image1.jpg'),
            ),
            //   height: 100,
            //   width: 100,
            //   color: Colors.cyanAccent,
            //   child: const Text("I'm fourth container")
            // ),
          )
        ],
      )),
    );
  }
}
