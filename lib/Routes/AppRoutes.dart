import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_website/Vendor/CarScreen/CarScreen.dart';
import 'package:vendor_website/Vendor/HomeScreen/HomeScreen.dart';


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