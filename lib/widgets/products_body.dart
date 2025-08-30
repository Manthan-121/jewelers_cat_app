import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../screen/product_detail_screen.dart'; // 🔹 import screen

class ProductsBody extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  const ProductsBody({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.65,
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailScreen(
                  category: "Category",
                  subCategory: "Sub category",
                  productName: product['name'],
                ),
              ),
            );
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔹 Product Image
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/600x300.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Positioned(
                        right: 8,
                        top: 8,
                        child: Icon(
                          Icons.favorite_border,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),

                // 🔹 Product Info
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product['name'],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),

                      // 🔹 Rating
                      Row(
                        children: List.generate(
                          5,
                              (star) => const Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 16,
                          ),
                        ),
                      ),

                      const SizedBox(height: 6),

                      // 🔹 Add to Cart Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text("Add to cart"),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
