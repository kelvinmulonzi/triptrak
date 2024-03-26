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
        title: Text('Booking Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Attraction: ${booking.attraction}',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'Date: ${booking.date.toString()}',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Number of Tickets: ${booking.numberOfTickets}',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'User Information:',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10.0),
            // Placeholder for user information
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: ${booking.userInformation.name}'),
                  Text('Email: ${booking.userInformation.email}'),
                  // Add more user information fields here
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Booking Status: ${booking.bookingStatus.toString().split('.').last}',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
