import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';

class VolumeOfCylinderCubit extends Cubit<double> {
  VolumeOfCylinderCubit() : super(0);

  void calculateVolume(double radius, double height) {
    final volume = pi * radius * radius * height;
    emit(volume);
  }
}
