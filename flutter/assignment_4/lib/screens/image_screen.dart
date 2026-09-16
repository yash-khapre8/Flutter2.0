import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});

  // List of local asset images
  static const List<String> images = [
    'assets/images/image1.jpg',
    'assets/images/image2.jpg',
    'assets/images/image3.jpg',
  ];

  static const List<String> labels = [
    'Mountains',
    'Beach',
    'City',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Images, Assets & Fonts',
          style: TextStyle(fontFamily: 'Pacifico'),
        ),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Custom font demo text
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Custom Font: Pacifico',
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 24,
                color: Colors.green,
              ),
            ),
          ),

          // GridView displaying local images
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,   // 2 columns
              padding: const EdgeInsets.all(12),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: List.generate(images.length, (index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Image.asset() loads from local assets
                      Image.asset(
                        images[index],
                        fit: BoxFit.cover,
                      ),
                      // Label overlay
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          color: Colors.black54,
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            labels[index],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
