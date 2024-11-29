import 'package:flutter/material.dart';

class AreaOfCircleView extends StatefulWidget {
  const AreaOfCircleView({super.key});

  @override
  State<AreaOfCircleView> createState() => _AreaOfCircleViewState();
}

class _AreaOfCircleViewState extends State<AreaOfCircleView> {
  final radiusController = TextEditingController(text: '5');
  double result = 0.0;

  final myKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Area of Circle View'),
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
                controller: radiusController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Radius',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter radius';
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
                        double radius = double.parse(radiusController.text);
                        result = 3.14159 * radius * radius;
                      });
                    }
                  },
                  child: const Text('Calculate Area of Circle'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
