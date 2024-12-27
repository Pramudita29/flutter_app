// Updated dashboard_cubit.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DashboardCubit extends Cubit<void> {
  DashboardCubit() : super(null);

  void openSimpleInterestView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const SimpleInterestView()),
    );
  }

  void openAreaOfCircleView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const AreaOfCircleView()),
    );
  }

  void openWishUIView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const WishUIView()),
    );
  }
}
