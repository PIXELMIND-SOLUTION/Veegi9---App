import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  // Static data array
  final List<Map<String, dynamic>> favoriteItems = [
    {
      'id': 1,
      'name': 'Chicken Biriyani with boneless...',
      'price': 250,
      'rating': 4.2,
      'reviews': 2841,
      'image': 'assets/biryanni.png',
      'isVeg': false,
    },
    {
      'id': 2,
      'name': 'Chicken Biriyani with boneless...',
      'price': 250,
      'rating': 4.2,
      'reviews': 2841,
      'image': 'assets/biryanni.png',
      'isVeg': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Favourites',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: favoriteItems.length,
          itemBuilder: (context, index) {
            final item = favoriteItems[index];
return Container(
  margin: const EdgeInsets.only(bottom: 16),
  padding: const EdgeInsets.all(12),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: Colors.grey.shade300),
  ),
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Left side: Info
      Expanded(
        flex: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Veg / Non-Veg indicator
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                border: Border.all(
                  color: item['isVeg'] ? Colors.green : Colors.brown,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(2),
              ),
              child: Center(
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: item['isVeg'] ? Colors.green : Colors.brown,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),

            // Name
            Text(
              item['name'],
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),

            // Price
            Text(
              '₹${item['price']}',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 4),

            // Rating
            Row(
              children: [
                const Icon(Icons.star, size: 14, color: Colors.amber),
                const SizedBox(width: 4),
                Text(
                  '${item['rating']}',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0XFFFFD600),
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  '(${item['reviews']})',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // ADD Button
            Container(
              width: 80,
              height: 36,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: const Color.fromARGB(255, 196, 195, 195))
              ),
              child: const Center(
                child: Text(
                  'ADD',
                  style: TextStyle(
                    color: Color(0XFFFFD600),
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      const SizedBox(width: 16),

      // Right side: Image + heart
      ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          children: [
            Image.asset(
              item['image'],
              width: 133,
              height: 133,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 6,
              right: 6,
              child: Container(
                width: 28,
                height: 28,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.favorite_outline,
                  color: Colors.red,
                  size: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);

          },
        ),
      ),
    );
  }
}
