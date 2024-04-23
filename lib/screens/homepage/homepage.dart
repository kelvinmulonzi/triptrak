import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:triptrak/models/attractions.dart';
import 'package:triptrak/repo/firebase_repo.dart';
import 'package:triptrak/repo/firestore_repo.dart';
import 'package:triptrak/screens/admin/adminpanel.dart';

import '../../constants.dart';
import '../destination-list/destination_grid_page.dart';
import '../mybookings/saved_destinations.dart';
import 'profile_end_drawer.dart';
import 'widgets/attractiom_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        title: const TopLeading(),
        centerTitle: true,
        actions: [
          Builder(builder: (context) {
            return IconButton(
                onPressed: () => _openDrawer(context),
                icon: const Icon(Icons.align_horizontal_left_rounded));
          })
        ],
      ),
      body: FutureBuilder(
        future: DesFirestoreRepo().getAllAttractions(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              final desData = snapshot.data as List<Destination>;

              print(desData.length);

              return Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: SvgPicture.asset(explore),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Text(
                          'Global Attractions',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const DestinationGridPage(),
                              ),
                            );
                          },
                          child: Text(
                            'View All',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 260,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: desData.length,
                      itemBuilder: (context, index) {
                        return AttractionTile(
                          destination: desData[index],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Row(children: [
                      Expanded(
                        child: InkWell(
                          customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const SavedDestinations(),
                              ),
                            );
                          },
                          child: Container(
                            height: 100,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              'My Bookings',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const AdminPage(),
                              ),
                            );
                          },
                          child: Container(
                            height: 100,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              'Admin Panel',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                        ),
                      )
                    ]),
                  ),
                ],
              );
            } else {
              return Center(
                child: Text(
                  'No destinations available list is empty',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      drawer: const NavigationnDrawer(),
    );
  }

  void _openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }
}

class TopLeading extends StatelessWidget {
  const TopLeading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 27,
              child: CircleAvatar(
                backgroundColor: color.surface,
                backgroundImage: const NetworkImage(
                  'https://avatars.githubusercontent.com/u/82651930?v=4',
                ),
                radius: 25.5,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              extractNameFromEmail(FirebaseRepo().currentUser!.email!),
              style: Theme.of(context).textTheme.labelMedium,
              //
            ),
          ],
        ),
        const Spacer()
      ],
    );
  }
}