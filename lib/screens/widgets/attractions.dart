import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'attractions.g.dart';

@JsonSerializable()
class Attraction {
  String id;
  String name;
  String description;
  String location;
  double ratings;
  List<String> reviews;
  String openingHours;
  double admissionFee;
  String contacts;

  Attraction({
    required this.id,
    required this.name,
    required this.description,
    required this.location,
    required this.ratings,
    required this.reviews,
    required this.openingHours,
    required this.admissionFee,
    required this.contacts,
  });

  factory Attraction.fromJson(Map<String, dynamic> json) =>
      _$AttractionFromJson(json);
  Map<String, dynamic> toJson() => _$AttractionToJson(this);
}

Attraction maasaimara = Attraction(
  id: const Uuid().v1(),
  name: "maasai mara",
  description:
      "a wildlife reserve in narok county, kenya, contiguous with the serengeti national park in tanzania. it is named in honor of the maasai people, the ancestral inhabitants of the area, who migrated to the area from the nile basin.",
  location: "Narok County, Kenya",
  ratings: 4.5,
  reviews: ["Amazing view!", "Must-visit landmark"],
  openingHours: "9:00 AM - 12:00 AM",
  admissionFee: 20.0,
  contacts: "+254 780 997742",
);
