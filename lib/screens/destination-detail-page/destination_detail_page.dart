import 'package:flutter/material.dart';
import 'package:triptrak/screens/destination-detail-page/widgets/booking_logic.dart';
import 'package:triptrak/screens/widgets/custom_filled_button.dart';

import '../../models/attractions.dart';
import '../booking/booking_page.dart';

class DestinationDetailedPage extends StatelessWidget {
  final Destination destination;
  const DestinationDetailedPage({Key? key, required this.destination})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(destination.urlImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      destination.name,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Theme.of(context).colorScheme.onSurface,
                          size: 12,
                        ),
                        Text(
                          destination.location,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      destination.description,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: CustomFilledBtn(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookingScreen(
                          destination: destination,
                        ),
                      ),
                    );
                  },
                  title: 'Book Now',
                  pad: 10,
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
