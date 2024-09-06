import 'package:flutter/material.dart';


class FoodDetailScreen extends StatelessWidget {
  static const routeName = '/food-detail';

  @override
  Widget build(BuildContext context) {
    final Map<String, String> foodItem = ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: AppBar(
        title: Text(foodItem['title']!),
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
        child: Card(
          child: Column(
            children: [
              Image.network(foodItem['image']!),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  foodItem['description']!,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle food request
                },
                child: Text('Request Food'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
