import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:triptrak/models/attractions.dart';

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
              'Saved Destinations',
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return SavedDestinationListTile(
                  destination: dummyDests[index],
                );
              },
              childCount: dummyDests.length,
            ),
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
