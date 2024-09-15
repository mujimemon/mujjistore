import 'package:flutter/material.dart';
import 'package:mujjistore/Screen/homepage/bottomnavig.dart';
import 'package:mujjistore/cartmanager.dart';
import 'package:mujjistore/utilize/colors.dart'; // Import the CartManager class

class AddtoCart extends StatelessWidget {
  const AddtoCart({super.key});

  @override
  Widget build(BuildContext context) {
    double totalPrice = CartManager.cartItems.fold(0, (sum, item) {
      return sum + double.parse(item['price']!.replaceAll(RegExp(r'[^0-9.]'), ''));
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
      ),
      body: CartManager.cartItems.isEmpty
          ? const Center(
              child: Text(
                'Your cart is empty',
                style: TextStyle(fontSize: 18),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: CartManager.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = CartManager.cartItems[index];
                      return Card(
                        elevation: 2,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: ListTile(
                          leading: Image.asset(
                            item['image']!,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                          title: Text(item['name']!,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          subtitle: Text(
                            'PKR${item['price']}',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove_circle_outline),
                                onPressed: () {
                                  // Add functionality to decrease quantity
                                },
                              ),
                              Text('1'), // Display quantity here
                              IconButton(
                                icon: Icon(Icons.add_circle_outline),
                                onPressed: () {
                                  // Add functionality to increase quantity
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total:',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          Text('PKR$totalPrice',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to checkout page
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          backgroundColor: AppColors.buttonColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        child: const Text(
                          'Proceed to Checkout',
                          style: TextStyle(fontSize: 16,color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
      bottomNavigationBar: NavigatorMenu(), // Your custom bottom navigation
    );
  }
}

