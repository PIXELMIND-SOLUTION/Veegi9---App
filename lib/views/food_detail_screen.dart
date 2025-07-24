import 'package:flutter/material.dart';

class FoodDetailScreen extends StatefulWidget {
  const FoodDetailScreen({super.key});

  @override
  State<FoodDetailScreen> createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  int selectedVariation = 0; // 0 for Half, 1 for Full
  int selectedPlate = 0; // 0 for 1 Plate, 1 for 2 Plates
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Food Image with dots indicator
          Container(
            height: 375,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/biryanni.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                // Back button
                Positioned(
                  top: 50,
                  left: 16,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        size: 24,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
                // Dots indicator
                Positioned(
                  bottom: 16,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        4,
                        (index) => Container(
                              margin: const EdgeInsets.symmetric(horizontal: 2),
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: index == 0
                                    ? Colors.white
                                    : Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            )),
                  ),
                ),
              ],
            ),
          ),

          // Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Veg indicator
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Chicken Boneless Biriyani',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  // Restaurant name and location
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.yellow,
                        size: 22,
                      ),
                      const Text(
                        'Rajasthani Junction, Kokanda',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Price
                  const Text(
                    '₹250',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Rating and delivery info
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Rating section
                      Column(
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.star, color: Colors.amber, size: 20),
                              SizedBox(width: 4),
                              Text(
                                '4.2',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Ratings',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),

                      // Divider
                      Container(
                        height: 32,
                        width: 1,
                        color: Colors.grey.shade300,
                      ),

                      // Total ratings section
                      Column(
                        children: const [
                          Text(
                            '1k+',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Ratings',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),

                      // Divider
                      Container(
                        height: 32,
                        width: 1,
                        color: Colors.grey.shade300,
                      ),

                      // Delivery time section
                      Column(
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.access_time,
                                  size: 20, color: Colors.amber),
                              SizedBox(width: 4),
                              Text(
                                '15 min',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Delivery',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Description
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Variation
                  const Text(
                    'Variation',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 4),

                  const Text(
                    'Select any 1',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Variation options
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        _buildVariationOption('Half', '₹225', 0),
                        const SizedBox(height: 12),
                        _buildVariationOption('Full', '₹310', 1),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Add on plate
                  const Text(
                    'Add on plate',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 4),

                  const Text(
                    'Select upto 2',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Plate options
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        _buildPlateOption('1 Plate', '+₹25', 0),
                        const SizedBox(height: 12),
                        _buildPlateOption('2 Plates', '+₹40', 1),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Quantity selector
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (quantity > 1) {
                              setState(() {
                                quantity--;
                              });
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: const Icon(
                              Icons.remove,
                              color: Colors.amber, // Yellow color
                              size: 20,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Text(
                          quantity.toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber, // Yellow color
                          ),
                        ),
                        const SizedBox(width: 20),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              quantity++;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: const Icon(
                              Icons.add,
                              color: Colors.amber, // Yellow color
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),

          // Bottom buttons
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Divider(),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0XFFFFD600)),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text(
                            'Add to Cart',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          color: Color(0XFFFFD600),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text(
                            'Order Now',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVariationOption(String title, String price, int index) {
    bool isSelected = selectedVariation == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedVariation = index;
        });
      },
      child: Row(
        children: [
          // Brown square with dot
          Container(
            width: 20,
            height: 20,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.brown, width: 1.5),
              borderRadius: BorderRadius.circular(2),
            ),
            child: Center(
              child: Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: Colors.brown,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),

          // Variation label
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),

          const Spacer(),

          // Price
          Text(
            price,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),

          const SizedBox(width: 8),

          // Radio circle
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? Colors.orange : Colors.grey,
                width: 2,
              ),
            ),
            child: isSelected
                ? Center(
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.orange,
                      ),
                    ),
                  )
                : null,
          ),
        ],
      ),
    );
  }

  Widget _buildPlateOption(String title, String price, int index) {
    bool isSelected = selectedPlate == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPlate = index;
        });
      },
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Text(
            price,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              border: Border.all(
                color: isSelected ? Colors.orange : Colors.grey,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(2),
            ),
            child: isSelected
                ? const Icon(
                    Icons.check,
                    size: 14,
                    color: Colors.orange,
                  )
                : null,
          ),
        ],
      ),
    );
  }
}
