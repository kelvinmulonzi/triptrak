import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:triptrak/screens/widgets/attractions.dart';

class AtFirestoreRepo {
  final firestoreAttractions =
      FirebaseFirestore.instance.collection(attractionCollection);

  // Add an attraction
  Future<String> addAttraction(Attraction attraction) async {
    try {
      await firestoreAttractions.doc(attraction.id).set(attraction.toJson());
      final returnedId = await firestoreAttractions.doc(attraction.id).get();

      return returnedId.id;
      
    } catch (e) {
      throw Future.error(e);
    }
  }
}

// collection constants
const String attractionCollection = "attraction";
