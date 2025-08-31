import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../widgets/footer_menu.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 1; // 🔹 Profile tab active

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;

      // 🔹 Navigation based on index
      if (index == 0) {
        Navigator.pushReplacementNamed(context, "/home");
      } else if (index == 1) {
        // Already on profile
      } else if (index == 2) {
        Navigator.pushReplacementNamed(context, "/wishlist");
      } else if (index == 3) {
        Navigator.pushReplacementNamed(context, "/cart");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primary,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/app_icon.png"),
            ),
            const SizedBox(width: 10),
            const Text("Application Name"),
          ],
        ),
        actions: const [
          Icon(Icons.favorite, color: Colors.white),
          SizedBox(width: 12),
          Icon(Icons.shopping_cart, color: Colors.white),
          SizedBox(width: 12),
        ],
      ),

      body: ListView(
        children: [
          // 🔹 Profile Header
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/images/app_icon.png"),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "User Name",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text("📞 1234567890"),
                      Text("✉️ useremail@example.com"),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.black54),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EditProfileScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          const Divider(),

          // 🔹 Account Section
          sectionTitle("Account"),
          buildListTile(Icons.shopping_bag, "My Order"),
          buildListTile(Icons.phone, "Contact Us"),
          buildListTile(Icons.logout, "Logout"),

          const Divider(),

          // 🔹 Policy Section
          sectionTitle("Policy"),
          buildListTile(Icons.lightbulb_outline, "Terms & Condition"),
          buildListTile(Icons.security, "Privacy Policy"),
          buildListTile(Icons.shopping_bag_outlined, "Return Policy"),
        ],
      ),

      // 🔹 Footer Menu
      bottomNavigationBar: FooterMenu(
        selectedIndex: _selectedIndex,
        onTap: _onTabTapped,
      ),
    );
  }

  // 🔹 Reusable Section Title
  Widget sectionTitle(String title) {
    return Container(
      width: double.infinity,
      color: AppColors.primary,
      padding: const EdgeInsets.all(8),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }

  // 🔹 Reusable List Tile
  Widget buildListTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.black87),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        // 🔹 Navigation logic here
      },
    );
  }
}
