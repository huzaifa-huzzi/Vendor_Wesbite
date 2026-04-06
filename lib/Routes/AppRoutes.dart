import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_website/AppBars/WebAppBar.dart';

class AppNavigation {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [

      ShellRoute(
        builder: (context, state, child) {
          return Scaffold(
            appBar: const WebAppBar(),
            body: child,
          );
        },
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const Center(child: Text("Home Page")), // Replace with HomePage()
          ),
          GoRoute(
            path: '/cars',
            builder: (context, state) => const Center(child: Text("Cars Page")),
          ),
          // Baki routes bhi isi tarah add honge
        ],
      ),

      // Login page bina AppBar ke (agar zaroorat ho)
      GoRoute(
        path: '/login',
        builder: (context, state) => const Center(child: Text("Login Page")),
      ),
    ],
  );
}