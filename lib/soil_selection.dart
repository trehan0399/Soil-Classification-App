import 'package:flutter/material.dart';
import 'package:bitcamp_project/crop_recommendations.dart'; // Import your CropRecommendationsScreen file

class SoilSelectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     precacheImage(AssetImage("images/soil.jpg"), context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Soil Type'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/soil.jpg"), // Replace with your soil-themed background image
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  _navigateToCropRecommendations(context, 'Sandy Soil');
                },
                child: Text('Sandy Soil'),
              ),
              ElevatedButton(
                onPressed: () {
                  _navigateToCropRecommendations(context, 'Clay Soil');
                },
                child: Text('Clay Soil'),
              ),
              ElevatedButton(
                onPressed: () {
                  _navigateToCropRecommendations(context, 'Loamy Soil');
                },
                child: Text('Loamy Soil'),
              ),
              ElevatedButton(
                onPressed: () {
                  _navigateToCropRecommendations(context, 'Silty Soil');
                },
                child: Text('Silty Soil'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToCropRecommendations(BuildContext context, String soilType) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CropRecommendationsScreen(soilType: soilType)),
    );
  }
}