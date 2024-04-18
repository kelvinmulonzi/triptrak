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
      contacts: json['contacts'] as String,
      urlImage: json['urlImage'] as String,
      fee: json['fee'] as int,
    );

Map<String, dynamic> _$DestinationToJson(Destination instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'location': instance.location,
      'openingHours': instance.openingHours,
      'contacts': instance.contacts,
      'urlImage': instance.urlImage,
      'fee': instance.fee,
    };
