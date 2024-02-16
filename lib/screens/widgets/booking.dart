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
