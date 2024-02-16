// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attractions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attraction _$AttractionFromJson(Map<String, dynamic> json) => Attraction(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      location: json['location'] as String,
      ratings: (json['ratings'] as num).toDouble(),
      reviews:
          (json['reviews'] as List<dynamic>).map((e) => e as String).toList(),
      openingHours: json['openingHours'] as String,
      admissionFee: (json['admissionFee'] as num).toDouble(),
      contacts: json['contacts'] as String,
    );

Map<String, dynamic> _$AttractionToJson(Attraction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'location': instance.location,
      'ratings': instance.ratings,
      'reviews': instance.reviews,
      'openingHours': instance.openingHours,
      'admissionFee': instance.admissionFee,
      'contacts': instance.contacts,
    };
