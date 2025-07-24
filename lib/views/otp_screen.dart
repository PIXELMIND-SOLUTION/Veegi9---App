import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:veeginine/views/home_screen.dart';
import 'package:veeginine/views/main_screen.dart';

class OTPVerificationScreen extends StatefulWidget {
  final String phoneNumber;
  
  const OTPVerificationScreen({
    Key? key,
    this.phoneNumber = "9898989898",
  }) : super(key: key);

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final List<TextEditingController> _otpControllers = List.generate(4, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());
  
  @override
  void initState() {
    super.initState();
    // Pre-fill first digit as shown in the image
    _otpControllers[0].text = "6";
  }

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
          'OTP Verification',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  
                  // Avatar Section
                  Image.asset("assets/profile.png",width: 80,height: 80,),
                  const SizedBox(height: 40),
                  
                  // Message Section
                  _buildMessageSection(),
                  const SizedBox(height: 40),
                  
                  // OTP Input Section
                  _buildOTPInputSection(),
                  const SizedBox(height: 30),
                  
                  // Resend Section
                  _buildResendSection(),
                ],
              ),
            ),
            
            // Bottom Section
            _buildBottomSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarSection() {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFE0E0E0), Color(0xFFD0D0D0)],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Face
          Positioned(
            top: 15,
            left: 20,
            child: Container(
              width: 40,
              height: 35,
              decoration: const BoxDecoration(
                color: Color(0xFFFFDBB5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
            ),
          ),
          
          // Hair
          Positioned(
            top: 10,
            left: 18,
            child: Container(
              width: 44,
              height: 25,
              decoration: const BoxDecoration(
                color: Color(0xFFD2691E),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(22),
                  topRight: Radius.circular(22),
                ),
              ),
            ),
          ),
          
          // Shirt
          Positioned(
            bottom: 8,
            left: 15,
            child: Container(
              width: 50,
              height: 35,
              decoration: const BoxDecoration(
                color: Color(0xFF4A90E2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
            ),
          ),
          
          // Eyes
          Positioned(
            top: 25,
            left: 28,
            child: Row(
              children: [
                Container(
                  width: 3,
                  height: 3,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 3,
                  height: 3,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
          
          // Mouth
          Positioned(
            top: 35,
            left: 35,
            child: Container(
              width: 10,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageSection() {
    return Column(
      children: [
        const Text(
          'We have send verification code to your phone number',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'at ${widget.phoneNumber}',
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildOTPInputSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(4, (index) {
        return Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _otpControllers[index].text.isNotEmpty 
                  ? const Color(0xFF4A90E2)
                  : const Color(0xFFE0E0E0),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextField(
            controller: _otpControllers[index],
            focusNode: _focusNodes[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              counterText: '',
            ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            onChanged: (value) {
              setState(() {});
              
              if (value.isNotEmpty && index < 3) {
                _focusNodes[index + 1].requestFocus();
              } else if (value.isEmpty && index > 0) {
                _focusNodes[index - 1].requestFocus();
              }
              
              // Auto verify when all fields are filled
              if (index == 3 && value.isNotEmpty) {
                _verifyOTP();
              }
            },
          ),
        );
      }),
    );
  }

  Widget _buildResendSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't Receive code? ",
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        GestureDetector(
          onTap: _resendOTP,
          child: const Text(
            'Resend',
            style: TextStyle(
              fontSize: 14,
              color: Colors.blue,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomSection() {
    return Column(
      children: [
        // Verify Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _isOTPComplete() ? _verifyOTP : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: 
                   const Color(0xFFFFD700),
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              elevation: 0,
            ),
            child: const Text(
              'Verify',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        
        // Register Link
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Don't have account ? ",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigate to register screen
                Navigator.pushNamedAndRemoveUntil(
                  context, 
                  '/register', 
                  (route) => false,
                );
              },
              child: const Text(
                'Register',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  bool _isOTPComplete() {
    return _otpControllers.every((controller) => controller.text.isNotEmpty);
  }

  void _verifyOTP() {
    String otp = _otpControllers.map((controller) => controller.text).join();
    
    if (otp.length == 4) {
      // Show loading
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFFD700)),
          ),
        ),
      );
      
      // Simulate API call
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pop(context); // Close loading dialog
        
        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('OTP verified successfully!'),
            backgroundColor: Colors.green,
          ),
        );
        
        Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreen()));
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter complete OTP'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _resendOTP() {
    // Clear all fields
    for (var controller in _otpControllers) {
      controller.clear();
    }
    setState(() {});
    
    // Focus on first field
    _focusNodes[0].requestFocus();
    
    // Show message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('OTP resent to ${widget.phoneNumber}'),
        backgroundColor: Colors.blue,
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }
}

// Usage example:
/*
// Navigate to OTP screen
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const OTPVerificationScreen(
      phoneNumber: "9898989898",
    ),
  ),
);
*/