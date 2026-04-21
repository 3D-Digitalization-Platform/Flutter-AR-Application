import 'package:flutter/material.dart';
import 'features/auth/ui/login_screen.dart';
import 'features/auth/ui/signup_screen.dart';
import 'features/home/ui/home_screen.dart';
import 'features/profile/ui/profile_screen.dart';
import 'features/marketplace/ui/product_details_screen.dart';
import 'features/marketplace/ui/marketplace_screen.dart';
import 'features/admin/ui/admin_menu_screen.dart';
import 'features/admin/ui/admin_home_screen.dart';
import 'features/admin/ui/admin_pending_requests.dart';
import 'features/admin/ui/admin_pending_posts.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
        '/home': (context) => HomeScreen(),
        '/profile': (context) => ProfileScreen(),
        '/marketplace': (context) => MarketplaceScreen(),
        '/admin': (context) => const AdminMenuScreen(),
        '/admin/home': (context) => AdminHomeScreen(),
        '/admin/pending-requests': (context) => PendingRequestsScreen(),
        '/admin/pending-posts': (context) => const PendingPostsScreen(),
      },
      // Example of handling dynamic product details route
      onGenerateRoute: (settings) {
        if (settings.name == '/product-details') {
          final args = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(productId: args),
          );
        }
        return null;
      },
    );
  }
}
