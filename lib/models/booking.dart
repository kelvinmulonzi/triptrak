import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'booking.g.dart';

@JsonSerializable()
class Booking {
  String attraction;
  DateTime date;
  int numberOfTickets;
  User userInformation;
  BookingStatus bookingStatus;
 
  factory Booking.fromJson(Map<String, dynamic> json) => _$BookingFromJson(json);
  Map<String, dynamic> toJson() => _$BookingToJson(this);

  Booking({
    required this.attraction,
    required this.date,
    required this.numberOfTickets,
    required this.userInformation,
    required this.bookingStatus,
  });
}

enum BookingStatus {
  confirmed,
  pending,
  cancelled,
}


Booking firstBooking = Booking(
  attraction: "Maasai Mara National Reserve",
  date: DateTime.now(),
  numberOfTickets: 2,
  userInformation: User(
    name: "John Doe",
    email: "johndoe@example.com",
    password: "password",
    profilePicture: "profile.jpg",
    bookingHistory: [],
    favoriteAttractions: [],
    paymentInformation: {},
  ),
  bookingStatus: BookingStatus.confirmed,
);
Booking secondBooking = Booking(
  attraction: "nairobi national park",
  date: DateTime.now(),
  numberOfTickets: 4,
  userInformation: User(
    name: "Jane Smith",
    email: "janesmith@example.com",
    password: "password",
    profilePicture: "profile.jpg",
    bookingHistory: [],
    favoriteAttractions: [],
    paymentInformation: {},
  ),
  bookingStatus: BookingStatus.pending,
);
    String name = "Jane Smith";
    String email = "janesmith@example.com";
    BookingStatus bookingStatus = BookingStatus.pending;

