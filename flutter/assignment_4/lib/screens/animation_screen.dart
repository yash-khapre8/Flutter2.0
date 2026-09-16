import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  // State variables that AnimatedContainer watches
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animations'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Press the button to animate!',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),

            // AnimatedContainer smoothly transitions between states
            AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeInOut,

              // Size changes
              width: _isExpanded ? 250 : 100,
              height: _isExpanded ? 250 : 100,

              // Color changes
              decoration: BoxDecoration(
                color: _isExpanded ? Colors.orange : Colors.deepPurple,

                // Border radius changes
                borderRadius: BorderRadius.circular(_isExpanded ? 125 : 12),

                // Shadow changes
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: _isExpanded ? 20 : 5,
                    spreadRadius: _isExpanded ? 5 : 1,
                  ),
                ],
              ),

              // Content inside the container
              child: Center(
                child: Icon(
                  _isExpanded ? Icons.star : Icons.star_border,
                  color: Colors.white,
                  size: _isExpanded ? 80 : 40,
                ),
              ),
            ),

            const SizedBox(height: 40),

            // Toggle button
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              ),
              child: Text(
                _isExpanded ? 'Shrink' : 'Expand',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
