import 'package:class_assignment_2/cubit/simple_interest_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleInterestView extends StatelessWidget {
  const SimpleInterestView({super.key});

  @override
  Widget build(BuildContext context) {
    final principalController = TextEditingController();
    final rateController = TextEditingController();
    final timeController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pramudita Simple Interest'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: principalController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Principal Amount',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: rateController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Rate of Interest',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: timeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Time (Years)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final principal = double.tryParse(principalController.text) ?? 0;
                final rate = double.tryParse(rateController.text) ?? 0;
                final time = double.tryParse(timeController.text) ?? 0;

                context.read<SimpleInterestCubit>().calculateSimpleInterest(
                      principal,
                      rate,
                      time,
                    );
              },
              child: const Text('Calculate'),
            ),
            const SizedBox(height: 16),
            BlocBuilder<SimpleInterestCubit, double>(
              builder: (context, interest) {
                return Text(
                  'Simple Interest: $interest',
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
