import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/food_listing_screen.dart';
import 'screens/food_detail_screen.dart';
import 'screens/request_food_screen.dart';
import 'screens/post_food_screen.dart';
import 'screens/message_screen.dart';
import 'screens/conversation_screen.dart';

void main() {
  runApp(FoodSharingApp());
}

class FoodSharingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Sharing App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        ProfileScreen.routeName: (context) => ProfileScreen(),
        FoodListingScreen.routeName: (context) => FoodListingScreen(),
        FoodDetailScreen.routeName: (context) => FoodDetailScreen(),
        RequestFoodScreen.routeName: (context) => RequestFoodScreen(),
        PostFoodScreen.routeName: (context) => PostFoodScreen(),
        MessageScreen.routeName: (context) => MessageScreen(),
        ConversationScreen.routeName: (context) => ConversationScreen(),
      },
    );
  }
}
