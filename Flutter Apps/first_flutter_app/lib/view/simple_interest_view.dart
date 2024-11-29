import 'package:flutter/material.dart';

class SimpleInterestView extends StatefulWidget {
  const SimpleInterestView({super.key});

  @override
  State<SimpleInterestView> createState() => _SimpleInterestViewState();
}

class _SimpleInterestViewState extends State<SimpleInterestView> {
  final principalController = TextEditingController(text: '1000');
  final rateController = TextEditingController(text: '5');
  final timeController = TextEditingController(text: '2');
  double result = 0.0;

  final myKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Interest View'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: myKey,
          child: Column(
            children: [
              TextFormField(
                controller: principalController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Principal',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter principal';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: rateController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Rate',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter rate';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: timeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Time (years)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter time';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              Text(
                'Result: $result',
                style: const TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (myKey.currentState!.validate()) {
                      setState(() {
                        double principal = double.parse(principalController.text);
                        double rate = double.parse(rateController.text);
                        double time = double.parse(timeController.text);

                        result = (principal * rate * time) / 100;
                      });
                    }
                  },
                  child: const Text('Calculate Simple Interest'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
