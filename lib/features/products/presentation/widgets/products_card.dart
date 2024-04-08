import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rolla_task/resources.dart';

class ProductsCard extends HookConsumerWidget {
  int? id;
  final String title;
  String? brand;
  double? price;

  ProductsCard({
    super.key,
    required this.title,
    this.id,
    this.brand,
    this.price,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: AspectRatio(
        aspectRatio: 6 / 2,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: AppColor.neutral2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Item: $title',
                  style: const TextStyle(color: AppColor.white),
                ),
                Text(
                  'Brand: $brand' ?? '',
                  style: const TextStyle(color: AppColor.white),
                ),
                Text(
                  'Price: $price',
                  style: const TextStyle(color: AppColor.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
