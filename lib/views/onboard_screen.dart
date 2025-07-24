import 'package:flutter/material.dart';
import 'package:veeginine/views/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingData> _onboardingData = [
    OnboardingData(
      title: "Delicious food,\ndelivered fast!",
      subtitle: "Craving something? Get your favorite\nmeals from top restaurants delivered\nto your doorstep.",
      imagePath: "assets/onboard1.png",
    ),
    OnboardingData(
      title: "Track your order\nin real-time!",
      subtitle: "Stay updated with live tracking and\nget notifications when your food\nis on the way.",
      imagePath: "assets/onboard2.png",
    ),
    OnboardingData(
      title: "Safe & secure\npayment!",
      subtitle: "Multiple payment options with\nsecure transactions. Pay with\ncards, wallets, or cash.",
      imagePath: "assets/onboard3.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top navigation (Skip or Back arrow)
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back arrow (only show after first screen)
                  if (_currentPage > 0)
                    GestureDetector(
                      onTap: () {
                        _pageController.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.grey[700],
                          size: 20,
                        ),
                      ),
                    )
                  else
                    SizedBox(width: 40), // Placeholder for alignment
                  
                  // Skip button
                  TextButton(
                    onPressed: () {
                      _navigateToNextScreen();
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Page view content
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: _onboardingData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      children: [
                        // Image container with exact design
                        Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          width: double.infinity,
                          child: Center(
                            child: Image.asset(
                              _onboardingData[index].imagePath,
                              height: MediaQuery.of(context).size.height * 0.45,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        
                        SizedBox(height: 30),
                        
                        // Title with exact styling
                        Text(
                          _onboardingData[index].title,
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                            height: 1.1,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        
                        SizedBox(height: 20),
                        
                        // Subtitle with exact styling
                        Text(
                          _onboardingData[index].subtitle,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                            height: 1.4,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            
            // Bottom section with indicators and button
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 0, 30.0, 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Page indicators - exact yellow design
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _onboardingData.length,
                      (index) => AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        margin: EdgeInsets.symmetric(horizontal: 3),
                        width: _currentPage == index ? 30 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: _currentPage == index 
                              ? Color(0xFFFFD700) // Exact yellow from image
                              : Color(0xFFE0E0E0),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  
                  
                  // Circular yellow button with arrow - exact design
                  Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onTap: () {
                        if (_currentPage < _onboardingData.length - 1) {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          _navigateToNextScreen();
                        }
                      },
                      child: Container(
                        width: 65,
                        height: 65,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFD700), // Exact yellow from image
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFFFD700).withOpacity(0.3),
                              blurRadius: 15,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIconForPage(int index) {
    switch (index) {
      case 0:
        return Icons.restaurant_menu;
      case 1:
        return Icons.delivery_dining;
      case 2:
        return Icons.payment;
      default:
        return Icons.restaurant_menu;
    }
  }

  void _navigateToNextScreen() {
    // Navigate to your main app screen
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
  }
}

class OnboardingData {
  final String title;
  final String subtitle;
  final String imagePath;

  OnboardingData({
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });
}
