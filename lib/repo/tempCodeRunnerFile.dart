import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:triptrak/repo/firestore_repo.dart';

class AtFirestoreRepo {
  final firestoreAttractions =
      FirebaseFirestore.instance.collection(attractionCollection);
}
