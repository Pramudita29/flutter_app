import 'package:flutter/material.dart';

class ColumnView extends StatelessWidget {
  const ColumnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Column View'),
        ),
        body: Container(
          width: double.infinity,
          color: Colors.yellow,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(onPressed: () {}, child: const Text('Button1')),
              ElevatedButton(onPressed: () {}, child: const Text('Button2')),
              ElevatedButton(onPressed: () {}, child: const Text('Button3')),
            ],
          ),
        ));
  }
}
