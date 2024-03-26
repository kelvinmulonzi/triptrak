import 'package:flutter/material.dart';

import '../../models/attractions.dart';
import '../../repo/firestore_repo.dart';
import 'widgets/destination_gridtile.dart';

class DestinationGridPage extends StatelessWidget {
  const DestinationGridPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            title: const Text(
              'Destination ',
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
          FutureBuilder(
              future: DesFirestoreRepo().getAllAttractions(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  final dummyDests = snapshot.data as List<Destination>;

                  return SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.6,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return GridItem(
                          destination: dummyDests[index],
                        );
                      },
                      childCount: dummyDests.length,
                    ),
                  );
                } else {
                  return SliverFillRemaining(
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              })
        ],
      ),
    );
  }
}
