import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Destination {
  final String name;
  final String description;
  final double charges;

  Destination(
      {required this.name, required this.description, required this.charges});
}

class Attraction {
  final String name;
  final String features;
  final List<Destination> destinations;

  Attraction(
      {required this.name, required this.features, required this.destinations});
}

class DummieInfo extends StatelessWidget {
  final List<Attraction> attractions = [
    Attraction(
      name: 'Masai Mara National Reserve',
      features:
          'Home to the Big Five, Great Migration, Hot Air Balloon Safaris',
      destinations: [
        Destination(
            name: 'Sekenani Gate',
            description: 'Main entrance to Masai Mara',
            charges: 10.0),
        Destination(
            name: 'Mara River',
            description: 'Famous for crocodile and wildebeest interactions',
            charges: 15.0),
      ],
    ),
    Attraction(
      name: 'Amboseli National Park',
      features:
          'Iconic views of Mount Kilimanjaro, Large herds of elephants, Bird watching',
      destinations: [
        Destination(
            name: 'Observation Hill',
            description: 'Panoramic views of the park',
            charges: 20.0),
        Destination(
            name: 'Enkongo Narok Swamp',
            description: 'Birdwatching hotspot',
            charges: 25.0),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Local Attractions'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.lightBlue.shade300, Colors.green.shade300],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: attractions.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AttractionDetails(attraction: attractions[index]),
                    ),
                  );
                },
                child: Card(
                  color: Colors.transparent,
                  elevation: 0, // Removes the shadow
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.network(
                          attractions[index].destinations[0].name ==
                                  'Sekenani Gate'
                              ? 'https://plus.unsplash.com/premium_photo-1664302652203-238526cd24fe?q=80&w=1463&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
                              : 'https://c7.alamy.com/comp/BRD3EC/safari-vehicle-entering-the-mara-intrepids-camp-masai-mara-national-BRD3EC.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Center(
                        child: Text(
                          attractions[index].name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                blurRadius: 2.0,
                                color: Colors.black,
                                offset: Offset(1.0, 1.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}



class AttractionDetails extends StatelessWidget {
  final Attraction attraction;

  AttractionDetails({required this.attraction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(attraction.name),
      ),
      body: Column(
        children: [
          Text(
            'Features: ${attraction.features}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            'Destinations:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: attraction.destinations.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(attraction.destinations[index].name),
                subtitle: Text(attraction.destinations[index].description),
                trailing: Text(
                    '\$${attraction.destinations[index].charges.toStringAsFixed(2)}'),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Destination Selected'),
                        content: Text(
                            'You have selected ${attraction.destinations[index].name} at a cost of \$${attraction.destinations[index].charges.toStringAsFixed(2)}'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              // Add your booking logic here
                              // For example, show a dialog for booking details
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Booking Details'),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Enter booking details:'),
                                        TextField(
                                          decoration: InputDecoration(
                                            labelText: 'Booking Dates',
                                          ),
                                        ),
                                        TextField(
                                          decoration: InputDecoration(
                                            labelText: 'Amount Paid',
                                          ),
                                        ),
                                        TextField(
                                          decoration: InputDecoration(
                                            labelText: 'Mode of Payment',
                                          ),
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          // Add your booking logic here
                                          // For example, show a booking confirmation dialog
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text(
                                                    'Booking Confirmation'),
                                                content: Text(
                                                    'Your booking has been confirmed.'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text('OK'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        child: Text('Confirm Booking'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Text('Confirm'),
                          ),
                        ],
                      );
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
