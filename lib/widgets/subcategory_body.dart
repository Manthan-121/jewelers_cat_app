import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../screen/products_screen.dart';

class SubCategoryBody extends StatelessWidget {
  final List<String> subCategories;

  const SubCategoryBody({Key? key, required this.subCategories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: subCategories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 per row
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.9,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductsScreen(
                  subCategoryName: subCategories[index],
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
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/600x300.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: AppColors.primary,
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    subCategories[index],
                    style: const TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
