import 'package:flutter/material.dart';
import 'package:mujjistore/Screen/all_page.dart';
import 'package:mujjistore/Screen/checkout.dart';
import 'package:mujjistore/Screen/global_wishlist.dart';
import 'package:mujjistore/Screen/men_page.dart';

import 'package:mujjistore/Screen/newest_page.dart';
import 'package:mujjistore/Screen/popular_page.dart';
import 'package:mujjistore/Screen/women_page.dart';
import 'package:mujjistore/cartmanager.dart';
import 'package:mujjistore/utilize/colors.dart'; // Import your color definitions

class ProductButtonPage extends StatefulWidget {
  const ProductButtonPage({super.key});

  @override
  State<ProductButtonPage> createState() => _ProductButtonPageState();
}

class _ProductButtonPageState extends State<ProductButtonPage> {
  int selectedPageIndex = 0;

  // List of pages that will be displayed based on the selected index
  final List<Widget> pages = [
    AllPage(),
    NewestPage(),
    PopularPage(),
    MenPage(),
    WomenPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Button Row
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildButton("All", 0),
                  const SizedBox(width: 3),
                  _buildButton("Newest", 1),
                  const SizedBox(width: 3),
                  _buildButton("Popular", 2),
                  const SizedBox(width: 3),
                  _buildButton("Men", 3),
                  const SizedBox(width: 3),
                  _buildButton("Women", 4),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),

          // Flexible widget allows the content below to take up the remaining space if needed
          Flexible(
            fit: FlexFit.loose,
            child: pages[selectedPageIndex], // Display the selected page
          ),
        ],
      ),
    );
  }

  // Helper method to build each button with custom styling
  Widget _buildButton(String label, int index) {
    final isSelected = selectedPageIndex == index;
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedPageIndex = index;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? AppColors.buttonColor : Colors.white,
        side: BorderSide(
          color: isSelected ? Colors.transparent : Colors.grey,
          width: 1.0,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}

List<Map<String, String>> cartItems = [];

class ProductCard extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  final VoidCallback onTap;

  ProductCard({
    required this.image,
    required this.name,
    required this.price,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8.0), // Add margin around the card
        decoration: BoxDecoration(
          color: Colors.white, // Card background color
          borderRadius: BorderRadius.circular(8.0), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 180.0, // Fixed height for the image
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                price,
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  final String description;
  final void Function(Map<String, String>) onAddToCart;

  ProductDetailsPage({
    required this.image,
    required this.name,
    required this.price,
    required this.description,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(image),
              const SizedBox(height: 8.0),
              Text(name, style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8.0),
              Text(price, style: TextStyle(fontSize: 20.0, color: Colors.grey[600])),
              const SizedBox(height: 16.0),
              Text(description.isNotEmpty ? description : 'No description available', style: const TextStyle(fontSize: 16.0)),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      CartManager.addToCart({
                        'image': image,
                        'name': name,
                        'price': price,
                        'description': description,
                      });
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$name added to Cart')));
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: AppColors.buttonColor),
                    child: const Text('Add to Cart', style: TextStyle(color: Colors.white)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle adding to wishlist
                      wishlistItems.add({
                        'image': image,
                        'name': name,
                        'price': price,
                        'description': description,
                      });
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$name added to Wishlist')));
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: AppColors.buttonColor),
                    child: const Text('Add to Wishlist', style: TextStyle(color: Colors.white)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BuyNow(image: image, name: name, price: price),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: AppColors.buttonColor),
                    child: const Text('Buy Now', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
