import 'package:flutter/material.dart';
enum Product {
  dart(
    title: "Dart",
    image: "assets/images/dart.png",
    description: "the best object langauge"
  ),
  flutter(
    title: "Flutter",
    image: "assets/images/flutter.png",
    description: "the best mobile widget library"
  ),
  firebase(
    title: "Firebase",
    image: "assets/images/firebase.png",
    description: "the best cloud database"
  );

  final String title;
  final String description;
  final String image;

  const Product({
    required this.title,
    required this.description,
    required this.image,
  });
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          backgroundColor: Color(0xffEFBBCDFF),
          title: Text("Products"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ProductCard(product: Product.dart),
              ProductCard(product: Product.flutter),
              ProductCard(product: Product.firebase),
            ],
          ),
        ),
      ),
    ),
  );
}

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({Key? key, required this.product});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(product.image, width: 50),
            SizedBox(height: 10),
            Text(
              product.title,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(product.description),
          ],
        ),
      ),
    );
  }
}
