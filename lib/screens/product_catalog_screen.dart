import 'package:flutter/material.dart';
import 'package:dogfood_new/models/product.dart';
import 'package:dogfood_new/data/products.dart';
import 'package:dogfood_new/screens/product_detail_screen.dart';

class ProductCatalogScreen extends StatefulWidget {
  const ProductCatalogScreen({Key? key}) : super(key: key);

  @override
  ProductCatalogScreenState createState() => ProductCatalogScreenState();
}

class ProductCatalogScreenState extends State<ProductCatalogScreen> {
  List<Product> displayedProducts = products;
  String? selectedBrand;
  int? selectedAgeGroup;
  bool sortByPriceAsc = true;

  void filterAndSort() {
    List<Product> filtered = products;

    if (selectedBrand != null) {
      filtered = filtered.where((p) => p.brand == selectedBrand).toList();
    }
    if (selectedAgeGroup != null) {
      filtered = filtered.where((p) => p.ageGroup == selectedAgeGroup).toList();
    }
    filtered.sort((a, b) =>
        sortByPriceAsc ? a.price.compareTo(b.price) : b.price.compareTo(a.price));

    setState(() {
      displayedProducts = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    final brands = products.map((p) => p.brand).toSet().toList();
    final ageGroups = {
      0: 'Puppy',
      1: 'Adult',
      2: 'Senior',
    };

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              DropdownButton<String>(
                hint: const Text('Brand'),
                value: selectedBrand,
                items: [null, ...brands].map((brand) {
                  return DropdownMenuItem<String>(
                    value: brand,
                    child: Text(brand ?? 'All'),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedBrand = value;
                    filterAndSort();
                  });
                },
              ),
              const SizedBox(width: 16),
              DropdownButton<int>(
                hint: const Text('Age Group'),
                value: selectedAgeGroup,
                items: [null, 0, 1, 2].map((age) {
                  return DropdownMenuItem<int>(
                    value: age,
                    child: Text(age == null ? 'All' : ageGroups[age]!),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedAgeGroup = value;
                    filterAndSort();
                  });
                },
              ),
              const SizedBox(width: 16),
              IconButton(
                icon: Icon(sortByPriceAsc ? Icons.arrow_upward : Icons.arrow_downward),
                onPressed: () {
                  setState(() {
                    sortByPriceAsc = !sortByPriceAsc;
                    filterAndSort();
                  });
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(8),
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.75),
            itemCount: displayedProducts.length,
            itemBuilder: (context, index) {
              final product = displayedProducts[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductDetailScreen(product: product),
                    ),
                  );
                },
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Image.asset(
                          product.imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => const Center(child: Icon(Icons.broken_image)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          product.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text('Rs ${product.price.toStringAsFixed(0)}'),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

