import 'package:json_annotation/json_annotation.dart';

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
