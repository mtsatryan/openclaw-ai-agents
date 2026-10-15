import 'dart:async';

class Product {
  final String id;
  final String title;
  final String description;
  final double price;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'price': price,
      };
}

class ApiService {
  // Simulated database / backend store
  final List<Product> _products = [
    Product(
      id: '1',
      title: 'Flutter Developer Guide',
      description: 'Complete reference for modern cross-platform development.',
      price: 29.99,
    ),
    Product(
      id: '2',
      title: 'Cloud Architecture Handbook',
      description: 'Designing scalable microservices and serverless apps.',
      price: 39.99,
    ),
  ];

  Future<List<Product>> fetchProducts() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return List.from(_products);
  }

  Future<Product> addProduct(String title, String description, double price) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final newProduct = Product(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      description: description,
      price: price,
    );
    _products.add(newProduct);
    return newProduct;
  }
}
