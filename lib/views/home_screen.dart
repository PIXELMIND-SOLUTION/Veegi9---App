import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veeginine/helper/storage_helper.dart';
import 'package:veeginine/providers/location_provider.dart';
import 'package:veeginine/views/menu_screen.dart';
import 'package:veeginine/views/notification_screen.dart';
import 'package:veeginine/views/search_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:veeginine/views/widgets/searchbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? userId;
  bool _isInitializing = true;
  bool isLoadingCurrentLocation = false;

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    try {
      // Load user ID first
      await _loadUserId();
      await _handleCurrentLocation();

      // Initialize providers in parallel
      // await Future.wait([
      //   Provider.of<CategoryProvider>(context, listen: false).fetchCategories(),
      //   if (userId != null) _handleCurrentLocation(),
      // ]);
    } catch (e) {
      debugPrint('Initialization error: $e');
    } finally {
      if (mounted) {
        setState(() => _isInitializing = false);
      }
    }
  }

  Future<void> _loadUserId() async {
    final user = UserPreferences.getUser();
    if (user != null && mounted) {
      setState(() {
        userId = user.userId;
      });
    }
  }

  void _showError(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  Future<void> _handleCurrentLocation() async {
    setState(() {
      isLoadingCurrentLocation = true;
    });

    try {
      final locationProvider =
          Provider.of<LocationProvider>(context, listen: false);
      await locationProvider.initLocation(userId.toString());

      if (mounted) {
        if (locationProvider.hasError) {
          _showError(locationProvider.errorMessage);
        }
      }
    } catch (e) {
      if (mounted) {
        _showError("Failed to get current location: ${e.toString()}");
      }
    } finally {
      if (mounted) {
        setState(() {
          isLoadingCurrentLocation = false;
        });
      }
    }
  }

  final List<Map<String, dynamic>> _categories = [
    {'title': 'Biryani', 'image': "assets/biryani.png"},
    {'title': 'Meals', 'image': "assets/meals.png"},
    {'title': 'Tiffins', 'image': "assets/tiffins.png"},
    {'title': 'Icecreams', 'image': "assets/icecream.png"},
    {'title': 'Biryani', 'image': "assets/biryani.png"},
    {'title': 'Meals', 'image': "assets/meals.png"},
    {'title': 'Tiffins', 'image': "assets/tiffins.png"},
    {'title': 'Icecreams', 'image': "assets/icecream.png"},
  ];

  final List<Map<String, dynamic>> restaurants = [
    {
      'name': 'Biryani',
      'price': '₹250',
      'description': 'All types of Biryanis',
      'location': 'Kakinada',
      'rating': 4.2,
      'image': "assets/biryanni.png"
    },
    {
      'name': 'Shawarma',
      'price': '₹180',
      'description': 'Best Lebanese Shawarma',
      'location': 'Calicut',
      'rating': 4.5,
      'image': "assets/biryanni.png"
    },
    {
      'name': 'Pizza',
      'price': '₹350',
      'description': 'Cheesy and delicious',
      'location': 'Bangalore',
      'rating': 4.7,
      'image': "assets/biryanni.png"
    },
  ];

  final List<Map<String, dynamic>> restaurant = [
    {
      'name': 'Dwaraka Tiffins',
      'description': 'All types of Biryanis',
      'location': 'Kakinada',
      'rating': 4.2,
      'image': "assets/biryanni.png"
    },
    {
      'name': 'Radha kitchen',
      'description': 'Best Lebanese Shawarma',
      'location': 'Calicut',
      'rating': 4.5,
      'image': "assets/biryanni.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final double textScaleFactor = MediaQuery.of(context).textScaleFactor;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 16,
        title: const Row(
          children: [
            Icon(Icons.home_outlined, color: Colors.black),
            SizedBox(width: 8),
            Text(
              'Home',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Consumer<LocationProvider>(
                  builder: (context, locationProvider, child) {
                    return GestureDetector(
                      onTap: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                LocationSearchScreen(userId: userId.toString()),
                          ),
                        );

                        if (result == true && context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text('Updating cars for new location...'),
                              backgroundColor: Colors.blue,
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              size: 24,
                              color: Color(0XFF120698),
                            ),
                            if (locationProvider.isLoading)
                              const Text(
                                'Fetching...',
                                style:
                                    TextStyle(fontSize: 11, color: Colors.grey),
                              )
                            else if (locationProvider.hasError)
                              const Text(
                                'Tap to set location',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Color(0XFF120698),
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            else
                              Text(
                                locationProvider.address,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Icon(
                  Icons.notifications_none_outlined,
                  size: 34,
                ),
              )
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Search Bar
           SearchBarWithAnimatedHint(),

            // Food Delivery Banner
            Image.asset("assets/carousel.png"),

            const SizedBox(height: 24),

            // Categories Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: const [
                      Text(
                        'See All',
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 14,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 10,
            ),

            // Categories Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                height: 100, // Height to accommodate image + text
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: _categories
                      .map((category) => Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: _buildCategoryItem(
                                category['title'], category['image']),
                          ))
                      .toList(),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Nearby Restaurants Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Nearby Restaurants',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RestaurantMenuScreen()));
                    },
                    child: Row(
                      children: const [
                        Text(
                          'See All',
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 10,
            ),

            // Nearby Restaurants List
            SizedBox(
              height: 306,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: restaurants.length,
                itemBuilder: (context, index) {
                  final item = restaurants[index];
                  return _buildRestaurantCard(
                    item['name'],
                    item['price'],
                    item['description'],
                    item['location'],
                    item['rating'],
                    item['image'],
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            // Top Restaurants Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Top Restaurants in Kakinada',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: const [
                      Text(
                        'See All',
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 14,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),

            // Top Restaurants List
            SizedBox(
              height: 265,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: restaurant.length,
                itemBuilder: (context, index) {
                  final item = restaurant[index];
                  return _buildTopRestaurantCard(
                    item['name'],
                    item['description'],
                    item['location'],
                    item['rating'],
                    item['image'],
                  );
                },
              ),
            ),

            const SizedBox(height: 80), // Bottom padding for navigation bar
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(String title, String image) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 6,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Image.asset(image),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildRestaurantCard(String name, String price, String description,
      String location, double rating, String image) {
    return Container(
      margin: EdgeInsets.only(right: 12),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: const Color.fromARGB(255, 163, 163, 163))),
      child: Container(
        width: 176,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 176,
                  decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(12)),
                    image: DecorationImage(
                      image: AssetImage(
                          image), // Use NetworkImage(image) if it's a URL
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Icon(
                      Icons.favorite_border,
                      size: 24,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              color: Color(0XFFFFD600),
                              borderRadius: BorderRadius.circular(12)),
                          child: const Icon(Icons.star,
                              color: Colors.white, size: 12),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          rating.toString(),
                          style: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  price,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  description,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: Colors.yellow,
                      size: 22,
                    ),
                    Text(
                      location,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopRestaurantCard(String name, String description,
      String location, double rating, String image) {
    return Container(
      margin: EdgeInsets.only(right: 12),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: const Color.fromARGB(255, 163, 163, 163))),
      child: Container(
        width: 176,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(12)),
                    image: DecorationImage(
                      image: AssetImage(
                          image), // Use NetworkImage(image) if it's a URL
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Icon(
                      Icons.favorite_border,
                      size: 24,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: Color(0XFFFFD600),
                          borderRadius: BorderRadius.circular(12)),
                      child:
                          const Icon(Icons.star, color: Colors.white, size: 12),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      rating.toString(),
                      style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  description,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: Colors.yellow,
                      size: 22,
                    ),
                    Text(
                      location,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
