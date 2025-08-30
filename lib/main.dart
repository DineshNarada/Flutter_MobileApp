import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:dogfood_new/screens/login_screen.dart';
import 'package:dogfood_new/screens/home_screen.dart';
import 'package:dogfood_new/services/auth_service.dart';
import 'package:dogfood_new/services/cart_service.dart';
import 'package:dogfood_new/services/user_profile_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const DogFoodApp());
}

class DogFoodApp extends StatelessWidget {
  const DogFoodApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthService>(
          create: (_) => AuthService(),
        ),
        ChangeNotifierProvider<CartService>(
          create: (_) => CartService(),
        ),
        Provider<UserProfileService>(
          create: (_) => UserProfileService(),
        ),
      ],
      child: MaterialApp(
        title: 'DogFood',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: const Color(0xFFF5F5F5), // light grey background
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
            secondary: Colors.orangeAccent, // accent color for buttons etc.
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orangeAccent, // button background color
              foregroundColor: Colors.white, // button text color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
          ),
        ),
        home: const AuthWrapper(),
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder(
      stream: authService.authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;
          if (user == null) {
            return const LoginScreen();
          } else {
            return const HomeScreen();
          }
        }
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
