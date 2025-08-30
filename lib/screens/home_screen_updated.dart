import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dogfood_new/services/auth_service.dart';
import 'package:dogfood_new/screens/product_catalog_screen.dart';
import 'package:dogfood_new/screens/cart_screen.dart';
import 'package:dogfood_new/screens/profile_screen.dart';
import 'package:dogfood_new/screens/education_screen.dart';
import 'package:dogfood_new/screens/video_gallery_screen.dart';
import 'package:dogfood_new/screens/dog_breeds_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    const ProductCatalogScreen(),
    const CartScreen(),
    const ProfileScreen(),
    const EducationScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _navigateToDogBreeds() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const DogBreedsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('DogFood'),
        actions: [
          IconButton(
            icon: const Icon(Icons.pets),
            onPressed: _navigateToDogBreeds,
            tooltip: 'Dog Breeds Guide',
          ),
          IconButton(
            icon: const Icon(Icons.video_library),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const VideoGalleryScreen(),
                ),
              );
            },
            tooltip: 'Video Gallery',
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await authService.signOut();
            },
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Products'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Education'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
