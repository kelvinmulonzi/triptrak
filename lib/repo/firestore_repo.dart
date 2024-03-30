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
      print('Error adding attraction: $e');
      throw e;
    }
  }
  


  // Update an attraction
  Future<void> updateAttraction(Destination attraction) async {
    try {
      await firestoreAttractions.doc(attraction.id).update(attraction.toJson());
    } catch (e) {
      print('Error updating attraction: $e');
      throw e;
    }
  }

  // get all destinations
  Future<List<Destination>> getAllAttractions() async {
    try {
      final attractions = await firestoreAttractions.get();

      final desList = attractions.docs
          .map((attraction) => Destination.fromJson(attraction.data()))
          .toList();

      print('============================>>> ${desList.length}');

      return desList;
    } catch (e) {
      print('Error getting attractions: $e');
      throw e;
    }
  }
}

class BkFirestoreRepo {
  final firestoreBookings =
      FirebaseFirestore.instance.collection(bookingCollection);

  Future<String> addBooking(Booking booking) async {
    final data = booking.toJson();
    print('Booking: $data');
    try {
      await firestoreBookings.add(data);
      return 'Booking added successfully';
    } catch (e) {
      print('Error adding booking: $e');
      throw e;
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
      print('Error getting bookings: $e');
      throw e;
    }
  }
}

// Collection constants
const String attractionCollection = "attraction";
const String bookingCollection = "booking";
