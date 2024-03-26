import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:triptrak/models/attractions.dart';
import 'package:triptrak/repo/firestore_repo.dart';

import '../../constants.dart';
import '../destination-list/destination_grid_page.dart';
import '../mybookings/saved_destinations.dart';
import 'widgets/attractiom_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: const TopLeading(),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: DesFirestoreRepo().getAllAttractions(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
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
                      )
                      //   CustomOutlinedBtn(
                      //     onPressed: () {},
                      //     title: 'Global Attractions',
                      //     pad: 10,
                      //   ),
                      //   CustomFilledBtn(
                      //     onPressed: () {},
                      //     title: 'My Bookings',
                      //     pad: 10,
                      //   ),
                      // ],
                    ]),
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

class TopLeading extends StatelessWidget {
  const TopLeading({super.key});

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
              'Username',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
        IconButton(
          onPressed: () async {
            // final provider = Provider.of<GoogleAuthProvide>(context,
            //     listen: false);
            // provider.signOut();

            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) =>
            //         const ProfilePage(),
            //   ),
            // );
          },
          // onPressed: () {
          //   HiveUser userFromHive = GetMeFromHive.getHiveUser!;
          //   print(userFromHive.name!);
          // },
          icon: Icon(
            Icons.menu,
            color: color.onSurface,
          ),
        ),
      ],
    );
  }
}
