import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../widgets/footer_menu.dart';
import '../widgets/subcategory_body.dart'; // ✅ new widget

class SubCategoryScreen extends StatefulWidget {
  final String categoryName;

  const SubCategoryScreen({Key? key, required this.categoryName})
      : super(key: key);

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  int _selectedIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> subCategories = [
      "Sub category 1",
      "Sub category 2",
      "Sub category 3",
      "Sub category 4",
      "Sub category 5",
      "Sub category 6",
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(widget.categoryName),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      // ✅ Body moved to widget
      body: SubCategoryBody(subCategories: subCategories),

      bottomNavigationBar: FooterMenu(
        selectedIndex: _selectedIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
