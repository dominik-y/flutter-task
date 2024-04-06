import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rolla_task/resources.dart';

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
        backgroundColor: AppColor.neutral1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
        ),
      ),
      backgroundColor: AppColor.neutral1,
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
                    color: AppColor.neutral4,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                style: const TextStyle(
                  color: AppColor.neutral4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
