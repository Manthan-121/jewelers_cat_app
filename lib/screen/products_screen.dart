import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../widgets/footer_menu.dart';
import '../widgets/products_body.dart';

class ProductsScreen extends StatefulWidget {
  final String subCategoryName;

  const ProductsScreen({Key? key, required this.subCategoryName})
      : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  int _selectedIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> products = [
      {"name": "Product name in to three line"},
      {"name": "Product name in to three line"},
      {"name": "Product name in to three line"},
      {"name": "Product name in to three line"},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(widget.subCategoryName),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      // ✅ Products Grid Body
      body: ProductsBody(products: products),

      // ✅ Footer Menu
      bottomNavigationBar: FooterMenu(
        selectedIndex: _selectedIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
