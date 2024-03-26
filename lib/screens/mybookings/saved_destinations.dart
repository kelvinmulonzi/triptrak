import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:triptrak/models/attractions.dart';
import 'package:triptrak/repo/firestore_repo.dart';

import '../../models/booking.dart';
import 'widgets/destination_listtile.dart';

class SavedDestinations extends StatelessWidget {
  const SavedDestinations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            title: const Text(
              'My Bookings',
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(10),
            sliver: FutureBuilder(
                future: BkFirestoreRepo().getBookings(),
                builder: (context, snap) {
                  if (snap.connectionState == ConnectionState.waiting) {
                    return const SliverFillRemaining(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  final bookings = snap.data as List<Booking>;

                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return BookingListTile(
                          destination: bookings[index],
                        );
                      },
                      childCount: bookings.length,
                    ),
                  );
                }),
          ),

          // adding a new saved destination from the list of destinations
          // SliverList.builder(
          //  itemCount: Destination.length,
          //   itemBuilder: (context, index) {
          //     return SavedDestinationListTile(
          //       destination: Destination[index],
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
