import 'package:flutter/material.dart';
import 'package:triptrak/models/attractions.dart';

import '../../constants.dart';
import '../../models/booking.dart';
import '../../models/user.dart';
import '../../repo/firestore_repo.dart';

class BookingScreen extends StatefulWidget {
  final Destination destination;
  const BookingScreen({Key? key, required this.destination}) : super(key: key);

  @override
  BookingScreenState createState() => BookingScreenState();
}

class BookingScreenState extends State<BookingScreen> {
  // Variables to hold user input
  String attraction = '';
  DateTime date = DateTime.now();
  int numberOfTickets = 0;

  // Function to validate and submit booking
  void submitBooking() async {
    // Validate input
    if (numberOfTickets <= 0) {
      // Show error message
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please fill in all the fields.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    // Create Booking object
    Booking booking = Booking(
      attraction: widget.destination.name,
      date: date,
      numberOfTickets: numberOfTickets,
      bookingStatus: BookingStatus.pending,
    );

    // Send booking data to the server or perform any necessary action
    // You can add your implementation here
    final repo = BkFirestoreRepo();
    final result = await repo.addBooking(booking).then((value) async {
      print(value);

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('Booking successful!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // Navigate back to home screen or any other screen
                  // You can add your implementation here
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    });

    // Show success message
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                height: 150,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(widget.destination.urlImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.destination.name,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.w600, fontSize: 13),
                ),
              ],
            ),
            SizedBox(height: 10),
            // Date picker
            // You can use any date picker widget or customize it according to your requirement
            // Example: https://pub.dev/packages/flutter_datetime_picker
            // Example: https://pub.dev/packages/flutter_cupertino_date_picker
            // Example: https://pub.dev/packages/intl_date_time_field
            ElevatedButton(
              onPressed: () async {
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );
                if (selectedDate != null) {
                  setState(() {
                    date = selectedDate;
                  });
                }
              },
              // ignore: unnecessary_null_comparison
              child: Text(date == null
                  ? 'Select Date'
                  : 'Selected Date: ${date.toString().substring(0, 10)}'),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: 'Number of Tickets'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                numberOfTickets = int.tryParse(value) ?? 0;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: submitBooking,
              child: Text('Book Now'),
            ),
          ],
        ),
      ),
    );
  }
}
