import 'package:flutter/material.dart';

class LoadImageView extends StatelessWidget {
  const LoadImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Image'),
          centerTitle: true,
          elevation: 0,
        ),
        body: SafeArea(
            child: SizedBox(
          height: MediaQuery.of(context).size.height * .5,
          width: MediaQuery.of(context).size.width * .5,
          child: Image.asset(
            'assets/images/image1.jpg',
            fit: BoxFit.fill,
          ),
        )));
  }
}


// SingleChildScrollView(
        // child: Column(
        //   children: [
        //     Container(
        //       height: 300,
        //       width: double.infinity,
        //       child: Image.asset('assets/images/image2.jpeg'),
        //     ),
        //     Container(
        //       height: 300,
        //       width: double.infinity,
        //       child: Image.asset('assets/images/image1.jpg'),
        //     ),
        //     Container(
        //       height: 300,
        //       width: double.infinity,
        //       child: Image.asset('assets/images/image2.jpeg'),
        //     ),
        //     Container(
        //       height: 300,
        //       width: double.infinity,
        //       child: Image.asset('assets/images/image1.jpg'),
        //     ),
        //   ],
        // ),
      //),