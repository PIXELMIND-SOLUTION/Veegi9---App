// import 'package:flutter/material.dart';

// class SignupScreen extends StatefulWidget {
//   const SignupScreen({Key? key}) : super(key: key);

//   @override
//   State<SignupScreen> createState() => _SignupScreenState();
// }

// class _SignupScreenState extends State<SignupScreen> {
//   final TextEditingController _firstNameController = TextEditingController();
//   final TextEditingController _lastNameController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF8F9FA),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 1,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text(
//           'Signup',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 20,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         centerTitle: false,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           children: [
//             // Illustration Section
//             Image.asset("assets/login.png",height: 303,),
//             const SizedBox(height: 10),
            
//             // Form Section
//             _buildFormSection(),
//           ],
//         ),
//       ),
//     );
//   }


//   Widget _buildDecorativeCard(double? left, double? top, double width, double height, double rotation, {double? right, double? bottom}) {
//     return Positioned(
//       left: left,
//       top: top,
//       right: right,
//       bottom: bottom,
//       child: Transform.rotate(
//         angle: rotation * 3.14159 / 180,
//         child: Container(
//           width: width,
//           height: height,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(8),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.08),
//                 blurRadius: 8,
//                 offset: const Offset(0, 2),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildPhoneMockup() {
//     return Center(
//       child: Container(
//         width: 140,
//         height: 240,
//         decoration: BoxDecoration(
//           color: const Color(0xFF333333),
//           borderRadius: BorderRadius.circular(25),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.25),
//               blurRadius: 20,
//               offset: const Offset(0, 8),
//             ),
//           ],
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(8),
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Column(
//               children: [
//                 // Phone Header
//                 Container(
//                   height: 30,
//                   decoration: const BoxDecoration(
//                     color: Color(0xFFF8F9FA),
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(20),
//                       topRight: Radius.circular(20),
//                     ),
//                   ),
//                   child: Center(
//                     child: Container(
//                       width: 40,
//                       height: 4,
//                       decoration: BoxDecoration(
//                         color: Colors.black,
//                         borderRadius: BorderRadius.circular(2),
//                       ),
//                     ),
//                   ),
//                 ),
                
//                 // Phone Content
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.all(15),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         // Avatar
//                         Container(
//                           width: 40,
//                           height: 40,
//                           decoration: const BoxDecoration(
//                             color: Color(0xFFFFD700),
//                             shape: BoxShape.circle,
//                           ),
//                           child: const Icon(
//                             Icons.person_add,
//                             size: 20,
//                             color: Colors.white,
//                           ),
//                         ),
//                         const SizedBox(height: 12),
                        
//                         // Title
//                         const Text(
//                           'Sign Up',
//                           style: TextStyle(
//                             fontSize: 12,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                           ),
//                         ),
//                         const SizedBox(height: 8),
                        
//                         // Form Lines
//                         _buildFormLine(80),
//                         const SizedBox(height: 6),
//                         _buildFormLine(60),
//                         const SizedBox(height: 6),
//                         _buildFormLine(85),
//                         const SizedBox(height: 6),
//                         _buildFormLine(70),
//                         const SizedBox(height: 15),
                        
//                         // Button
//                         Container(
//                           width: 80,
//                           height: 25,
//                           decoration: BoxDecoration(
//                             color: const Color(0xFFFFD700),
//                             borderRadius: BorderRadius.circular(60),
//                           ),
//                           child: const Center(
//                             child: Text(
//                               'Next',
//                               style: TextStyle(
//                                 fontSize: 10,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildFormLine(double width) {
//     return Container(
//       width: width,
//       height: 2,
//       decoration: BoxDecoration(
//         color: const Color(0xFFE0E0E0),
//         borderRadius: BorderRadius.circular(1),
//       ),
//     );
//   }

//   Widget _buildCharacter() {
//     return SizedBox(
//       width: 70,
//       height: 140,
//       child: Stack(
//         children: [
//           // Head
//           Positioned(
//             top: 0,
//             left: 15,
//             child: Container(
//               width: 40,
//               height: 40,
//               decoration: const BoxDecoration(
//                 color: Color(0xFFDEB887),
//                 shape: BoxShape.circle,
//               ),
//               child: Stack(
//                 children: [
//                   // Hair
//                   Positioned(
//                     top: -5,
//                     left: 2.5,
//                     child: Container(
//                       width: 35,
//                       height: 25,
//                       decoration: const BoxDecoration(
//                         color: Color(0xFF333333),
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(20),
//                           topRight: Radius.circular(20),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
          
//           // Body
//           Positioned(
//             top: 35,
//             left: 5,
//             child: Container(
//               width: 60,
//               height: 90,
//               decoration: const BoxDecoration(
//                 color: Color(0xFF333333),
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(30),
//                   topRight: Radius.circular(30),
//                   bottomLeft: Radius.circular(10),
//                   bottomRight: Radius.circular(10),
//                 ),
//               ),
//               child: Stack(
//                 children: [
//                   // Shirt
//                   Positioned(
//                     top: 20,
//                     left: 5,
//                     child: Container(
//                       width: 50,
//                       height: 45,
//                       decoration: const BoxDecoration(
//                         color: Color(0xFFFFD700),
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(25),
//                           topRight: Radius.circular(25),
//                         ),
//                       ),
//                     ),
//                   ),
                  
//                   // Left Arm
//                   Positioned(
//                     top: 25,
//                     left: -8,
//                     child: Transform.rotate(
//                       angle: -0.3,
//                       child: Container(
//                         width: 12,
//                         height: 35,
//                         decoration: BoxDecoration(
//                           color: const Color(0xFFDEB887),
//                           borderRadius: BorderRadius.circular(6),
//                         ),
//                       ),
//                     ),
//                   ),
                  
//                   // Right Arm (pointing)
//                   Positioned(
//                     top: 20,
//                     right: -12,
//                     child: Transform.rotate(
//                       angle: 0.5,
//                       child: Container(
//                         width: 12,
//                         height: 40,
//                         decoration: BoxDecoration(
//                           color: const Color(0xFFDEB887),
//                           borderRadius: BorderRadius.circular(6),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
          
//           // Legs
//           Positioned(
//             bottom: 0,
//             left: 15,
//             child: Row(
//               children: [
//                 Container(
//                   width: 12,
//                   height: 25,
//                   decoration: BoxDecoration(
//                     color: const Color(0xFF333333),
//                     borderRadius: BorderRadius.circular(6),
//                   ),
//                 ),
//                 const SizedBox(width: 6),
//                 Container(
//                   width: 12,
//                   height: 25,
//                   decoration: BoxDecoration(
//                     color: const Color(0xFF333333),
//                     borderRadius: BorderRadius.circular(6),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildLockIcon() {
//     return Transform.rotate(
//       angle: 15 * 3.14159 / 180,
//       child: Container(
//         width: 45,
//         height: 45,
//         decoration: BoxDecoration(
//           color: const Color(0xFFFFD700),
//           borderRadius: BorderRadius.circular(10),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.15),
//               blurRadius: 8,
//               offset: const Offset(0, 4),
//             ),
//           ],
//         ),
//         child: const Icon(
//           Icons.lock_open,
//           color: Colors.white,
//           size: 24,
//         ),
//       ),
//     );
//   }

//   Widget _buildLeafElements() {
//     return Column(
//       children: [
//         CustomPaint(
//           size: const Size(25, 30),
//           painter: LeafPainter(),
//         ),
//         const SizedBox(height: 5),
//         Transform.rotate(
//           angle: 45 * 3.14159 / 180,
//           child: CustomPaint(
//             size: const Size(20, 25),
//             painter: LeafPainter(),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildFormSection() {
//     return Column(
//       children: [
//         // First Name and Last Name Row
//         Row(
//           children: [
//             Expanded(
//               child: _buildFormField(
//                 label: 'First Name',
//                 controller: _firstNameController,
//                 placeholder: 'Manoj',
//                 isRequired: true,
//               ),
//             ),
//             const SizedBox(width: 15),
//             Expanded(
//               child: _buildFormField(
//                 label: 'Last Name',
//                 controller: _lastNameController,
//                 placeholder: 'Kumar',
//                 isRequired: true,
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 20),
        
