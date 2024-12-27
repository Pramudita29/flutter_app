import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';

class AreaOfCircleCubit extends Cubit<double> {
  AreaOfCircleCubit() : super(0);

  void calculateArea(double radius) {
    final area = pi * radius * radius;
    emit(area);
  }
}
