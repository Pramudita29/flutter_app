import 'package:flutter/material.dart';
 
class SnackBarView extends StatefulWidget {
  const SnackBarView({super.key});
 
  @override
  State<SnackBarView> createState() => _ShowSnackbarViewState();
}
 
class _ShowSnackbarViewState extends State<SnackBarView> {
  _showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: Colors.green,
      behavior: SnackBarBehavior.floating,
      content: Text("Hello"),
      duration: (Duration(seconds: 1)),
    ));
  }
 
  _showSnackBar1() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
      content: Text("Hello"),
      duration: (Duration(seconds: 1)),
    ));
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My first app'),
          centerTitle: true,
          elevation: 0,
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () => _showSnackBar(), child: const Text("Hello")),
              ElevatedButton(
                  onPressed: () => _showSnackBar1(),
                  child: const Text("Hello1")),
            ],
          ),
        ));
  }
}