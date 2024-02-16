import 'package:flutter/material.dart';
import 'destinations.dart';

class NextPage extends StatelessWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Discover Trips'),
        elevation: 0.0,
        toolbarHeight: 80.0,
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.grey[200],
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Center(
                  child: Text(
                    'Dashboard',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
              buildDrawerItem(Icons.home, 'Home', context),
              buildDrawerItem(Icons.explore, 'Explore', context),
              buildDrawerItem(Icons.share, 'Share', context),
              buildDrawerItem(Icons.settings, 'Settings', context),
              // Add more drawer items as needed
            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.grey[100],
        child: Scrollbar(
          child: ListView(
            padding: EdgeInsets.all(16.0),
            children: [
              buildDestinationCard(
                'local attractions',
                'Explore our country',
                'assets/mara.jpg',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DestinationsPage()),
                  );
                },
              ),
              buildDestinationCard(
                'global attractions',
                'Discover the world',
                'assets/tokyo.png',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DestinationsPage()),
                  );
                },
              ),
              // Add more destination cards as needed
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDestinationCard(
      String title, String description, String imagePath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5.0,
        shadowColor: Colors.grey.withOpacity(0.5),
        margin: EdgeInsets.symmetric(vertical: 10.0),
        child: Stack(
          children: [
            Container(
              height: 200.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black.withOpacity(0.5),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      description,
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDrawerItem(IconData icon, String title, BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(fontSize: 16.0),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
