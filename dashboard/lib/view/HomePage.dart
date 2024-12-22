import 'package:dashboard/view/BillScreen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedDestination;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  int _numPassengers = 1;

  final _destinations = {
    'Chitwan': 700,
    'Pokhara': 900,
    'Kathmandu': 1500,
  };

  void _pickDate() async {
    DateTime today = DateTime.now();
    DateTime firstDate = today;
    DateTime lastDate = today.add(const Duration(days: 7));

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: firstDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _proceedToBooking() {
    if (_formKey.currentState!.validate()) {
      int farePerPassenger = _destinations[_selectedDestination]!;
      int totalFare = farePerPassenger * _numPassengers;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BookingScreen(
            destination: _selectedDestination!,
            date: _selectedDate!,
            time: _selectedTime!,
            passengers: _numPassengers,
            farePerPassenger: farePerPassenger,
            totalFare: totalFare,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pramudita Bus Ticketing System'),
        backgroundColor: Colors.teal[600],
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Title
              const Text(
                'Book Your Bus Ticket',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              // Destination Selection
              const Text('Select Destination', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              _buildDestinationSelector(),

              const SizedBox(height: 20),

              // Price per Passenger Display
              if (_selectedDestination != null) _buildFareDetails(),

              const SizedBox(height: 20),

              // Number of Passengers Input
              const Text('Number of Passengers',
                  style: TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              _buildPassengerInput(),

              const SizedBox(height: 20),

              // Travel Date Picker
              GestureDetector(
                onTap: _pickDate,
                child: _buildDatePicker(),
              ),
              const SizedBox(height: 20),

              // Travel Time Picker
              _buildTimePicker(),

              const SizedBox(height: 30),

              // Proceed to Booking Button
              _buildProceedButton(),
            ],
          ),
        ),
      ),
    );
  }

  // Destination Selector with Chips
  Widget _buildDestinationSelector() {
    return Wrap(
      spacing: 10.0,
      children: _destinations.keys.map((destination) {
        return ChoiceChip(
          label: Text(destination),
          selected: _selectedDestination == destination,
          onSelected: (selected) {
            setState(() {
              _selectedDestination = selected ? destination : null;
            });
          },
          selectedColor: Colors.teal[600]!,
          backgroundColor: Colors.grey[300]!,
          labelStyle: TextStyle(
            color: _selectedDestination == destination
                ? Colors.white
                : Colors.black,
          ),
        );
      }).toList(),
    );
  }

  // Fare Details based on selected destination
  Widget _buildFareDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        'Price per Passenger: Rs ${_destinations[_selectedDestination]}',
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.teal[600]),
      ),
    );
  }

  // Number of Passengers Input with Increment/Decrement
  Widget _buildPassengerInput() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 8),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.remove, color: Colors.teal[600]),
            onPressed: () {
              if (_numPassengers > 1) {
                setState(() {
                  _numPassengers--;
                });
              }
            },
          ),
          Expanded(
            child: TextField(
              controller: TextEditingController(text: '$_numPassengers'),
              decoration: const InputDecoration(
                hintText: 'Enter number of passengers',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 16),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _numPassengers = int.tryParse(value) ?? 1;
                });
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.add, color: Colors.teal[600]),
            onPressed: () {
              setState(() {
                _numPassengers++;
              });
            },
          ),
        ],
      ),
    );
  }

  // Travel Date Picker Widget
  Widget _buildDatePicker() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 8),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.calendar_today, color: Colors.teal[600]),
          const SizedBox(width: 16),
          Text(
            _selectedDate == null
                ? 'Select Travel Date'
                : 'Travel Date: ${DateFormat.yMMMd().format(_selectedDate!)}',
            style: TextStyle(
              color: _selectedDate != null ? Colors.black87 : Colors.grey,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  // Travel Time Picker Widget
  Widget _buildTimePicker() {
    return GestureDetector(
      onTap: () async {
        TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
          builder: (context, child) {
            return Theme(
              data: ThemeData.light().copyWith(
                colorScheme: ColorScheme.light(primary: Colors.teal[600]!),
              ),
              child: child!,
            );
          },
        );

        if (pickedTime != null) {
          setState(() {
            _selectedTime = pickedTime;
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 8),
          ],
        ),
        child: Row(
          children: [
            Icon(Icons.access_time, color: Colors.teal[600]),
            const SizedBox(width: 16),
            Text(
              _selectedTime != null
                  ? _selectedTime!.format(context)
                  : 'Select Travel Time',
              style: TextStyle(
                color: _selectedTime != null ? Colors.black87 : Colors.grey,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Proceed to Booking Button Widget
  Widget _buildProceedButton() {
    return ElevatedButton(
      onPressed: _proceedToBooking,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        backgroundColor: Colors.teal[600],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: const Text(
        'Proceed to Booking',
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }
}
