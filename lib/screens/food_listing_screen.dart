import 'package:flutter/material.dart';

import 'request_food_screen.dart';

class FoodListingScreen extends StatelessWidget {
  static const routeName = '/food-listing';

  final List<Map<String, String>> foods = [
    {'title': 'Apples', 'description': 'Fresh apples from the farm', 'imageUrl': 'https://via.placeholder.com/150'},
    {'title': 'Bread', 'description': 'Homemade bread', 'imageUrl': 'https://via.placeholder.com/150'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Listing'),
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
        child: ListView.builder(
          itemCount: foods.length,
          itemBuilder: (ctx, index) {
            return Card(
              margin: EdgeInsets.all(8.0),
              child: ListTile(
                leading: Image.network(foods[index]['imageUrl']!),
                title: Text(foods[index]['title']!),
                subtitle: Text(foods[index]['description']!),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Food(
                        title: foods[index]['title']!,
                        description: foods[index]['description']!,
                        imageUrl: foods[index]['imageUrl']!,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class Food extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  Food({required this.title, required this.description, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(imageUrl, width: double.infinity, fit: BoxFit.cover),
              SizedBox(height: 20),
              Text(
                description,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(RequestFoodScreen.routeName);
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
