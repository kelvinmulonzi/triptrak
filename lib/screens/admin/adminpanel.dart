import 'package:flutter/material.dart';

import 'add-attraction/add_attraction_page.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Panel'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: ListView(
        children: [
          _addAttractionTile(context),
        ],
      ),
    );
  }

  Widget _addAttractionTile(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => NewAttractionPage(),
        ),
      ),
      leading: CircleAvatar(
        radius: 35,
        child: Center(
          child: Icon(
            Icons.add,
            size: 30,
          ),
        ),
      ),
      title: Text(
        'Add Attraction',
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
    );
  }
}
