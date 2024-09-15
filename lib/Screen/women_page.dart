import 'package:flutter/material.dart';
import 'package:mujjistore/Screen/homepage/productbuttonpage.dart';
import 'package:mujjistore/utilize/colors.dart';

class WomenPage extends StatelessWidget {
  const WomenPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> products = [
      {
        'image': 'assets/t1.jpg',
        'name': 'Product 1',
        'price': '\$10.00',
        'description': 'This is a description for Product 1.',
      },
      {
        'image': 'assets/t2.jpg',
        'name': 'Product 2',
        'price': '\$15.00',
        'description': 'This is a description for Product 2.',
      },
      {
        'image': 'assets/t3.jpg',
        'name': 'Product 3',
        'price': '\$20.00',
        'description': 'This is a description for Product 3.',
      },
            {
        'image': 'assets/t3.jpg',
        'name': 'Product 3',
        'price': '\$20.00',
        'description': 'This is a description for Product 3.',
      },
      {
        'image': 'assets/tshirt4.jpg',
        'name': 'Product 4',
        'price': '\$25.00',
        'description': 'This is a description for Product 4.',
      },
      // Add more products if needed
    ];

    final bool hasMoreThanFour = products.length > 4;
    final List<Map<String, String>> displayedProducts = hasMoreThanFour
        ? products.sublist(0, 4)
        : products;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: displayedProducts.map((product) {
              return SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 16,
                child: ProductCard(
                  image: product['image']!,
                  name: product['name']!,
                  price: product['price']!,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailsPage(
                          image: product['image']!,
                          name: product['name']!,
                          price: product['price']!,
                          description: product['description']!,
                          onAddToCart: (item) {
                            // Update global cart list
                            cartItems.add(item);
                          },
                        ),
                      ),
                    );
                  },
                ),
              );
            }).toList(),
          ),
        ),
        if (hasMoreThanFour)
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AllWomenProductsPage(products: products),
                ),
              );
            },
           style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.buttonColor,
            ),
            child: Text('See All',style: TextStyle(color: Colors.white),),
          ),
      ],
    );
  }
}

class AllWomenProductsPage extends StatelessWidget {
  final List<Map<String, String>> products;

  AllWomenProductsPage({required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Women Products'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: products.map((product) {
              return SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 16,
                child: ProductCard(
                  image: product['image']!,
                  name: product['name']!,
                  price: product['price']!,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailsPage(
                          image: product['image']!,
                          name: product['name']!,
                          price: product['price']!,
                          description: product['description']!,
                          onAddToCart: (item) {
                            // Update global cart list
                            cartItems.add(item);
                          },
                        ),
                      ),
                    );
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
