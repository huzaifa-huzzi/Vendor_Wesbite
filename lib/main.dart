import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:get/get.dart';
import 'package:vendor_website/Resources/Theme.dart';
import 'package:vendor_website/Routes/AppRoutes.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: TAppTheme.lightTheme(context),

      // GoRouter Configuration
      routerDelegate: AppNavigation.router.routerDelegate,
      routeInformationParser: AppNavigation.router.routeInformationParser,
      routeInformationProvider: AppNavigation.router.routeInformationProvider,
    );
  }
}