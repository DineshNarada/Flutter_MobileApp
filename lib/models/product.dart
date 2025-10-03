class Product {
  final String id;
  final String name;
  final String brand;
  final String description;
  final double price;
  final String imageUrl;
  final List<String> reviews;
  final double rating;
  final int ageGroup;

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
