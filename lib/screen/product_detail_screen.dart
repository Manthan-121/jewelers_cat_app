import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../widgets/footer_menu.dart';
import '../widgets/product_detail_body.dart';

class ProductDetailScreen extends StatefulWidget {
  final String category;
  final String subCategory;
  final String productName;

  const ProductDetailScreen({
    Key? key,
    required this.category,
    required this.subCategory,
    required this.productName,
  }) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _selectedIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(widget.productName),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      // ✅ Body
      body: ProductDetailBody(
        category: widget.category,
        subCategory: widget.subCategory,
        productName: widget.productName,
        productDetails: "This is a detailed description about the product.",
      ),

      // ✅ Footer
      bottomNavigationBar: FooterMenu(
        selectedIndex: _selectedIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
