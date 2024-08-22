import 'package:flutter/material.dart';

class CropRecommendationsScreen extends StatelessWidget {
  final String soilType;

  const CropRecommendationsScreen({Key? key, required this.soilType}) : super(key: key);

  @override
  Widget build(BuildContext context) {

   precacheImage(AssetImage("images/soil.jpg"), context);
    // Define crop recommendations for each soil type
    Map<String, List<String>> soilCrops = {
      'Sandy Soil': ['Wheat', 'Maize', 'Soybean'],
      'Clay Soil': ['Wheat', 'Maize', 'Rice'],
      'Loamy Soil': ['Wheat', 'Maize', 'Soybean', 'Rice', 'Barley', 'Tomato'],
      'Silty Soil': ['Wheat', 'Rice', 'Potato', 'Barley', 'Peas'],
    };

    // Get crop recommendations for the selected soil type
    List<String> recommendedCrops = soilCrops[soilType] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('Crop Recommendations for $soilType'), // Displaying the selected soil type
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/soil.jpg"), // Replace with your background image
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: recommendedCrops.length,
            itemBuilder: (context, index) {
              return _buildCropCard(recommendedCrops[index], _getDescription(recommendedCrops[index]));
            },
          ),
        ),
      ),
    );
  }

  String _getDescription(String cropName) {
    // Define descriptions for each crop
    Map<String, String> cropDescriptions = {
      'Wheat': 'Wheat is suitable for various soil types.',
      'Maize': 'Maize grows well in most soil types.',
      'Soybean': 'Soybean is recommended for fertile soil.',
      'Rice': 'Rice cultivation requires moist soil.',
      'Potato': 'Potatoes can be grown in loose, well-drained soil.',
      'Barley': 'Barley is suitable for cooler climates.',
      'Tomato': 'Tomatoes thrive in loamy soil with good drainage.',
      'Peas': 'Peas prefer cool, moist soil for optimal growth.',
    };
    return cropDescriptions[cropName] ?? '';
  }

  Widget _buildCropCard(String cropName, String description) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 2.0,
      child: ListTile(
        title: Text(cropName),
        subtitle: Text(description),
        leading: Icon(Icons.eco),
      ),
    );
  }
}