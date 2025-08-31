import 'package:flutter/material.dart';
import 'screen/splash_screen.dart';
import 'screen/dashboard_screen.dart';
import 'screen/profile_screen.dart';
// import 'screen/wishlist_screen.dart';
// import 'screen/cart_screen.dart';
import 'utils/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Jewelers App",

      // 🔹 App start point
      initialRoute: "/",
      routes: {
        "/": (context) => SplashScreen(), // default start
        "/home": (context) => HomeScreen(),
        "/profile": (context) => ProfileScreen(),
        // "/wishlist": (context) => WishlistScreen(),
        // "/cart": (context) => CartScreen(),
      },

      theme: ThemeData(
        primaryColor: AppColors.primary,

        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          labelStyle: TextStyle(color: const Color.fromARGB(218, 0, 0, 0)),
        ),

        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColors.primary,
        ),

        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.textDark,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}
