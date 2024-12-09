//import 'package:first_flutter_app/view/column_view.dart';
//import 'package:first_flutter_app/view/container_view.dart';
import 'package:first_flutter_app/view/flexible_expanded_view.dart';
import 'package:first_flutter_app/view/load_image_view.dart';
import 'package:first_flutter_app/view/show_snack_bar_view.dart';
import 'package:flutter/material.dart';
//import 'view/dashboard_view.dart'; // Import the Dashboard view

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'First Assignment',
      home: SnackBarView(), // Start with the Dashboard view
    );
  }
}
