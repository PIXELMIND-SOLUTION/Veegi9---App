// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:veeginine/providers/auth_provider.dart';
// import 'package:veeginine/views/login_screen.dart';
// import 'package:veeginine/views/signup_screen.dart';

// class CreatePassword extends StatefulWidget {
//   final String userId;
//   const CreatePassword({super.key, required this.userId});

//   @override
//   State<CreatePassword> createState() => _CreatePasswordState();
// }

// class _CreatePasswordState extends State<CreatePassword> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _confirmPasswordController = TextEditingController();
  
//   bool _isPasswordVisible = false;
//   bool _isConfirmPasswordVisible = false;
//     final TextEditingController _passwordController = TextEditingController();
//   bool _obscurePassword = true;

//   @override
//   void dispose() {
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     super.dispose();
//   }

//   String? _validatePassword(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Password is required';
//     }
//     if (value.length < 8) {
//       return 'Password must be at least 8 characters long';
//     }
//     if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]').hasMatch(value)) {
//       return 'Password must contain at least one uppercase letter, one lowercase letter, one number, and one special character';
//     }
//     return null;
//   }

//   String? _validateConfirmPassword(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Please confirm your password';
//     }
//     if (value != _passwordController.text) {
//       return 'Passwords do not match';
//     }
//     return null;
//   }

//   void _handleCreatePassword() {
//     if (_formKey.currentState!.validate()) {
//       final authProvider = Provider.of<AuthProvider>(context, listen: false);
//       print("lldsfjlfdj;dfjkdfj;dfjd;fjd;kfjdskfjds;fjds;f");
//       authProvider.setPassword(
//         userId: widget.userId,
//         password: _passwordController.text,
//         context: context,
//       );
//     }
//   }


//     Widget _buildFormSection() {
//     return Container(

//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [

//                     // Password Field
//           _buildFormField(
//             label: 'Password',
//             controller: _passwordController,
//             placeholder: '••••••',
//             isRequired: true,
//             isPassword: true,
//           ),
//           const SizedBox(height: 20),

//           // Confirm Password Field
//           _buildFormField(
//             label: 'Confirm Password',
//             controller: _confirmPasswordController,
//             placeholder: 'Type your password',
//             isRequired: true,
//           ),
//           const SizedBox(height: 20),
                    
//           // Login Button
//           SizedBox(
//             width: double.infinity,
//             child: ElevatedButton(
//               onPressed: _handleCreatePassword,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xFFFFD700),
//                 foregroundColor: Colors.black,
//                 padding: const EdgeInsets.symmetric(vertical: 16),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(60),
//                 ),
//                 elevation: 0,
//               ),
//               child: const Text(
//                 'Register',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),
          
//           // Sign Up Link
//           Center(
//             child: RichText(
//               text: TextSpan(
//                 style: const TextStyle(fontSize: 14, color: Colors.grey),
//                 children: [
//                   const TextSpan(text: "Don't have account ? "),
//                   WidgetSpan(
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
//                       },
//                       child: const Text(
//                         'Register',
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.blue,
//                           decoration: TextDecoration.underline,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }


