class Product {
  final String id;
  final String name;
  final String brand;
  final String description;
  final double price;
  final String imageUrl;
  final List<String> reviews;
  final double rating; // Star rating from 1.0 to 5.0
  final int ageGroup; // e.g., 0 for puppy, 1 for adult, 2 for senior

  Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.reviews,
    required this.rating,
    required this.ageGroup,
  });
}
