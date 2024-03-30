import 'package:json_annotation/json_annotation.dart';
import 'package:triptrak/constants.dart';
import 'package:uuid/uuid.dart';

part 'attractions.g.dart';

@JsonSerializable()
class Destination {
  String id;
  String name;
  String description;
  String location;
  String openingHours;
  double admissionFee;
  String contacts;
  // bool isSaved;
  String urlImage;

  Destination({
    required this.id,
    required this.name,
    required this.description,
    required this.location,
    required this.openingHours,
    required this.admissionFee,
    required this.contacts,
    required this.urlImage,
  });

  factory Destination.fromJson(Map<String, dynamic> json) =>
      _$DestinationFromJson(json);
  Map<String, dynamic> toJson() => _$DestinationToJson(this);
}

Destination maasaimara = Destination(
  urlImage: dummyImage2,
  id: const Uuid().v1(),
  name: "maasai mara",
  description:
      "a wildlife reserve in narok county, kenya, contiguous with the serengeti national park in tanzania. it is named in honor of the maasai people, the ancestral inhabitants of the area, who migrated to the area from the nile basin.",
  location: "Narok County, Kenya",
  openingHours: "9:00 AM - 12:00 AM",
  admissionFee: 20.0,
  contacts: "+254 780 997742",
);
Destination nairobipark = Destination(
  urlImage: dummyImage3,
  id: const Uuid().v1(),
  name: "Nairobi National Park",
  description:
      "a national park in kenya that was established in 1946 about 7 km south of the center of nairobi, kenya. it is one of kenya's most successful rhinoceros sanctuaries.",
  location: "Nairobi, Kenya",
  openingHours: "9:00 AM - 12:00 AM",
  admissionFee: 20.0,
  contacts: "+254 780 997742",

);
Destination lamubeaches = Destination(
  urlImage: dummyImage4,
  id: const Uuid().v1(),
  name: "Lamu Beaches",
  description:
      "Lamu is a beautiful island located on the coast of Kenya. It is known for its pristine beaches and rich Swahili culture. The beaches in Lamu offer stunning views, crystal-clear waters, and a peaceful atmosphere. Visitors can enjoy activities such as swimming, sunbathing, and water sports. The island is also home to historical sites and traditional Swahili architecture.",
  location: "Lamu Island, Kenya",
  openingHours: "24/7",
  admissionFee: 0.0,
  contacts: "+254 780 997742",
);
// ignore: non_constant_identifier_names
Destination GiraffeCentre = Destination(
  urlImage: dummyImage5,
  id: const Uuid().v1(),
  name: "Giraffe Centre",
  description:
      "The Giraffe Centre is a conservation and education centre in Nairobi, Kenya, dedicated to the preservation of the endangered Rothschild giraffe. The Giraffe Centre was established in 1979 by Jock Leslie-Melville, the Kenyan grandson of a Scottish Earl, when he and his wife Betty captured a baby giraffe to start a programme of breeding giraffe in captivity at their home in Langata - home of the present centre.",
  location: "Nairobi, Kenya",
  openingHours: "9:00 AM - 5:00 PM",
  admissionFee: 20.0,
  contacts: "+254 780 997742",
);
Destination Hellsgate = Destination(
  urlImage: dummyImage6,
  id: const Uuid().v1(),
  name: "Hell's Gate National Park",
  description:
      "Hell's Gate National Park is a small national park in Kenya. It is named after a narrow break in the cliffs, once a tributary of a prehistoric lake that fed early humans in the Rift Valley. The park is known for its natural geysers, starling scenery, and opportunities for rock climbing and hiking.",
  location: "Naivasha, Kenya",
  openingHours: "9:00 AM - 6:00 PM",
  admissionFee: 20.0,
  contacts: "+254 780 997742",
);


List<Destination> dummyDests = [maasaimara, nairobipark, lamubeaches, GiraffeCentre, Hellsgate];
