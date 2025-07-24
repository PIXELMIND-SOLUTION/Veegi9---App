import 'package:flutter/material.dart';
import 'package:veeginine/views/help_screen.dart';
import 'package:veeginine/views/location_screen.dart';
import 'package:veeginine/views/personal_information.dart';

class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.person_outline, color: Colors.black),
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Account'),
            const SizedBox(height: 8),
            _buildTile(context, Icons.person_outline, 'Personal information', 'PersonalInfoScreen'),
            _buildTile(context, Icons.location_on_outlined, 'Change Address', 'LocationSelectorPage'),
            _buildTile(context, Icons.history, 'Order History', 'OrderHistoryScreen'),
            const SizedBox(height: 24),
            _buildSectionTitle('Support'),
            const SizedBox(height: 8),
            _buildTile(context, Icons.help_outline, 'Need Help?', 'HelpScreen'),
            _buildTile(context, Icons.phone_outlined, 'Contact Us', 'ContactScreen'),
            _buildLogoutTile(),
          ],
        ),
      ),
    );
    
  void _handleLogout(BuildContext context) {
    // Add your logout logic here
    // For example: clear user data, navigate to login screen, etc.
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Add actual logout logic here
                // Navigator.pushReplacementNamed(context, '/login');
              },
              child: Text('Logout'),
            ),
          ],
        );
      },
    );
  }
}

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.grey,
      ),
    );
  }

  Widget _buildTile(BuildContext context, IconData icon, String label, String routeName) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.grey[700]),
        title: Text(
          label,
          style: const TextStyle(fontSize: 14),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: () => _navigateToScreen(context, routeName),
      ),
    );
  }

  void _navigateToScreen(BuildContext context, String routeName) {
    Widget destinationScreen;
    
    switch (routeName) {
      case 'PersonalInfoScreen':
        destinationScreen = PersonalInformationScreen();
        break;
      case 'LocationSelectorPage':
        destinationScreen = LocationSelectorPage();
        break;
      case 'OrderHistoryScreen':
        destinationScreen = LocationSelectorPage();
        break;
      case 'HelpScreen':
        destinationScreen = HelpScreen();
        break;
      case 'ContactScreen':
        destinationScreen = ContactScreen();
        break;
      default:
        return; // Don't navigate if route is not found
    }
    
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => destinationScreen),
    );
  }

  Widget _buildLogoutTile() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red.shade100),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: const Icon(Icons.logout, color: Colors.red),
        title: const Text(
          'Logout',
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.red),
        onTap: () {
          // Handle logout logic here
        },
      ),
    );
  }
}