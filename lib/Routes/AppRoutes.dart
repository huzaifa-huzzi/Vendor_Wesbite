import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_website/AppBars/AppDrawer.dart';
import 'package:vendor_website/AppBars/WebAppBar.dart';
import 'package:vendor_website/Resources/Keys.dart';
import 'package:vendor_website/Vendor/HomeScreen/HomeScreen.dart';


class AppNavigation {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      // ShellRoute ab sirf child return karega, koi extra Scaffold ya AppBar nahi
      ShellRoute(
        builder: (context, state, child) {
          return child; // Isse double AppBars/Drawers ka masla hal ho jayega
        },
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/cars',
            builder: (context, state) => const Center(child: Text("Cars List")),
          ),
          GoRoute(
            path: '/services',
            builder: (context, state) => const Center(child: Text("Services")),
          ),
          GoRoute(
            path: '/About',
            builder: (context, state) => const Center(child: Text("About Us")),
          ),
          GoRoute(
            path: '/FAQs',
            builder: (context, state) => const Center(child: Text("Faqs")),
          ),
        ],
      ),
    ],
  );
}