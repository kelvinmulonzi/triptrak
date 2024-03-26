import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:triptrak/models/attractions.dart';

import '../../../theme/text_scheme.dart';

class SavedDestinationListTile extends StatelessWidget {
  final Destination destination;
  const SavedDestinationListTile({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    const double height = 2;

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
              image: DecorationImage(
                image: NetworkImage(destination.urlImage),
                fit: BoxFit.cover,
              ),
            ),
            // child: Stack(
            //   children: [
            //     Center(child: Image.network(destination.urlImage)),
            //   ],
            // ),
          ),
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
                      
                        'destiation name',
                        style: bodyDefaultBold(textTheme),
                      ),
                      const SizedBox(height: height),
                      Text('the coast of kenya',
                          style: bodyDefault(textTheme)),
                      const SizedBox(height: height),
                      
                    ],
                  ),
                ),
                Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                      onPressed: () {
                        _showItemDialog(context);
                      },
                      icon: const Icon(CupertinoIcons.bookmark),
                    )),
                Positioned(
                  bottom: 10,
                  right: 0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('KES ',
                          style: bodyDefault(textTheme).copyWith(
                            fontSize: 10,
                          )),
                      Text(
                        NumberFormat('#,##0').format(12000),
                        style: bodyDefaultBold(textTheme).copyWith(
                          fontSize: 13.5,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _showItemDialog(BuildContext cxt) {}
}