//   Widget _buildFormField({
//     required String label,
//     required TextEditingController controller,
//     required String placeholder,
//     bool isRequired = false,
//     bool isPassword = false,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         RichText(
//           text: TextSpan(
//             style: const TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.w600,
//               color: Colors.black,
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
//           obscureText: isPassword ? _obscurePassword : false,
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
//             suffixIcon: isPassword
//                 ? IconButton(
//                     icon: Icon(
//                       _obscurePassword ? Icons.visibility_off : Icons.visibility,
//                       color: Colors.grey,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _obscurePassword = !_obscurePassword;
//                       });
//                     },
//                   )
//                 : null,
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.all(20),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   Align(
//                     alignment: Alignment.topLeft,
//                     child: IconButton(
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                       icon: const Icon(Icons.arrow_back_ios),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Image.asset("assets/createpassword.png"),
//                   const SizedBox(height: 30),
//                   const Text(
//                     'Create Your New Password',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 22,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   _buildFormSection(),
//                   const SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text('Already have account?'),
//                       TextButton(
//                         onPressed: () {
//                                                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));

//                         },
//                         child: const Text(
//                           'Sign in',
//                           style: TextStyle(color: Colors.blue),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildRequirement(String text, bool isValid) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 2),
//       child: Row(
//         children: [
//           Icon(
//             isValid ? Icons.check_circle : Icons.cancel,
//             color: isValid ? Colors.green : Colors.red,
//             size: 16,
//           ),
//           const SizedBox(width: 8),
//           Text(
//             text,
//             style: TextStyle(
//               color: isValid ? Colors.green : Colors.red,
//               fontSize: 12,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }







import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veeginine/providers/auth_provider.dart';
import 'package:veeginine/views/login_screen.dart';
import 'package:veeginine/views/signup_screen.dart';

class CreatePassword extends StatefulWidget {
  final String userId;
  const CreatePassword({super.key, required this.userId});

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter, one lowercase letter, one number, and one special character';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  void _handleCreatePassword(AuthProvider authProvider) async {
    if (_formKey.currentState!.validate()) {
      // Clear any previous errors
      authProvider.clearError();
      
      await authProvider.setPassword(
        userId: widget.userId,
        password: _passwordController.text,
        context: context,
      );
      
      // The provider will handle navigation to LoginScreen on success
    }
  }

  Widget _buildFormSection(AuthProvider authProvider) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Password Field
          _buildFormField(
            label: 'Password',
            controller: _passwordController,
            placeholder: '••••••',
            isRequired: true,
            isPassword: true,
            obscureText: _obscurePassword,
            onToggleVisibility: () {
              setState(() {
                _obscurePassword = !_obscurePassword;
              });
            },
            enabled: !authProvider.isLoading,
            validator: _validatePassword,
          ),
          const SizedBox(height: 20),

          // Confirm Password Field
          _buildFormField(
            label: 'Confirm Password',
            controller: _confirmPasswordController,
            placeholder: 'Type your password',
            isRequired: true,
            isPassword: true,
            obscureText: _obscureConfirmPassword,
            onToggleVisibility: () {
              setState(() {
                _obscureConfirmPassword = !_obscureConfirmPassword;
              });
            },
            enabled: !authProvider.isLoading,
            validator: _validateConfirmPassword,
          ),
          const SizedBox(height: 20),
                    
          // Register Button with Loading State
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: authProvider.isLoading ? null : () => _handleCreatePassword(authProvider),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFD700),
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60),
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
                      'Register',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
            ),
          ),
          const SizedBox(height: 20),

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
    bool obscureText = false,
    VoidCallback? onToggleVisibility,
    bool enabled = true,
    String? Function(String?)? validator,
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
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          enabled: enabled,
          validator: validator,
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
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.red),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: enabled ? onToggleVisibility : null,
                  )
                : null,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Create password',
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
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Align(
                      //   alignment: Alignment.topLeft,
                      //   child: IconButton(
                      //     onPressed: authProvider.isLoading ? null : () {
                      //       Navigator.of(context).pop();
                      //     },
                      //     icon: const Icon(Icons.arrow_back_ios),
                      //   ),
                      // ),
                      // const SizedBox(height: 10),
                      Image.asset("assets/createpassword.png"),
                      const SizedBox(height: 20),
                      
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
                      
                      _buildFormSection(authProvider),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Already have account?'),
                          TextButton(
                            onPressed: authProvider.isLoading ? null : () {
                              Navigator.pushReplacement(
                                context, 
                                MaterialPageRoute(builder: (context) => LoginScreen())
                              );
                            },
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                color: authProvider.isLoading ? Colors.grey : Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildRequirement(String text, bool isValid) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Icon(
            isValid ? Icons.check_circle : Icons.cancel,
            color: isValid ? Colors.green : Colors.red,
            size: 16,
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              color: isValid ? Colors.green : Colors.red,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}