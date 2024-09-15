import 'package:flutter/material.dart';
import 'package:mujjistore/Screen/global_wishlist.dart'; 
import 'package:mujjistore/Screen/homepage/bottomnavig.dart';
import 'package:mujjistore/Screen/homepage/productbuttonpage.dart';
class WishlistView extends StatefulWidget {
  const WishlistView({super.key});

  @override
  State<WishlistView> createState() => _WishlistViewState();
  
}

class _WishlistViewState extends State<WishlistView> {
  List<Map<String, String>> cartItems = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Wishlist',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
      ),
      body: wishlistItems.isEmpty
          ? const Center(
              child: Text('Your wishlist is empty'),
            )
          : ListView.builder(
              itemCount: wishlistItems.length,
              itemBuilder: (context, index) {
                final item = wishlistItems[index];
                return ListTile(
                  leading: Image.asset(item['image']!),
                  title: Text(item['name']!),
                  subtitle: Text(item['price']!),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailsPage(
                          image: item['image']!,
                          name: item['name']!,
                          price: item['price']!,
                          description: item['description']!,
                          onAddToCart: (item) {
                            // Update global cart list
                            setState(() {
                              cartItems.add(item);
                            });
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
      bottomNavigationBar: NavigatorMenu(),
    );
  }
}
