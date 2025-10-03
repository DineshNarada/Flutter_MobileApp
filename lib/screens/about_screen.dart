import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'DogFood',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'A mobile app designed to provide premium dog food products tailored to your dog\'s life stage and needs. Discover a wide range of high-quality dog foods, educational content on dog nutrition, videos, and more.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 24),
            const Text(
              'Features',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildFeatureItem(
              icon: Icons.list,
              title: 'Product Catalog',
              description: 'Browse and purchase a variety of dog food products suitable for puppies, adults, and seniors.',
            ),
            _buildFeatureItem(
              icon: Icons.shopping_cart,
              title: 'Shopping Cart',
              description: 'Easily manage your orders and checkout with secure payment options.',
            ),
            _buildFeatureItem(
              icon: Icons.person,
              title: 'User Profile',
              description: 'Update your personal information and preferred payment methods.',
            ),
            _buildFeatureItem(
              icon: Icons.school,
              title: 'Education',
              description: 'Learn about essential nutrients and best practices for dog nutrition and care.',
            ),
            _buildFeatureItem(
              icon: Icons.pets,
              title: 'Dog Breeds Guide',
              description: 'Get information on different dog breeds and their specific nutritional needs.',
            ),
            _buildFeatureItem(
              icon: Icons.video_library,
              title: 'Video Gallery',
              description: 'Watch educational videos on dog health, nutrition, and training.',
            ),
            const SizedBox(height: 24),
            const Text(
              'Version',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '1.0.0',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Text(
              'Built with Flutter',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
      ),
    );
  }
}
