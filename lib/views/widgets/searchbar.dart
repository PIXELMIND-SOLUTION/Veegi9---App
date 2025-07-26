import 'dart:async';
import 'package:flutter/material.dart';

class SearchBarWithAnimatedHint extends StatefulWidget {
  const SearchBarWithAnimatedHint({super.key});

  @override
  State<SearchBarWithAnimatedHint> createState() =>
      _SearchBarWithAnimatedHintState();
}

class _SearchBarWithAnimatedHintState extends State<SearchBarWithAnimatedHint> {
  final List<String> categories = ['Biryani', 'Burger', 'Pizza', 'Momos'];
  int currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startCategoryRotation();
  }

  void _startCategoryRotation() {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        currentIndex = (currentIndex + 1) % categories.length;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border:
              Border.all(color: const Color.fromARGB(255, 192, 192, 192)),
          boxShadow: [
            BoxShadow(
              color:
                  const Color.fromARGB(255, 202, 197, 197).withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: "Search for '${categories[currentIndex]}'",
            prefixIcon: const Icon(Icons.search, color: Colors.grey),
            suffixIcon: const Icon(Icons.tune, color: Colors.grey),
            border: InputBorder.none,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
      ),
    );
  }
}
