import 'package:flutter/material.dart';
import 'package:triptrak/models/booking.dart';

class BookingLogic extends StatelessWidget {
  final Booking booking;

  const BookingLogic({Key? key, required this.booking}) : super(key: key);

  void_confirmBooking() {
    // Add logic to confirm booking
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Attraction: ${booking.attraction}',
              style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Text(
              'Date: ${booking.date.toString()}',
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 10.0),
            Text(
              'Number of Tickets: ${booking.numberOfTickets}',
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'User Information:',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 10.0),
            // Placeholder for user information
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Add more user information fields here
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              'Booking Status: ${booking.bookingStatus.toString().split('.').last}',
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
