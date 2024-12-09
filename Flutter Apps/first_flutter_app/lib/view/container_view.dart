import 'package:flutter/material.dart';

class ContainerView extends StatelessWidget {
  const ContainerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
          child: Center(
        child: Container(
          width: 200,
          height: 200,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.limeAccent,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black,
                width: 2,
              )),
          child: const Text("I'm  a container"),
        ),
      )),
    );
  }
}
