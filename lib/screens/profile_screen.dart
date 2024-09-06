import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';

  // Dummy user data
  final Map<String, String> user = {
    'name': 'John Doe',
    'email': 'johndoe@example.com',
    'location': '123 Main St, Springfield',
    'bio': 'Passionate about reducing food waste and helping the community.',
    'profilePicture': 'https://via.placeholder.com/150' // Placeholder image URL
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.greenAccent, Colors.teal],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(user['profilePicture']!),
              backgroundColor: Colors.white,
            ),
            SizedBox(height: 20),
            Card(
              child: ListTile(
                title: Text(
                  user['name']!,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  user['email']!,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(
                  'Location',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  user['location']!,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(
                  'Bio',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  user['bio']!,
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
