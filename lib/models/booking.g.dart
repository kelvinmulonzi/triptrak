// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Booking _$BookingFromJson(Map<String, dynamic> json) => Booking(
      attraction: json['attraction'] as String,
      date: DateTime.parse(json['date'] as String),
      numberOfTickets: json['numberOfTickets'] as int,
      bookingStatus: $enumDecode(_$BookingStatusEnumMap, json['bookingStatus']),
      fee: json['fee'] as int,
    );

Map<String, dynamic> _$BookingToJson(Booking instance) => <String, dynamic>{
      'attraction': instance.attraction,
      'date': instance.date.toIso8601String(),
      'numberOfTickets': instance.numberOfTickets,
      'bookingStatus': _$BookingStatusEnumMap[instance.bookingStatus]!,
      'fee': instance.fee,
    };

const _$BookingStatusEnumMap = {
  BookingStatus.confirmed: 'confirmed',
  BookingStatus.pending: 'pending',
  BookingStatus.cancelled: 'cancelled',
};
