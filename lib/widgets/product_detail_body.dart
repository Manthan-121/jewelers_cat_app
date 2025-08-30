import 'package:flutter/material.dart';
import '../utils/colors.dart';

class ProductDetailBody extends StatelessWidget {
  final String category;
  final String subCategory;
  final String productName;
  final String productDetails;

  const ProductDetailBody({
    Key? key,
    required this.category,
    required this.subCategory,
    required this.productName,
    required this.productDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Product Image
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: AssetImage("assets/images/600x300.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // 🔹 Breadcrumb
          Text(
            "$category > $subCategory >",
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 8),

          // 🔹 Product Name
          Text(
            productName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),

          // 🔹 Product Details
          Text(
            productDetails,
            style: const TextStyle(fontSize: 16),
          ),

          const SizedBox(height: 20),

          // 🔹 Add to cart button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Added to cart")),
                );
              },
              child: const Text("Add to cart"),
            ),
          ),
        ],
      ),
    );
  }
}
