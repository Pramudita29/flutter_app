import 'package:class_assignment_2/cubit/volume_of_cylinder_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VolumeOfCylinderView extends StatelessWidget {
  const VolumeOfCylinderView({super.key});

  @override
  Widget build(BuildContext context) {
    final radiusController = TextEditingController();
    final heightController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pramudita Volume of Cylinder'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: radiusController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Radius',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Height',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final radius = double.tryParse(radiusController.text) ?? 0;
                final height = double.tryParse(heightController.text) ?? 0;

                context.read<VolumeOfCylinderCubit>().calculateVolume(radius, height);
              },
              child: const Text('Calculate Volume'),
            ),
            const SizedBox(height: 16),
            BlocBuilder<VolumeOfCylinderCubit, double>(
              builder: (context, volume) {
                return Text(
                  'Volume of Cylinder: $volume',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
