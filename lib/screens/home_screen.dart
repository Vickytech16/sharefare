import 'package:flutter/material.dart';
import 'food_listing_screen.dart';
import 'post_food_screen.dart';
import 'profile_screen.dart';
import 'message_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ShareFare Home'),
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
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(16.0),
          children: [
            _buildMenuCard(context, Icons.list, 'Food Listings', FoodListingScreen.routeName),
            _buildMenuCard(context, Icons.add, 'Post Food', PostFoodScreen.routeName),
            _buildMenuCard(context, Icons.account_circle, 'Profile', ProfileScreen.routeName),
            _buildMenuCard(context, Icons.message, 'Messages', MessageScreen.routeName),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context, IconData icon, String title, String routeName) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(routeName);
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 50, color: Colors.teal),
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
