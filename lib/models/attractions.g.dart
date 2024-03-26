// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attractions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Destination _$DestinationFromJson(Map<String, dynamic> json) => Destination(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      location: json['location'] as String,
      openingHours: json['openingHours'] as String,
      admissionFee: (json['admissionFee'] as num).toDouble(),
      contacts: json['contacts'] as String,
      urlImage: json['urlImage'] as String,
    );

Map<String, dynamic> _$DestinationToJson(Destination instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'location': instance.location,
      'openingHours': instance.openingHours,
      'admissionFee': instance.admissionFee,
      'contacts': instance.contacts,
      'urlImage': instance.urlImage,
    };
