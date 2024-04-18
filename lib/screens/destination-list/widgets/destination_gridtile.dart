import 'package:flutter/material.dart';
import 'package:triptrak/constants.dart';
import 'package:triptrak/screens/destination-detail-page/destination_detail_page.dart';

import '../../../models/attractions.dart';

class GridItem extends StatelessWidget {
  final Destination destination;
  const GridItem({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                DestinationDetailedPage(destination: destination),
          ),
        );
      },
      child: SizedBox(
        // height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(3),
                  image: DecorationImage(
                    image: NetworkImage(destination.urlImage),
                    fit: BoxFit.cover,
                  ),
                ),
                // child: Center(
                //   child: Image.network(dummyImage2),
                // ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5, left: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destination.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 9,
                        ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Theme.of(context).colorScheme.onSurface,
                        size: 12,
                      ),
                      Text(
                        destination.location,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
