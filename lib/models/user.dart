import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String name;
  String email;
  String password;
  String profilePicture;
  List<String> bookingHistory;
  List<String> favoriteAttractions;
  Map<String, String> paymentInformation;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
  

  User({
    required this.name,
    required this.email,
    required this.password,
    required this.profilePicture,
    required this.bookingHistory,
    required this.favoriteAttractions,
    required this.paymentInformation,
  });

  // Additional methods and functionality can be added here
}

class UserInfoWidget extends StatelessWidget {
  final User user;

  const UserInfoWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Name: ${user.name}'),
        Text('Email: ${user.email}'),
        Text('Profile Picture: ${user.profilePicture}'),
      ],
    );
  }
}

class BookingHistory extends StatelessWidget {
  final User user;

  const BookingHistory({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Booking History:'),
        for (var booking in user.bookingHistory)
          Text(booking),
      ],
    );
  }
}

class FavoriteAttraction extends StatelessWidget {
  final User user;

  const FavoriteAttraction({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Favorite Attractions:'),
        for (var attraction in user.favoriteAttractions)
          Text(attraction),
      ],
    );
  }
}

class PaymentInformation extends StatelessWidget {
  final User user;

  const PaymentInformation({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Payment Information:'),
        for (var entry in user.paymentInformation.entries)
          Text('${entry.key}: ${entry.value}'),
      ],
    );
  }
}
