import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

// Screen 4: Health Tips
// Uses: ListView.builder, Card, Row, Column, Icon, IconButton, Text, SnackBar
class HealthTipsScreen extends StatefulWidget {
  const HealthTipsScreen({super.key});

  @override
  State<HealthTipsScreen> createState() => _HealthTipsScreenState();
}

class _HealthTipsScreenState extends State<HealthTipsScreen> {
  // Set to keep track of bookmarked tip indices
  final Set<int> _favoriteIndices = {0, 3};

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
            child: Text(
              'Daily Wellness Tips & Advice',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
          ),

          // ListView displaying health tips (Widget Requirement: ListView, Card)
          Expanded(
            child: ListView.builder(
              itemCount: dummyTips.length,
              itemBuilder: (context, index) {
                final tip = dummyTips[index];
                final isFav = _favoriteIndices.contains(index);

                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 6.0),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Leading Icon in a colored circle
                        CircleAvatar(
                          radius: 22,
                          backgroundColor: tip.color.withAlpha(35),
                          child: Icon(tip.icon, color: tip.color, size: 24),
                        ),
                        const SizedBox(width: 14),

                        // Tip Title & Description in a Column
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tip.title,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                tip.description,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey.shade700,
                                  height: 1.3,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Favorite/Bookmark IconButton (Widget Requirement: IconButton)
                        IconButton(
                          icon: Icon(
                            isFav ? Icons.favorite : Icons.favorite_border,
                            color: isFav ? Colors.red : Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              if (isFav) {
                                _favoriteIndices.remove(index);
                              } else {
                                _favoriteIndices.add(index);
                              }
                            });

                            // Show quick SnackBar feedback
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  isFav
                                      ? 'Removed "${tip.title}" from saved tips'
                                      : 'Saved "${tip.title}" to favorites!',
                                ),
                                duration: const Duration(seconds: 1),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
