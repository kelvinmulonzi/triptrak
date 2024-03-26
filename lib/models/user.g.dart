// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      profilePicture: json['profilePicture'] as String,
      bookingHistory: (json['bookingHistory'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      favoriteAttractions: (json['favoriteAttractions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      paymentInformation:
          Map<String, String>.from(json['paymentInformation'] as Map),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'profilePicture': instance.profilePicture,
      'bookingHistory': instance.bookingHistory,
      'favoriteAttractions': instance.favoriteAttractions,
      'paymentInformation': instance.paymentInformation,
    };
