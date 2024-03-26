// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';



// class SaveButton extends StatefulWidget {
//   const SaveButton({
//     super.key,
//   });

//   @override
//   State<SaveButton> createState() => _SaveButtonState();
// }

// class _SaveButtonState extends State<SaveButton> {
//   bool _isBookmarked = false;
//   JokeEntity? joke;

//   void Function(JokeEntity joke)? saved;
//   void Function(String id)? unsaved;

//   void _saveToBookmark() {
//     debugPrint('saveToBookmark');

//     if (_isBookmarked) {
//       unsaved!(joke!.id);
//     } else {
//       saved!(joke!);
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     final reader = context.read<JokeProvider>();
//     saved = (joke) {
//       reader.eitherFailureOrSavedJoke(joke);
//     };
//     unsaved = (id) {
//       reader.eitherFailureOrDeletedJoke(id);
//     };

//     joke = reader.jokeEntity;
//     _isBookmarked = reader.isBookmark;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final reader = context.read<JokeProvider>();
//     final watcher = context.watch<JokeProvider>();

//     return Expanded(
//       child: FilledButton(
//         onPressed: () async {
//           if (reader.jokeEntity == null) {
//             return;
//           }

//           joke = reader.jokeEntity!;
//           _isBookmarked = reader.isBookmark;
//           _saveToBookmark();
//           _isBookmarked = reader.isBookmark;
//         },
//         style: FilledButton.styleFrom(
//           elevation: 0,
//           enableFeedback: true,
//           backgroundColor: Theme.of(context).colorScheme.surface,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(0),
//           ),
//         ),
//         child: Column(
//           children: [
//             Icon(
//               watcher.isBookmark
//                   ? CupertinoIcons.bookmark_fill
//                   : CupertinoIcons.bookmark,
//               color: Theme.of(context).colorScheme.onSurface,
//             ),
//             const SizedBox(height: 5),
//             Text(
//               'Save Joke',
//               style: Theme.of(context).textTheme.labelSmall!.copyWith(
//                     fontWeight: FontWeight.w400,
//                   ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ShareButton extends StatelessWidget {
//   final Function() onPressed;
//   const ShareButton({super.key, required this.onPressed});

//   @override
//   Widget build(BuildContext context) {
//     final reader = context.read<JokeProvider>();

//     return Expanded(
//       child: FilledButton(
//         onPressed: () async {
//           if (reader.jokeEntity == null) {
//             return;
//           }

//           await onPressed();
//         },
//         style: FilledButton.styleFrom(
//           elevation: 0,
//           enableFeedback: true,
//           backgroundColor: Theme.of(context).colorScheme.surface,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(0),
//           ),
//         ),
//         child: Column(
//           children: [
//             Icon(
//               CupertinoIcons.share,
//               color: Theme.of(context).colorScheme.onSurface,
//             ),
//             const SizedBox(height: 5),
//             Text(
//               'Share',
//               style: Theme.of(context).textTheme.labelSmall!.copyWith(
//                     fontWeight: FontWeight.w400,
//                   ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ListButton extends StatelessWidget {
//   const ListButton({super.key});

//   @override
//   Widget build(BuildContext context) {

//     return Expanded(
//       child: FilledButton(
//         onPressed: () async {
//           Navigator.of(context).push(
//             MaterialPageRoute(
//               builder: (context) => const JokesPage(),
//             ),
//           );
//         },
//         style: FilledButton.styleFrom(
//           elevation: 0,
//           enableFeedback: true,
//           backgroundColor: Theme.of(context).colorScheme.surface,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(0),
//           ),
//         ),
//         child: Column(
//           children: [
//             Icon(
//               CupertinoIcons.list_bullet_below_rectangle,
//               color: Theme.of(context).colorScheme.onSurface,
//             ),
//             const SizedBox(height: 5),
//             Text(
//               'More Jokes',
//               style: Theme.of(context).textTheme.labelSmall!.copyWith(
//                     fontWeight: FontWeight.w400,
//                   ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