//         // Phone Field
//         _buildFormField(
//           label: 'Phone',
//           controller: _phoneController,
//           placeholder: '1234567842',
//           isRequired: true,
//           keyboardType: TextInputType.phone,
//         ),
//         const SizedBox(height: 20),
        
//         // Email Field
//         _buildFormField(
//           label: 'Email',
//           controller: _emailController,
//           placeholder: 'Manojkumar@gmail.com',
//           isRequired: true,
//           keyboardType: TextInputType.emailAddress,
//         ),
//         const SizedBox(height: 40),
        
//         // Next Button
//         SizedBox(
//           width: double.infinity,
//           child: ElevatedButton(
//             onPressed: _handleSignup,
//             style: ElevatedButton.styleFrom(
//               backgroundColor: const Color(0xFFFFD700),
//               foregroundColor: Colors.black,
//               padding: const EdgeInsets.symmetric(vertical: 16),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(25),
//               ),
//               elevation: 0,
//             ),
//             child: const Text(
//               'Next',
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(height: 20),
        
//         // Sign In Link
//         Center(
//           child: RichText(
//             text: TextSpan(
//               style: const TextStyle(fontSize: 14, color: Colors.grey),
//               children: [
//                 const TextSpan(text: "Already have account ? "),
//                 WidgetSpan(
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                     child: const Text(
//                       'Sign in',
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.blue,
//                         decoration: TextDecoration.underline,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildFormField({
//     required String label,
//     required TextEditingController controller,
//     required String placeholder,
//     bool isRequired = false,
//     TextInputType keyboardType = TextInputType.text,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         RichText(
//           text: TextSpan(
//             style: const TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.w600,
//               color: Colors.grey,
//             ),
//             children: [
//               TextSpan(text: label),
//               if (isRequired)
//                 const TextSpan(
//                   text: '*',
//                   style: TextStyle(color: Colors.red),
//                 ),
//             ],
//           ),
//         ),
//         const SizedBox(height: 8),
//         TextField(
//           controller: controller,
//           keyboardType: keyboardType,
//           decoration: InputDecoration(
//             hintText: placeholder,
//             hintStyle: const TextStyle(color: Colors.grey),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: const BorderSide(color: Color(0xFFFFD700)),
//             ),
//             contentPadding: const EdgeInsets.symmetric(
//               horizontal: 16,
//               vertical: 12,
//             ),
//             fillColor: Colors.white,
//             filled: true,
//           ),
//         ),
//       ],
//     );
//   }

//   void _handleSignup() {
//     // Validate fields
//     if (_firstNameController.text.isEmpty ||
//         _lastNameController.text.isEmpty ||
//         _phoneController.text.isEmpty ||
//         _emailController.text.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Please fill in all required fields'),
//           backgroundColor: Colors.red,
//         ),
//       );
//       return;
//     }

//     // Handle signup logic here
//     print('Signup attempt:');
//     print('Name: ${_firstNameController.text} ${_lastNameController.text}');
//     print('Phone: ${_phoneController.text}');
//     print('Email: ${_emailController.text}');
    
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         content: Text('Signup successful! Moving to next step...'),
//         backgroundColor: Colors.green,
//       ),
//     );
    
//     // Navigate to next screen or login
//     // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NextScreen()));
//   }

//   @override
//   void dispose() {
//     _firstNameController.dispose();
//     _lastNameController.dispose();
//     _phoneController.dispose();
//     _emailController.dispose();
//     super.dispose();
//   }
// }

// // Custom painter for decorative leaf elements
// class LeafPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = const Color(0xFFFFD700)
//       ..style = PaintingStyle.fill;

//     final path = Path();
//     path.moveTo(size.width * 0.5, 0);
//     path.quadraticBezierTo(size.width, size.height * 0.3, size.width * 0.8, size.height);
//     path.quadraticBezierTo(size.width * 0.3, size.height * 0.8, 0, size.height * 0.5);
//     path.quadraticBezierTo(size.width * 0.2, size.height * 0.2, size.width * 0.5, 0);
    
//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }

// // Usage example:
// /*
// // Navigate to signup screen
// Navigator.push(
//   context,
//   MaterialPageRoute(builder: (context) => const SignupScreen()),
// );
// */












import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veeginine/providers/auth_provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _referralCodeController = TextEditingController();

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
          'Signup',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: Consumer<AuthProvider>(
        builder: (context, authProvider, child) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                // Illustration Section
                Image.asset("assets/login.png", height: 303),
                const SizedBox(height: 10),
                
                // Error Message Display
                if (authProvider.errorMessage != null)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      border: Border.all(color: Colors.red.shade200),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      authProvider.errorMessage!,
                      style: TextStyle(
                        color: Colors.red.shade700,
                        fontSize: 14,
                      ),
                    ),
                  ),
                
                // Form Section
                _buildFormSection(authProvider),
              ],
            ),
          );
        },
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
                color: Colors.black.withOpacity(0.08),
                blurRadius: 8,
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
        width: 140,
        height: 240,
        decoration: BoxDecoration(
          color: const Color(0xFF333333),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                // Phone Header
                Container(
                  height: 30,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF8F9FA),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ),
                
                // Phone Content
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Avatar
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFFD700),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.person_add,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 12),
                        
                        // Title
                        const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        
                        // Form Lines
                        _buildFormLine(80),
                        const SizedBox(height: 6),
                        _buildFormLine(60),
                        const SizedBox(height: 6),
                        _buildFormLine(85),
                        const SizedBox(height: 6),
                        _buildFormLine(70),
                        const SizedBox(height: 15),
                        
                        // Button
                        Container(
                          width: 80,
                          height: 25,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFD700),
                            borderRadius: BorderRadius.circular(60),
                          ),
                          child: const Center(
                            child: Text(
                              'Next',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
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
          ),
        ),
      ),
    );
  }

  Widget _buildFormLine(double width) {
    return Container(
      width: width,
      height: 2,
      decoration: BoxDecoration(
        color: const Color(0xFFE0E0E0),
        borderRadius: BorderRadius.circular(1),
      ),
    );
  }

  Widget _buildCharacter() {
    return SizedBox(
      width: 70,
      height: 140,
      child: Stack(
        children: [
          // Head
          Positioned(
            top: 0,
            left: 15,
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
            left: 5,
            child: Container(
              width: 60,
              height: 90,
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
                      height: 45,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFD700),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                    ),
                  ),
                  
                  // Left Arm
                  Positioned(
                    top: 25,
                    left: -8,
                    child: Transform.rotate(
                      angle: -0.3,
                      child: Container(
                        width: 12,
                        height: 35,
                        decoration: BoxDecoration(
                          color: const Color(0xFFDEB887),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                  ),
                  
                  // Right Arm (pointing)
                  Positioned(
                    top: 20,
                    right: -12,
                    child: Transform.rotate(
                      angle: 0.5,
                      child: Container(
                        width: 12,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xFFDEB887),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Legs
          Positioned(
            bottom: 0,
            left: 15,
            child: Row(
              children: [
                Container(
                  width: 12,
                  height: 25,
                  decoration: BoxDecoration(
                    color: const Color(0xFF333333),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                const SizedBox(width: 6),
                Container(
                  width: 12,
                  height: 25,
                  decoration: BoxDecoration(
                    color: const Color(0xFF333333),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ],
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
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: const Color(0xFFFFD700),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Icon(
          Icons.lock_open,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }

  Widget _buildLeafElements() {
    return Column(
      children: [
        CustomPaint(
          size: const Size(25, 30),
          painter: LeafPainter(),
        ),
        const SizedBox(height: 5),
        Transform.rotate(
          angle: 45 * 3.14159 / 180,
          child: CustomPaint(
            size: const Size(20, 25),
            painter: LeafPainter(),
          ),
        ),
      ],
    );
  }

  Widget _buildFormSection(AuthProvider authProvider) {
    return Column(
      children: [
        // First Name and Last Name Row
        Row(
          children: [
            Expanded(
              child: _buildFormField(
                label: 'First Name',
                controller: _firstNameController,
                placeholder: 'Manoj',
                isRequired: true,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: _buildFormField(
                label: 'Last Name',
                controller: _lastNameController,
                placeholder: 'Kumar',
                isRequired: true,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        
        // Phone Field
        _buildFormField(
          label: 'Phone',
          controller: _phoneController,
          placeholder: '1234567842',
          isRequired: true,
          keyboardType: TextInputType.phone,
        ),
        const SizedBox(height: 20),
        
        // Email Field
        _buildFormField(
          label: 'Email',
          controller: _emailController,
          placeholder: 'Manojkumar@gmail.com',
          isRequired: true,
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 20),
        
        // Referral Code Field (Optional)
        _buildFormField(
          label: 'Referral Code',
          controller: _referralCodeController,
          placeholder: 'Enter referral code (optional)',
          isRequired: false,
        ),
        const SizedBox(height: 40),
        
        // Next Button with Loading State
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: authProvider.isLoading ? null : () => _handleSignup(authProvider),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFD700),
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              elevation: 0,
              disabledBackgroundColor: Colors.grey[300],
            ),
            child: authProvider.isLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                    ),
                  )
                : const Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 20),
        
        // Sign In Link
        Center(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 14, color: Colors.grey),
              children: [
                const TextSpan(text: "Already have account ? "),
                WidgetSpan(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Sign in',
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
    );
  }

  Widget _buildFormField({
    required String label,
    required TextEditingController controller,
    required String placeholder,
    bool isRequired = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
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
          keyboardType: keyboardType,
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
            fillColor: Colors.white,
            filled: true,
          ),
        ),
      ],
    );
  }

  void _handleSignup(AuthProvider authProvider) async {
    // Clear any previous errors
    authProvider.clearError();
    
    // Basic client-side validation
    if (_firstNameController.text.trim().isEmpty ||
        _lastNameController.text.trim().isEmpty ||
        _phoneController.text.trim().isEmpty ||
        _emailController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all required fields'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Call the register method from AuthProvider
    await authProvider.register(
      firstName: _firstNameController.text.trim(),
      lastName: _lastNameController.text.trim(),
      phone: _phoneController.text.trim(),
      email: _emailController.text.trim(),
      referalCode: _referralCodeController.text.trim().isEmpty 
          ? null 
          : _referralCodeController.text.trim(),
      context: context,
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _referralCodeController.dispose();
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