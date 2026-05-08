import 'package:go_router/go_router.dart';
import 'package:vendor_website/Vendor/AboutUs/AboutUs.dart';
import 'package:vendor_website/Vendor/CarScreen/Car%20Detail/CarDetail.dart';
import 'package:vendor_website/Vendor/CarScreen/CarScreen.dart';
import 'package:vendor_website/Vendor/Faqs/Faqs.dart';
import 'package:vendor_website/Vendor/HomeScreen/HomeScreen.dart';
import 'package:vendor_website/Vendor/Services/Services.dart';


class AppNavigation {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return child;
        },
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/cars',
            builder: (context, state) => CarScreen()),
          GoRoute(
              path: '/CarDetail',
              builder: (context, state) => CarDetailScreen()),
          GoRoute(
            path: '/services',
            builder: (context, state) => ServicesScreen()),
          GoRoute(
            path: '/About',
            builder: (context, state) => AboutUsScreen()),
          GoRoute(
            path: '/FAQs',
            builder: (context, state) => FaqsScreen()),
        ],
      ),
    ],
  );
}