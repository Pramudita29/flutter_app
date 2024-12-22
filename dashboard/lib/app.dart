import 'package:dashboard/view/dashboard_screen.dart';
import 'package:flutter/material.dart';

// import 'view/HomePage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
    );
  }
}
