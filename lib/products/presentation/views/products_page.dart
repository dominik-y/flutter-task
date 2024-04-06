import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductsPage extends HookConsumerWidget {
  const ProductsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Products',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(42, 45, 53, 1),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Back button icon
          color: Colors.white, // Adjust color as needed
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
        ),
      ),
      backgroundColor: const Color.fromRGBO(42, 45, 53, 1),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                // controller: _passwordTextController,
                decoration: InputDecoration(
                  labelText: 'Search product...',
                  labelStyle: const TextStyle(
                    color: Color.fromRGBO(169, 172, 174, 1),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                style: const TextStyle(
                  color: Color.fromRGBO(169, 172, 174, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// child: const Row(
// children: [
// Icon(Icons.logout),
// Padding(
// padding: EdgeInsets.only(left: 6),
// child: Text('Sign Out'),
// ),
// ],
// ),

// {
// "products": [
// {
// "id": 1,
// "title": "iPhone 9",
// "description": "An apple mobile which is nothing like apple",
// "price": 549,
// "discountPercentage": 12.96,
// "rating": 4.69,
// "stock": 94,
// "brand": "Apple",
// "category": "smartphones",
// "thumbnail": "...",
// "images": ["...", "...", "..."]
// },
// {...},
// {...},
// {...}
// // 30 items
// ],
//
// "total": 100,
// "skip": 0,
// "limit": 30
// }
