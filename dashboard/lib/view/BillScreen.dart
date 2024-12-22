import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookingScreen extends StatelessWidget {
  final String destination;
  final DateTime date;
  final TimeOfDay time;
  final int passengers;
  final int farePerPassenger;
  final int totalFare;

  const BookingScreen({
    super.key,
    required this.destination,
    required this.date,
    required this.time,
    required this.passengers,
    required this.farePerPassenger,
    required this.totalFare,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Summary'),
        backgroundColor: Colors.teal[600],
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Heading Text
              const Text(
                'Booking Details',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              // Destination
              _buildInfoRow('Destination:', destination),

              // Travel Date
              _buildInfoRow('Travel Date:', DateFormat.yMMMd().format(date)),

              // Travel Time
              _buildInfoRow('Travel Time:', time.format(context)),

              // Number of Passengers
              _buildInfoRow('Number of Passengers:', '$passengers'),

              // Fare per Passenger
              _buildInfoRow('Fare per Passenger:', 'Rs. $farePerPassenger'),

              const SizedBox(height: 20),

              // Divider Line
              const Divider(thickness: 1, color: Colors.grey),

              const SizedBox(height: 16),

              // Total Fare
              Text(
                'Total Fare: Rs. $totalFare',
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal),
              ),

              const SizedBox(height: 30),

              // Centered, Long Button
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width *
                      0.8, // 80% width of screen
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.teal[600],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Back to Home',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Info Row Widget to display the text and values in a row
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            '$label ',
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.teal),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
