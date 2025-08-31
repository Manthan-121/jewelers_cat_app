import 'package:flutter/material.dart';
import '../utils/colors.dart';

class FooterMenu extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const FooterMenu({Key? key, required this.selectedIndex, required this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed, // 🔹 All items visible
      backgroundColor: Colors.white, // 🔹 White footer background
      currentIndex: selectedIndex,
      onTap: onTap,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: Colors.black54,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Wishlist"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
      ],
    );
  }
}
