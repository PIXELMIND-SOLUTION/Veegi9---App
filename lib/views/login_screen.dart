import 'package:flutter/material.dart';
import 'package:veeginine/views/otp_screen.dart';
import 'package:veeginine/views/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Login',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Illustration Section
            Image.asset("assets/login.png"),
            const SizedBox(height: 40),
            
            // Form Section
            _buildFormSection(),
          ],
        ),
      ),
    );
  }


  Widget _buildDecorativeCard(double? left, double? top, double width, double height, double rotation, {double? right, double? bottom}) {
    return Positioned(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      child: Transform.rotate(
        angle: rotation * 3.14159 / 180,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneMockup() {
    return Center(
      child: Container(
        width: 120,
        height: 200,
        decoration: BoxDecoration(
          color: const Color(0xFF333333),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Avatar
                Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFD700),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.person, size: 16, color: Colors.white),
                ),
                const SizedBox(height: 8),
                
                // Form Lines
                _buildFormLine(60),
                const SizedBox(height: 4),
                _buildFormLine(40),
                const SizedBox(height: 4),
                _buildFormLine(60),
                const SizedBox(height: 10),
                
                // Button
                Container(
                  width: 60,
                  height: 20,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFD700),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormLine(double width) {
    return Container(
      width: width,
      height: 3,
      decoration: BoxDecoration(
        color: const Color(0xFFFFD700),
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  Widget _buildCharacter() {
    return SizedBox(
      width: 60,
      height: 120,
      child: Stack(
        children: [
          // Head
          Positioned(
            top: 0,
            left: 10,
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Color(0xFFDEB887),
                shape: BoxShape.circle,
              ),
              child: Stack(
                children: [
                  // Hair
                  Positioned(
                    top: -5,
                    left: 2.5,
                    child: Container(
                      width: 35,
                      height: 25,
                      decoration: const BoxDecoration(
                        color: Color(0xFF333333),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Body
          Positioned(
            top: 35,
            left: 0,
            child: Container(
              width: 60,
              height: 80,
              decoration: const BoxDecoration(
                color: Color(0xFF333333),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Stack(
                children: [
                  // Shirt
                  Positioned(
                    top: 20,
                    left: 5,
                    child: Container(
                      width: 50,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFD700),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                    ),
                  ),
                  
                  // Arm
                  Positioned(
                    top: 25,
                    right: -10,
                    child: Container(
                      width: 15,
                      height: 30,
                      decoration: BoxDecoration(
                        color: const Color(0xFFDEB887),
                        borderRadius: BorderRadius.circular(8),
                      ),
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

  Widget _buildLockIcon() {
    return Transform.rotate(
      angle: 15 * 3.14159 / 180,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: const Color(0xFFFFD700),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: const Icon(
          Icons.lock,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }

  Widget _buildDecorativeElements() {
    return Positioned(
      bottom: 30,
      right: 20,
      child: CustomPaint(
        size: const Size(30, 40),
        painter: LeafPainter(),
      ),
    );
  }

  Widget _buildFormSection() {
    return Container(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Username Field
          _buildFormField(
            label: 'User Name Or Email Address',
            controller: _usernameController,
            placeholder: 'Type your user name',
            isRequired: true,
          ),
          const SizedBox(height: 20),
          
          // Password Field
          _buildFormField(
            label: 'Password',
            controller: _passwordController,
            placeholder: '••••••',
            isRequired: true,
            isPassword: true,
          ),
          const SizedBox(height: 20),
          
          // Options Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: Checkbox(
                      value: _rememberMe,
                      onChanged: (value) {
                        setState(() {
                          _rememberMe = value ?? false;
                        });
                      },
                      activeColor: const Color(0xFFFFD700),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Remember me',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  // Handle forgot password
                },
                child: const Text(
                  'Forgot Your Password?',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          
          // Login Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _handleLogin,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFD700),
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Log In',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          
          // Sign Up Link
          Center(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 14, color: Colors.grey),
                children: [
                  const TextSpan(text: "Don't have account ? "),
                  WidgetSpan(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
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

  Widget _buildFormField({
    required String label,
    required TextEditingController controller,
    required String placeholder,
    bool isRequired = false,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            children: [
              TextSpan(text: label),
              if (isRequired)
                const TextSpan(
                  text: '*',
                  style: TextStyle(color: Colors.red),
                ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: isPassword ? _obscurePassword : false,
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: const TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFFFD700)),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  )
                : null,
          ),
        ),
      ],
    );
  }

  void _handleLogin() {
    if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all required fields'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Handle login logic here
    Navigator.push(context, MaterialPageRoute(builder: (context)=>OTPVerificationScreen()));
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Login Successful'),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

// Custom painter for decorative leaf elements
class LeafPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFFFD700)
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(size.width * 0.5, 0);
    path.quadraticBezierTo(size.width, size.height * 0.3, size.width * 0.8, size.height);
    path.quadraticBezierTo(size.width * 0.3, size.height * 0.8, 0, size.height * 0.5);
    path.quadraticBezierTo(size.width * 0.2, size.height * 0.2, size.width * 0.5, 0);
    
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

