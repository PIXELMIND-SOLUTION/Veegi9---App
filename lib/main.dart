import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veeginine/providers/auth_provider.dart';
import 'package:veeginine/providers/location_provider.dart';
import 'package:veeginine/views/login_screen.dart';
import 'package:veeginine/views/map_waiting_screen.dart';
import 'package:veeginine/views/onboard_screen.dart';
import 'package:veeginine/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
            providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => LocationProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Veeginine',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
