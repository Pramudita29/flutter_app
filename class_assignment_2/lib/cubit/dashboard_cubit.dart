import 'package:class_assignment_2/cubit/area_of_circle_cubit.dart';
import 'package:class_assignment_2/cubit/dashboard_cubit.dart';
import 'package:class_assignment_2/cubit/simple_interest_cubit.dart';
import 'package:class_assignment_2/cubit/volume_of_cylinder_cubit.dart';
import 'package:class_assignment_2/view/Area_of_circle_cubit_view.dart';
import 'package:class_assignment_2/view/simple_interest_cubit_view.dart';
import 'package:class_assignment_2/view/volume_of_cylinder_cubit_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardCubit extends Cubit<void> {
  DashboardCubit(
    this._simpleInterestCubit,
    this._areaOfCircleCubit,
    this._volumeOfCylinderCubit,
  ) : super(null);

  final SimpleInterestCubit _simpleInterestCubit;
  final AreaOfCircleCubit _areaOfCircleCubit;
  final VolumeOfCylinderCubit _volumeOfCylinderCubit;

  void openSimpleInterestView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: _simpleInterestCubit,
          child: SimpleInterestView(),
        ),
      ),
    );
  }

  void openAreaOfCircleView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: _areaOfCircleCubit,
          child: AreaOfCircleView(),
        ),
      ),
    );
  }

  void openVolumeOfCylinderView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: _volumeOfCylinderCubit,
          child: VolumeOfCylinderView(),
        ),
      ),
    );
  }
}
