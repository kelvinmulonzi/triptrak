import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

class GlobalAttractions extends StatelessWidget {
  final List<Attraction> attractions = [
    Attraction(
      name: 'Serengeti National Park',
      features: 'Home to the Great Migration, Big Five safari',
      destinations: [
        Destination(
          name: 'Serengeti Visitor Center',
          description: 'Information center and starting point for safaris',
          charges: 20.0,
        ),
        Destination(
          name: 'Serengeti Plains',
          description: 'Vast savannahs and wildlife viewing',
          charges: 30.0,
        ),
      ],
    ),
    Attraction(
      name: 'Niagara Falls',
      features: 'Iconic waterfall on the border of USA and Canada',
      destinations: [
        Destination(
          name: 'American Falls',
          description: 'View from the US side',
          charges: 15.0,
        ),
        Destination(
          name: 'Horseshoe Falls',
          description: 'View from the Canadian side',
          charges: 25.0,
        ),
      ],
    ),
    Attraction(
      name: 'Taj Mahal',
      features: 'Iconic white marble mausoleum in India',
      destinations: [
        Destination(
          name: 'Taj Mahal Main Building',
          description: 'View of the main mausoleum',
          charges: 20.0,
        ),
        Destination(
          name: 'Taj Mahal Gardens',
          description: 'Gardens and fountains surrounding the mausoleum',
          charges: 10.0,
        ),
      ],
    ),
    Attraction(
      name: 'Great Wall of China',
      features: 'Iconic ancient wall in China',
      destinations: [
        Destination(
          name: 'Great Wall Visitor Center',
          description: 'Information center and starting point for tours',
          charges: 15.0,
        ),
        Destination(
          name: 'Great Wall Hiking Trail',
          description: 'Hiking trail along the wall',
          charges: 25.0,
        ),
      ],
    ),
    Attraction(
      name: 'Machu Picchu',
      features: 'Iconic Incan ruins in Peru',
      destinations: [
        Destination(
          name: 'Machu Picchu Main Site',
          description: 'View of the main ruins',
          charges: 20.0,
        ),
        Destination(
          name: 'Machu Picchu Sun Gate',
          description: 'Hiking trail to the Sun Gate',
          charges: 10.0,
        ),
      ],
    ),
    Attraction(
      name: 'Sydney Opera House',
      features: 'Iconic performing arts center in Australia',
      destinations: [
        Destination(
          name: 'Sydney Opera House Tour',
          description: 'Guided tour of the opera house',
          charges: 20.0,
        ),
        Destination(
          name: 'Sydney Opera House Concert',
          description: 'Live performance at the opera house',
          charges: 30.0,
        ),
      ],
    ),
    Attraction(
      name: 'Pyramids of Giza',
      features: 'Iconic ancient pyramids in Egypt',
      destinations: [
        Destination(
          name: 'Pyramids of Giza Complex',
          description: 'View of the pyramids and Sphinx',
          charges: 15.0,
        ),
        Destination(
          name: 'Pyramids of Giza Inside',
          description: 'Guided tour inside the pyramids',
          charges: 25.0,
        ),
      ],
    ),
    Attraction(
      name: 'Petra',
      features: 'Iconic ancient city in Jordan',
      destinations: [
        Destination(
          name: 'Petra Main Site',
          description: 'View of the main ruins',
          charges: 20.0,
        ),
        Destination(
          name: 'Petra Monastery',
          description: 'Hiking trail to the Monastery',
          charges: 10.0,
        ),
      ],
    ),
    Attraction(
      name: 'Christ the Redeemer',
      features: 'Iconic statue in Brazil',
      destinations: [
        Destination(
          name: 'Christ the Redeemer Viewing Platform',
          description: 'Panoramic views of Rio de Janeiro',
          charges: 20.0,
        ),
        Destination(
          name: 'Christ the Redeemer Statue',
          description: 'View of the statue up close',
          charges: 10.0,
        ),
      ],
    ),
    //  Add more attractions from Africa, Europe, America, and Asia
    // Example:
    // Attraction(
    //   name: 'Eiffel Tower',
    //   features: 'Iconic iron lattice tower in Paris',
    //   destinations: [
    //     Destination(
    //       name: 'Eiffel Tower Viewing Platform',
    //       description: 'Panoramic views of Paris',
    //       charges: 20.0,
    //     ),
    //   ],
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Global Attractions'),
      ),
      body: GridView.builder(
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
              elevation: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.network(
                      // Use images related to the attractions
                      'https://source.unsplash.com/300x200/?${attractions[index].name}',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      attractions[index].name,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
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
      body: ListView.builder(
        itemCount: attraction.destinations.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(attraction.destinations[index].name),
            subtitle: Text(attraction.destinations[index].description),
            trailing: Text(
                '\$${attraction.destinations[index].charges.toStringAsFixed(2)}'),
                
         onTap  : () {
String bookingDate = DateTime.now().toString(); 
  double amountPaid = 100.0; 
  String modeOfPayment = "Credit Card"; 

  // Store booking details in Firestore (Assuming you have a 'bookings' collection)
  FirebaseFirestore.instance.collection('bookings').add({
    'attraction_name': attraction.destinations[index].name,
    'booking_date': bookingDate,
    'amount_paid': amountPaid,
    'mode_of_payment': modeOfPayment,
  }).then((value) {
    // Show a booking confirmation dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Booking Confirmation'),
          content: Text('Your booking for ${attraction.destinations[index].name} has been confirmed.\n\nBooking Date: $bookingDate\nAmount Paid: $amountPaid\nMode of Payment: $modeOfPayment'),
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
  }).catchError((error) {
    // Handle errors if booking fails
    print("Failed to book: $error");
    // Show an error dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Booking Failed'),
          content: Text('There was an error while processing your booking. Please try again later.'),
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
  });
},

          );
        },
      ),
    );
  }
}
