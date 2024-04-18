import 'package:flutter/material.dart';

import '../../../../../../theme/text_scheme.dart';
import '../../constants.dart';
import '../../repo/firebase_repo.dart';
import '../widgets/custom_filled_button.dart';

class NavigationnDrawer extends StatelessWidget {
  const NavigationnDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;

    return Drawer(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 30),
            height: 200,
            child: Container(
              height: 150,
              width: 150,
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: color.primary.withOpacity(0.5),
                ),
              ),
              child: Image.network(
                dummyImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: const SizedBox(
              width: 50,
              height: 50,
              child: Icon(
                Icons.person_outline,
                size: 30,
              ),
            ),
            title: Text(
              'Name',
              style: bodyDefault(textTheme).copyWith(
                fontSize: 14,
              ),
            ),
            subtitle: Text(
                extractNameFromEmail(FirebaseRepo().currentUser!.email!),
                style: bodyDefault(textTheme)),
          ),
          ListTile(
            leading: const SizedBox(
              width: 50,
              height: 50,
              child: Icon(
                Icons.email_outlined,
                size: 30,
              ),
            ),
            title: Text(
              'Email',
              style: bodyDefault(textTheme).copyWith(
                fontSize: 14,
              ),
            ),
            subtitle: Text(FirebaseRepo().currentUser!.email!,
                style: bodyDefault(textTheme)),
          ),
          const Spacer(),
          CustomFilledBtn(
            title: 'Sign out',
            onPressed: () async {
              await FirebaseRepo().signout();
            },
            pad: 10,
          )
        ],
      ),
    );
  }
}
