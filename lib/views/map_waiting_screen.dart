import 'package:flutter/material.dart';
import 'dart:async';

import 'package:veeginine/views/tracking_screen.dart';

class MapWaitingScreen extends StatefulWidget {
  const MapWaitingScreen({super.key});

  @override
  State<MapWaitingScreen> createState() => _MapWaitingScreenState();
}

class _MapWaitingScreenState extends State<MapWaitingScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Timer _timer;
  int _currentSeconds = 10;

  @override
  void initState() {
    super.initState();
    
    // Initialize animation controller for the circular progress
    _animationController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    );

    // Start the countdown animation
    _animationController.forward();

    // Start the timer
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_currentSeconds > 0) {
          _currentSeconds--;
        } else {
          _timer.cancel();
          _navigateToTrackingScreen();
        }
      });
    });
  }

  void _navigateToTrackingScreen() {
    // Navigate to your tracking screen
    // Replace 'TrackingScreen' with your actual tracking screen widget
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const TrackingScreen()),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background map image
          SizedBox.expand(
            child: Image.asset(
              'assets/map.png',
              fit: BoxFit.cover,
            ),
          ),

          // Back button at top-left
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 10,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.arrow_back, color: Colors.black),
            ),
          ),

          // Bottom status bar
          Positioned(
            left: 16,
            right: 16,
            bottom: 30,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.black12,
                    child: Icon(Icons.person_outline, color: Colors.black),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      'Waiting for Order pickup response!',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  // Timer with circular progress
                  SizedBox(
                    width: 36,
                    height: 36,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Background circle
                        Container(
                          width: 36,
                          height: 36,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFF6B00),
                            shape: BoxShape.circle,
                          ),
                        ),
                        // Circular progress indicator
                        SizedBox(
                          width: 36,
                          height: 36,
                          child: AnimatedBuilder(
                            animation: _animationController,
                            builder: (context, child) {
                              return CircularProgressIndicator(
                                value: 1.0 - _animationController.value,
                                strokeWidth: 3,
                                backgroundColor: Colors.transparent,
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                  Colors.red,
                                ),
                              );
                            },
                          ),
                        ),
                        // Timer icon and seconds
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.hourglass_bottom,
                              color: Colors.white,
                              size: 12,
                            ),
                            Text(
                              '$_currentSeconds',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
