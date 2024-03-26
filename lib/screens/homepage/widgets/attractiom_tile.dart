import 'package:flutter/material.dart';
import 'package:triptrak/models/attractions.dart';

import '../../destination-detail-page/destination_detail_page.dart';

class AttractionTile extends StatelessWidget {
  final Destination destination;
  const AttractionTile({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 230,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
                  DestinationDetailedPage(destination: destination),
            ),
          );
        },
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        image: NetworkImage(destination.urlImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  destination.name,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.w600, fontSize: 13),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      destination.location,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
