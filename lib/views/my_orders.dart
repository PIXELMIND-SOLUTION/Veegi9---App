import 'package:flutter/material.dart';

class Order {
  final String name;
  final String restaurant;
  final String price;
  final String deliveryTime;
  final String distance;
  final String image;
  final double rating;
  final int reviews;
  final String location;

  Order(
      {required this.name,
      required this.restaurant,
      required this.price,
      required this.deliveryTime,
      required this.distance,
      required this.image,
      this.rating = 0.0,
      this.reviews = 0,
      required this.location});
}

class MyOrdersScreen extends StatefulWidget {
  @override
  _MyOrdersScreenState createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Ongoing orders array
  final List<Order> ongoingOrders = [
    Order(
        name: 'Chicken Biriyani Bone...',
        restaurant: 'Pista House',
        price: '₹250',
        deliveryTime: '15 min',
        distance: '1.5 km',
        image: 'assets/biryani.png',
        location: 'Kakinada'),
    Order(
        name: 'Chicken Biriyani Bone...',
        restaurant: 'Pista House',
        price: '₹250',
        deliveryTime: '15 min',
        distance: '1.5 km',
        image: 'assets/biryani.png',
        location: 'Kakinada'),
    Order(
        name: 'Chicken Biriyani Bone...',
        restaurant: 'Pista House',
        price: '₹250',
        deliveryTime: '15 min',
        distance: '1.5 km',
        image: 'assets/biryani.png',
        location: 'Kakinada'),
    Order(
        name: 'Chicken Biriyani Bone...',
        restaurant: 'Pista House',
        price: '₹250',
        deliveryTime: '15 min',
        distance: '1.5 km',
        image: 'assets/biryani.png',
        location: 'Kakinada'),
    Order(
        name: 'Chicken Biriyani Bone...',
        restaurant: 'Pista House',
        price: '₹250',
        deliveryTime: '15 min',
        distance: '1.5 km',
        image: 'assets/biryani.png',
        location: 'Kakinada'),
    Order(
        name: 'Chicken Biriyani Bone...',
        restaurant: 'Pista House',
        price: '₹250',
        deliveryTime: '15 min',
        distance: '1.5 km',
        image: 'assets/biryani.png',
        location: 'Kakinada'),
  ];

  // Previous orders array
  final List<Order> previousOrders = [
    Order(
        name: 'Chicken Biriyani with boneless...',
        restaurant: 'Pista House',
        price: '₹250',
        deliveryTime: '',
        distance: '',
        image: 'assets/biryanni.png',
        rating: 4.2,
        reviews: 2941,
        location: 'Kakinada'),
    Order(
        name: 'Chicken Biriyani with boneless...',
        restaurant: 'Pista House',
        price: '₹250',
        deliveryTime: '',
        distance: '',
        image: 'assets/biryanni.png',
        rating: 4.2,
        reviews: 2941,
        location: 'Kakinada'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.shopping_bag_outlined, color: Colors.black),
        title: Text(
          'My Orders',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        bottom: PreferredSize(
  preferredSize: const Size.fromHeight(60),
  child: Material( // <- Wrap in Material to prevent default underline
    color: Colors.transparent,
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
          color: Colors.yellow.shade600,
          borderRadius: BorderRadius.circular(25),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.zero,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.grey.shade600,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
        tabs: const [
          Tab(text: 'Ongoing'),
          Tab(text: 'Previous'),
        ],
      ),
    ),
  ),
)

      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Ongoing Orders Tab
          _buildOngoingOrdersList(),
          // Previous Orders Tab
          _buildPreviousOrdersList(),
        ],
      ),
    );
  }

  Widget _buildOngoingOrdersList() {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: ongoingOrders.length,
      itemBuilder: (context, index) {
        final order = ongoingOrders[index];
        return _buildOngoingOrderCard(order);
      },
    );
  }

  Widget _buildPreviousOrdersList() {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: previousOrders.length,
      itemBuilder: (context, index) {
        final order = previousOrders[index];
        return _buildPreviousOrderCard(order);
      },
    );
  }

  Widget _buildOngoingOrderCard(Order order) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  order.image,
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),

              // Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title and price row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            order.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${order.price}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      order.restaurant,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 6),

                    // Location
                    Row(
                      children: [
                        const Icon(Icons.location_on,
                            size: 14, color: Colors.amber),
                        const SizedBox(width: 4),
                        Text(
                          order.location,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),

                    // Delivery Info
                    Row(
                      children: [
                        const Icon(Icons.access_time,
                            size: 14, color: Colors.amber),
                        const SizedBox(width: 4),
                        Text(
                          '${order.deliveryTime} | ${order.distance} | Free Delivery',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.grey.shade400),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text(
                    'Cancel Order',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow.shade600,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Navigate',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPreviousOrderCard(Order order) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Section - Text and details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Non-veg icon
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.brown,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Center(
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Colors.brown,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                // Name
                Text(
                  order.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),

                // Price
                Text(
                  '₹${order.price}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 6),

                // Rating
                Row(
                  children: [
                    const Icon(Icons.star, size: 14, color: Colors.green),
                    const SizedBox(width: 4),
                    Text(
                      '${order.rating} (${order.reviews})',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Reorder button
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.yellow.shade600),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                  ),
                  child: Text(
                    'Reorder',
                    style: TextStyle(
                      color: Colors.yellow.shade700,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 16),

          // Right Section - Image and Heart
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  order.image,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 6,
                right: 6,
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.favorite_border,
                    size: 16,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
