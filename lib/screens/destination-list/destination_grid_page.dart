import 'package:flutter/material.dart';

import '../../models/attractions.dart';
import '../../repo/firestore_repo.dart';
import 'widgets/destination_gridtile.dart';

class DestinationGridPage extends StatelessWidget {
  const DestinationGridPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('Destination'),
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
          FutureBuilder(
            future: DesFirestoreRepo().getAllAttractions(),
            builder: (context, AsyncSnapshot<List<Destination>> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                final dummyDests = snapshot.data!;

                return SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.6,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(10), // Add border radius
                          color: Colors.white, // Add background color
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: GridItem(
                          destination: dummyDests[index],
                        ),
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
            },
          ),
        ],
      ),
    );
  }
}
