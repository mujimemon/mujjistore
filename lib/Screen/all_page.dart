import 'package:flutter/material.dart';
import 'package:mujjistore/Screen/homepage/productbuttonpage.dart';
import 'package:mujjistore/utilize/colors.dart';

class AllPage extends StatelessWidget {
  final List<Map<String, String>> products = [
    {
      'image': 'assets/tshirt1.jpg',
      'name': 'Gildan Blank T-Shirt - Unisex Style 5000 Adult',
      'price': '\$6.00',
      'description':
          'Crafted from soft, durable cotton, the Gildan 5000 Unisex T-Shirt offers comfort and a classic fit for everyday wear. Its double-needle stitching ensures long-lasting durability, perfect for both casual and active lifestyles.',
    },
    {
      'image': 'assets/tshirt2.jpg',
      'name': 'Nautica Mens Solid Crew Neck Short-Sleeve Pocket T-Shirt',
      'price': '\$17.00',
      'description':
          'The Nautica Mens Solid Crew Neck T-Shirt features a soft, breathable fabric for all-day comfort. Complete with a chest pocket and a timeless crew neck design, it’s a versatile essential for casual wear.',
    },
    {
      'image': 'assets/tshirt3.jpg',
      'name':
          'Gildan Unisex-Adult Ultra Cotton T-Shirt With Pocket, Style G2300, 2-Pack',
      'price': '\$20.00',
      'description':
          'The Gildan Ultra Cotton T-Shirt, Style G2300, offers a heavyweight feel with added comfort, featuring a convenient chest pocket. This durable 2-pack is perfect for everyday wear, blending style with practicality.',
    },
    {
      'image': 'assets/tshirt4.jpg',
      'name':
          'Legendary Whitetails Mens Portage Moisture Wicking UPF Sun Protection Hooded Performance Long Sleeve T-Shirt',
      'price': '\$25.00',
      'description':
          'Legendary Whitetails Mens Portage Hooded T-Shirt features moisture-wicking fabric and UPF sun protection, perfect for outdoor activities. Lightweight and breathable with long sleeves and a hood for extra coverage.',
    },
    {
      'image': 'assets/tshirt2.jpg',
      'name': 'Custom Graphic Tee - Limited Edition',
      'price': '\$22.00',
      'description':
          'Stand out with this limited edition graphic tee, featuring a unique design and premium print quality. Ideal for making a fashion statement or adding to your collection.',
    },
    {
      'image': 'assets/tshirt1.jpg',
      'name': 'Classic Polo Shirt - Elegant Fit',
      'price': '\$30.00',
      'description':
          'The Classic Polo Shirt combines elegance and comfort with its soft fabric and tailored fit. Perfect for both casual and semi-formal occasions.',
    },
    {
      'image': 'assets/tshirt2.jpg',
      'name': 'Sporty Workout T-Shirt - Breathable Fabric',
      'price': '\$18.00',
      'description':
          'Designed for active lifestyles, this sporty workout t-shirt offers breathability and flexibility. Ideal for exercise and outdoor activities.',
    },
    {
      'image': 'assets/tshirt1.jpg',
      'name': 'Vintage Wash T-Shirt - Retro Style',
      'price': '\$24.00',
      'description':
          'Embrace retro fashion with this vintage wash t-shirt. The unique fading and soft texture make it a stylish choice for a laid-back look.',
    },
  ];

  @override
  Widget build(BuildContext context) {
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
                            print('Added to cart: ${item['name']}');
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
                  builder: (context) => AllProductsPage(products: products),
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

class AllProductsPage extends StatelessWidget {
  final List<Map<String, String>> products;

  AllProductsPage({required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Products'),
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
                            print('Added to cart: ${item['name']}');
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
