import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:triptrak/constants.dart';
import 'package:triptrak/models/booking.dart';

import '../../../theme/text_scheme.dart';

class BookingListTile extends StatelessWidget {
  final Booking destination;
  const BookingListTile({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    const double height = 5;

    return Container(
      height: 160,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: 110,
              decoration: BoxDecoration(
                color: color.onSurface.withOpacity(0.1),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: SvgPicture.asset(pending),
              )),
          /* Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(destination.urlImage),
                fit: BoxFit.cover,
              ),
            ),
          ), */
          const SizedBox(width: 10),
          Expanded(
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        destination.attraction,
                        style: bodyDefaultBold(textTheme),
                      ),
                      const SizedBox(height: height),
                      Text(
                        'Kshs. ${NumberFormat('#,##0.00').format(destination.fee)}',
                        style: bodyDefault(textTheme).copyWith(
                          color: color.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: height),
                      Text('Tickets: ${destination.numberOfTickets.toString()}',
                          style: bodyDefault(textTheme)),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _showItemDialog(BuildContext cxt) {}
}
