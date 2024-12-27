// Updated dashboard_cubit_view.dart
import 'package:class_assignment_2/cubit/dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pramudita Dashboard'),
        centerTitle: true,
      ),
      body: GridView(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        children: <Widget>[
          Card(
            elevation: 4,
            child: InkWell(
              onTap: () => context
                  .read<DashboardCubit>()
                  .openSimpleInterestView(context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Icon(Icons.add, size: 48, color: Colors.blue),
                  SizedBox(height: 8),
                  Text('Simple Interest',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          ),
          Card(
            elevation: 4,
            child: InkWell(
              onTap: () =>
                  context.read<DashboardCubit>().openAreaOfCircleView(context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Icon(Icons.circle, size: 48, color: Colors.green),
                  SizedBox(height: 8),
                  Text('Area of Circle',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          ),
          Card(
            elevation: 4,
            child: InkWell(
              onTap: () => context
                  .read<DashboardCubit>()
                  .openVolumeOfCylinderView(context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Icon(Icons.dashboard_customize,
                      size: 48, color: Colors.orange),
                  SizedBox(height: 8),
                  Text('Volume of Cylinder',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
