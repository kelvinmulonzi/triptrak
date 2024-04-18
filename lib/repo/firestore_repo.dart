import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:triptrak/models/attractions.dart';
import 'package:triptrak/models/booking.dart';

class DesFirestoreRepo {
  final firestoreAttractions =
      FirebaseFirestore.instance.collection(attractionCollection);

  // Add an attraction
  Future<String> addAttraction(Destination attraction) async {
    try {
      await firestoreAttractions.doc(attraction.id).set(attraction.toJson());
      return attraction.id;
    } catch (e) {
      rethrow;
    }
  }

  // Update an attraction
  Future<void> updateAttraction(Destination attraction) async {
    try {
      await firestoreAttractions.doc(attraction.id).update(attraction.toJson());
    } catch (e) {
      rethrow;
    }
  }

  // get all destinations
  Future<List<Destination>> getAllAttractions() async {
    try {
      final attractions = await firestoreAttractions.get();

      final desList = attractions.docs
          .map((attraction) => Destination.fromJson(attraction.data()))
          .toList();


      return desList;
    } catch (e) {
      rethrow;
    }
  }
}

class BkFirestoreRepo {
  final firestoreBookings =
      FirebaseFirestore.instance.collection(bookingCollection);

  Future<String> addBooking(Booking booking) async {
    final data = booking.toJson();
    try {
      await firestoreBookings.add(data);
      return 'Booking added successfully';
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Booking>> getBookings() async {
    try {
      final bookings = await firestoreBookings.get();

      final bookingList = bookings.docs
          .map((booking) => Booking.fromJson(booking.data()))
          .toList();

      return bookingList;
    } catch (e) {
      rethrow;
    }
  }
}

// Collection constants
const String attractionCollection = "attraction";
const String bookingCollection = "booking";
