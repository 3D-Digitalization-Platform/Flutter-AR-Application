import 'package:flutter/material.dart';
import "views/login_screen.dart";
import "views/signup_screen.dart";
import "views/home_screen.dart";
import "views/profile_screen.dart";
import "views/product_details_screen.dart";
import "views/marketplace_screen.dart";
import "admin/admin_menu_screen.dart";
import "admin/admin_home_screen.dart";
import "admin/admin_pending_requests.dart";
import "admin/admin_pending_posts.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PendingRequestsScreen(),
    );
  }
}

