import 'package:flutter/material.dart';

class StackImageView extends StatelessWidget {
  const StackImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 600,
            width: 600,
            color: Colors.amber,
            child: SizedBox(child: Image.asset('assets/images/image2.jpeg')
            ),
          )
        ],
      )),
    );
  }
}
