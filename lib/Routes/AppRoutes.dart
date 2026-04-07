import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_website/AppBars/AppDrawer.dart';
import 'package:vendor_website/AppBars/WebAppBar.dart';
import 'package:vendor_website/Resources/Keys.dart';


class AppNavigation {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return Scaffold(
            key: AppKeys.scaffoldKey,
            appBar: const WebAppBar(),
            drawer: const AppDrawer(),
            body: child,
          );
        },
        routes: [
          GoRoute(path: '/', builder: (context, state) => const Center(child: Text("Home Content"))),
          GoRoute(path: '/cars', builder: (context, state) => const Center(child: Text("Cars List"))),
          GoRoute(path: '/services', builder: (context, state) => const Center(child: Text("Services"))),
          GoRoute(path: '/About', builder: (context, state) => const Center(child: Text("About Us"))),
          GoRoute(path: '/FAQs', builder: (context, state) => const Center(child: Text("Faqs"))),
        ],
      ),
    ],
  );
}