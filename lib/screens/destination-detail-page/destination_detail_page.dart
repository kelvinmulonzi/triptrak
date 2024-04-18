import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/attractions.dart';
import '../../theme/text_scheme.dart';
import '../booking/booking_page.dart';
import '../widgets/custom_filled_button.dart';

class DestinationDetailedPage extends StatelessWidget {
  final Destination destination;
  const DestinationDetailedPage({Key? key, required this.destination})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;

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
                    Row(
                      children: [
                        Text(
                          destination.name,
                          style: bodyLarge(textTheme).copyWith(
                            fontSize: 20,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'Kshs. ${NumberFormat('#,##0.00').format(destination.fee)}',
                          style: bodyDefault(textTheme).copyWith(
                            color: color.primary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
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
                          style: bodyDefaultBold(textTheme).copyWith(
                            color: color.onSurface,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      destination.description,
                      style: Theme.of(context).textTheme.bodyMedium,
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
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
