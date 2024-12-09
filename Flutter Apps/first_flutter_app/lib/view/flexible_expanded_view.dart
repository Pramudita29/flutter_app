import 'package:flutter/material.dart';

class FlexibleExpandedView extends StatelessWidget {
  const FlexibleExpandedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.red,
              //height: 400,
              width: double.infinity,
            ),
          ),
          Expanded(
            flex: 3,
            //Flexfit.tight ko shortcut Expanded ho.
            child: Container(
              color: Colors.yellow,
              // height: 200,
              width: double.infinity,
            ),
          )
        ],
      ),
    );
  }
}
