import 'package:flutter/material.dart';
import '../widgets/dash_card.dart';
import '../widgets/footer_menu.dart';
import '../utils/colors.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      // 🔹 Open Profile
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ProfileScreen()),
      );
    }
    // else if (index == 2) { open wishlist }
    // else if (index == 3) { open cart }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // 🔹 removes back button
        backgroundColor: AppColors.primary,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/app_icon.png"),
            ),
            SizedBox(width: 10),
            Text("Jewelry App"),
            Spacer(),
            Icon(Icons.favorite),
            SizedBox(width: 15),
            Icon(Icons.shopping_cart),
          ],
        ),
      ),
      body: CategoriesBody(), // 🔹 imported body file
      bottomNavigationBar: FooterMenu(
        selectedIndex: _selectedIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
